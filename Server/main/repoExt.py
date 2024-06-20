import sys
import os
import subprocess
from zipfile import ZipFile
from flask import *
#from respuestas.respuestas_json import response_json
from werkzeug.utils import secure_filename


app = Flask(__name__)

routes_files = Blueprint("routes_file", __name__)


PATH_FILE = "/home/miguel/Escritorio/repoExterno/Files/" #RUTA DONDE ALMACENAMOS LOS ARCHIVOS A DESCARGAR SI NO ESTAN EN LOCAL

#FUNCIONES QUE VAMOS A UTILIZAR EN EL REPOSITORIO EXTERNO

def existeFicheroLocal(fichero):
    # Cogemos el fichero y le añadimos un .c para compilarlo
    # ficheroFinal = fichero + ".c"
    ficheroFinal = fichero
    # Obtenemos el directorio actual
    # repositorioLocal = "/home/miguel/Escritorio/repoLocal/Files"
    repositorioLocal = "../Files"
    # Unimos el directorio actual al nombre del fichero .c para hacer la ruta completa
    rutaArchivo = os.path.join(repositorioLocal, ficheroFinal)
    # Devolvemos True si se encuentra
    return os.path.isfile(rutaArchivo)


#Funcion para modificar el archivo en caso de tener mapas
def modFichero(fichero):
    #Lo primero que tenemos que saber es si tiene mapas. 
    fichero = fichero + ".c"
    fichjson = fichero.rstrip(fichero[-2:])
    fichjson = fichjson + ".json"
    if (existeFicheroLocal(fichjson)):
        fichjson = os.path.join("../Files/", fichjson)
        fichero = os.path.join("../Files/", fichero)
        with open(fichjson, "r") as ficheroDescr:
            informacion = json.load(ficheroDescr)
        #Si tiene mapas, pasamos a modificar el fichero
        if "maps" in informacion:
            pineadoAutomatico = False
            with open(fichero, "r") as ficheroC:
                lineas = ficheroC.readlines()
            for linea in lineas:
                if "__uint(type, BPF_MAP_TYPE_ARRAY)" in linea:
                    pineadoAutomatico = True
                    break
            if pineadoAutomatico == False:
                with open(fichero, 'w') as ficheroFinal:
                    for line in lineas:
                        #es un indicio de que estamos declarando un mapa y comprobamos si esta escrito antes o despues de la declaracion de mapa
                        if "__uint(pinning, LIBBPF_PIN_BY_NAME)" in line:
                            ficheroFinal.write("")
                        elif ("__uint(type, BPF_MAP" in line) or ("__uint(type,BPF_MAP" in line):
                            ficheroFinal.write(line)
                            ficheroFinal.write("        __uint(pinning, LIBBPF_PIN_BY_NAME);")
                            ficheroFinal.write("\n")
                        elif "__uint(pinning, LIBBPF_PIN_BY_NAME)" in line:
                            fichero.write("")
                        else:
                            ficheroFinal.write(line)
            else:
                print("Ya esta la declaracion hecha")
        else:
            print("Fichero sin mapas")


#Funcion para modificar el makefile
def modMake(makefile, fichero):
    try:
        with open(makefile, 'r') as ficheroEntrada:
            lines = ficheroEntrada.readlines()
        with open(makefile, 'w') as ficheroSalida:
            for line in lines:
                if line.strip().startswith("XDP_TARGETS"):
                    if(not fichero=="xdp-loader.c"):
                        ficheroSalida.write("XDP_TARGETS  := " + fichero  + "\n")
                        print("Se ha reemplazado el fichero con éxito")
                    else:
                        #EN CASO DE QUE SOLO SE QUIERA COMPILAR EL CARGADOR :)
                        ficheroSalida.write("XDP_TARGETS  := "+ "\n")
                        print("Se ha compilado el cargador con éxito")
                else:
                    ficheroSalida.write(line)
        
    except FileNotFoundError:
        print("Archivo no encontrado")



def compilar_makefile():
    try:
        # Ejecuta el comando 'make' en la terminal
        subprocess.run(["make", "-C", "../Files"], check=True)
        print("¡El makefile se ha compilado correctamente!")
    except subprocess.CalledProcessError:
        print("Error al compilar el makefile. Asegúrate de que 'make' esté instalado en tu sistema.")


@app.route("/")
def home():
        return "Welcome to eBPF Hub"

@app.route("/quienSoy")
def quienSoy():
    return render_template("quienSoy.html")



@app.get("/download/<string:name_file>")
def download_file(name_file):
    return send_from_directory("../Files/", path=name_file, as_attachment=True) #Le ponemos el as_attachment porque vamos a querer descargarlo


@app.get("/downloadExecutable/<string:name_file>")
def download_exec(name_file):
    codeFile = name_file + ".c"
    if (existeFicheroLocal(codeFile)):
        modMake("../Files/Makefile", name_file)
        modFichero(name_file)
        compilar_makefile()
        name_file = name_file + ".o"
        print(name_file)
        return send_from_directory("../Files", path=name_file, as_attachment=True) #Le ponemos el as_attachment porque vamos a querer descargarlo
    else:
        return("Error")



@app.get("/downloadAll/<string:name_file>")
def downloadAll_file(name_file):
    archivos = []
    sourcesList = []
    infofile = name_file + ".json"
    file_path = os.path.join("../Files/", infofile)
    if (existeFicheroLocal(infofile)):
        with open(file_path, 'r') as ficheroDescr:
            info = json.load(ficheroDescr)
        if "sources" in info:
            sourcesValues = info.get("sources")
            sourcesList = sourcesValues.split(", ")

    for nombreArchivo in os.listdir("../Files/"):
        if nombreArchivo.startswith(name_file):
            archivos.append(nombreArchivo)
        elif len(sourcesList)>0:
            if(nombreArchivo in sourcesList):
                archivos.append(nombreArchivo)
    # Crear un archivo ZIP con los archivos encontrados
    zip_filename = f"{name_file}_archivos.zip"
    with ZipFile(zip_filename, "w") as zip_file:
        for archivo in archivos:
            zip_file.write(os.path.join("../Files/", archivo), archivo)

    # Enviar el archivo ZIP como descarga
    response = make_response(send_file(zip_filename, as_attachment=True))
    response.headers["Content-Disposition"] = f"attachment; filename={zip_filename}"
    return response

#Método del servidor para realizar una descarga de archivo
@app.route("/upload/<string:name_file>", methods=['POST'])
def upload_file(name_file):
    try:
        uploaded_file = request.files[name_file]
        if uploaded_file:
            filename = secure_filename(uploaded_file.filename)
            file_path = os.path.join("../Files/", filename)
            #Si no se encuentra el archivo, lo guardamos en el directorio
            if (not os.path.isfile(file_path)):
                uploaded_file.save(file_path)
                return "Archivo subido con éxito"
            else:
            #Si está, devolvemos copia y no lo guardamos
                return"copia"
    except FileNotFoundError:
        return "Error al subir el archivo"


@app.route("/info/<string:name_file>")
def send_maps(name_file):
    try:
        name_file = name_file + ".json"
        file_path = os.path.join("../Files/", name_file)
        if (os.path.isfile(file_path)):
            with open(file_path, 'r') as ficheroDescr:
                payload = json.load(ficheroDescr)
                return payload
        else:
            return "No info file"
    except FileNotFoundError:
        return "Error al abrir archivo"


#Método para listar los elementos del repositorio externo
@app.route("/listall")
def list_files():
    try:
        result = subprocess.run(["ls", "../Files"], stdout=subprocess.PIPE, text=True)
        listaca = result.stdout
        return listaca
    except:
        return "Error al listar el repositorio"

@app.route("/list")
def list_func():
    archivos = []
    for archivo in os.listdir("../Files/"):
        if archivo.endswith(".c"):
            # Elimina los últimos dos caracteres (la extensión .c)
            archivos.append(archivo[:-2])  
    return archivos

@app.route("/remove/<string:name_file>")
def remove_file(name_file):
    try:
        #file_path = os.path.join(PATH_FILE, name_file)
        if (existeFicheroLocal(name_file)):
            subprocess.run(["rm", "../Files/" + name_file], check=True)
            return  name_file + " successfully deleted from the external repository."
        else:
            return name_file + " not found in the external repository"
    except:
        return "Error al borrar " + name_file


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)