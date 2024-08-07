import sys
import os
import requests
import subprocess
import zipfile
import time
import json

# Function to check if a file is in the local repository
def fileExists(fichero):
    ficheroFinal = fichero
    repositorioLocal = "../Files"
    # Join the local repository with the file
    rutaArchivo = os.path.join(repositorioLocal, ficheroFinal)
    # True if it is in the local repository
    return os.path.isfile(rutaArchivo)

# Function to disable printing
def disablePrinting():
    sys.stdout = open(os.devnull, 'w')

# Function to enable printing
def enablePrinting():
    sys.stdout = sys.__stdout__

# Funcion to upload a file to the external repository
def uploadFile(fichero):
    if (fileExists(fichero)):
# To upload a file we have to create a dictionary with the name File as the clue, and the open File as the content        
        file = {fichero: open("../Files/" + fichero, "rb")}
        url = "http://localhost:8000/upload/" + fichero
        result = requests.post(url, files=file)
        if result.status_code==200:
            if (result.text != "copia"):
                print(fichero + " uploaded successfully.")
            else:
                print(fichero + " is already in the external repository.")
                print("You can delete it using the -re option and re-upload it.")
    else:
        print(fichero + " is not found in the local repository.")

# Function to download a file from the external repository
def downloadFile(fichero):
    url = "http://localhost:8000/download/" + fichero
    result = requests.get(url)
    if 200 == result.status_code:
        #Ponemos la ruta donde se va a descargar el archivo
        rutaDestino = os.path.join("../Files", fichero)
        with open(rutaDestino, "wb") as ff:
        # Nombre con el que quiero descargar el archivo. Lo queremos descargar con el nombre que le metemos por parametro
            with open(rutaDestino, "wb") as ff:
                ff.write(result.content)
                print(fichero + " succesfully downloaded")
                return True
    else:
        print(fichero + " is not found in the external repository.")
        return False

# Function to download all related files from the external repository
def downloadComplete(archivo):
    url = "http://localhost:8000/downloadAll/" + archivo
    result = requests.get(url)
    if result.status_code == 200:
        rutaDestino = os.path.join("../Files", archivo)
        with open(rutaDestino, 'wb') as archivo_local:
            archivo_local.write(result.content)
        # Extraer los archivos del ZIP descargado
        with zipfile.ZipFile(rutaDestino, "r") as zip_file:
            zip_file.extractall("../Files")
        os.remove(rutaDestino)
        print("The download of module " + archivo + " has been completed successfully.")
    else:
        print(f"Error al descargar {archivo}: {result.status_code}")

# Function to download an executable object of a file
def downloadExecutable(fichero):
    url = "http://localhost:8000/downloadExecutable/" + fichero
    result = requests.get(url)
    nombreFichero = fichero
    if 200 == result.status_code and not result.text == "Error":
        #Ponemos la ruta donde se va a descargar el archivo
        fichero = fichero + ".o"
        rutaDestino = os.path.join("../Files", fichero)
        with open(rutaDestino, "wb") as ff:
        # Nombre con el que quiero descargar el archivo. Lo queremos descargar con el nombre que le metemos por parametro
            with open(rutaDestino, "wb") as ff:
                ff.write(result.content)
                print(fichero + " succesfully downloaded")
                #Eliminamos los archivos .ll y .o que se han generado en el servidor
                disablePrinting()
                deleteExternalFile(nombreFichero + ".ll")
                deleteExternalFile(nombreFichero + ".o")
                enablePrinting()
                return True
    else:
        print("No se ha encontrado el fichero en el repositorio Externo")
        return False

# Function to modify the Makefile
def modMake(makefile, fichero):
    try:
        with open(makefile, 'r') as ficheroEntrada:
            lines = ficheroEntrada.readlines()
        with open(makefile, 'w') as ficheroSalida:
            for line in lines:
                if line.strip().startswith("XDP_TARGETS"):
                    if(not fichero=="xdp-loader.c"):
                        ficheroSalida.write("XDP_TARGETS  := " + fichero.rstrip(fichero[-2:])  + "\n")
                    else:
                        #EN CASO DE QUE SOLO SE QUIERA COMPILAR EL CARGADOR :)
                        ficheroSalida.write("XDP_TARGETS  := "+ "\n")
                else:
                    ficheroSalida.write(line)
        
    except FileNotFoundError:
        print("Archivo no encontrado")

# Function to modify the file it has maps
def modFile(fichero):
    #Lo primero que tenemos que saber es si tiene mapas. 
    fichjson = fichero.rstrip(fichero[-2:])
    fichjson = fichjson + ".json"
    if (fileExists(fichjson)):
        fichjson = os.path.join("../Files", fichjson)
        fichero = os.path.join("../Files", fichero)
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

# Function to compile the Makefile
def compileMakefile(fichero):
    try:
        # Ejecuta el comando 'make' en la terminal
        subprocess.run(["make", "-C", "../Files"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True)
        print("Compilation of " + fichero + " has been completed succesfuly")
    except subprocess.CalledProcessError:
        print("Error al compilar el makefile. Asegúrate de que 'make' esté instalado en tu sistema.")

# Function to list all files in the local repository
def listAllLocalRepos():
    try:
        archivos = []
        for archivo in os.listdir("../Files"):
            print(archivo)
    except subprocess.CalledProcessError:
        print("Error al listar los archivos del repositorio local")

# Function to list .c files in the local repository
def listLocalRepo():
    archivos = []
    for archivo in os.listdir("../Files"):
        if archivo.endswith(".c"):
            # Elimina los últimos dos caracteres (la extensión .c)
            archivos.append(archivo[:-2])  
    for archivoc in archivos:
        print(archivoc)

# Function to list all files from the external repository
def listAllExternalRepos():
    url = "http://localhost:8000/listall"
    result = requests.get(url)
    print(result.text)

# Function to list .c files from the external repository
def listExternalRepo():
    url = "http://localhost:8000/list"
    result = requests.get(url)
    archivos = json.loads(result.text)
    for archivo in archivos:
        print(archivo)
    
# Function to remove a file from the local repository
def deleteLocalFile(fichero):
    try:
        if(fileExists(fichero)):
            subprocess.run(["rm", "../Files/" + fichero], check=True)
            print(fichero + " successfully deleted from the local repository.")
        else:
            print(fichero + " is not in the local repository")
    except subprocess.CalledProcessError:
        print("There was an error deleting " + fichero)

# Function to remove a file from the external repository
def deleteExternalFile(fichero):
    url = "http://localhost:8000/remove/" + fichero
    result = requests.get(url)
    print(result.text)

# Function to load an eBPF program
def loadFunction(hook, cargador, interfaz, programa, opcion, secprog):
    extraSources = False
    fichjson = programa.rstrip(programa[-2:])
    fichjson = fichjson + ".json"
    #Para poder gestionar el pinneo de mapas
    nombrePrograma = programa
    programa = os.path.join("../Files", programa)
    if (fileExists(fichjson)):
        fichjson = os.path.join("../Files", fichjson)
        with open(fichjson, "r") as ficheroDescr:
            informacion = json.load(ficheroDescr)
        if "sources" in informacion:
            extraSources = True
    else:
        url = "http://localhost:8000/info/" + nombrePrograma.rstrip(nombrePrograma[-2:])
        result = requests.get(url)
        if result.status_code == 200:
            if (not result.text == "No info file"):
                result = result.json()
                if "sources" in result:
                    extraSources = True
    if (hook == "xdp"):
        if (cargador == "xdp-loader"):
            try:
                if(opcion == "-"):
                    output = subprocess.run(["sudo", "ls", "/sys/fs/bpf/" + nombrePrograma.rstrip(nombrePrograma[-2:])], stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
                    if output.returncode == 0:  # Verifica si la salida no está vacía
                        subprocess.run(["sudo", "../Files/xdp-loader", "load", interfaz, programa], check=True)
                    else:
                        subprocess.run(["sudo", "../Files/xdp-loader", "load", interfaz, programa, "--pin-path", "/sys/fs/bpf/" + nombrePrograma.rstrip(nombrePrograma[-2:])], check=True)
                    if(extraSources == True):
                        print("The eBPF program has been loaded successfully, read the description to finish the configuration")
                    else:
                        print("The eBPF program has been loaded successfully")
                elif(opcion == "--section"):
                    output = subprocess.run(["sudo", "ls", "/sys/fs/bpf/" + nombrePrograma.rstrip(nombrePrograma[-2:])], stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
                    if output.returncode == 0:  # Verifica si la salida no está vacía
                        subprocess.run(["sudo", "../Files/xdp-loader", "load", interfaz, programa, "-s", secprog], check=True)
                    else:
                        subprocess.run(["sudo", "../Files/xdp-loader", "load", interfaz, programa, "-s", secprog,  "--pin-path", "/sys/fs/bpf/" + nombrePrograma.rstrip(nombrePrograma[-2:])], check=True)
                    if(extraSources == True):
                        print("The eBPF program has been loaded successfully, read the description to finish the configuration")
                    else:
                        print("The eBPF program has been loaded successfully")
                elif (opcion == "--progname"):
                    output = subprocess.run(["sudo", "ls", "/sys/fs/bpf/" + nombrePrograma.rstrip(nombrePrograma[-2:])], stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
                    if output.returncode == 0:  # Verifica si la salida no está vacía
                        subprocess.run(["sudo", "../Files/xdp-loader", "load", interfaz, programa, "-n", secprog], check=True)
                    else:
                        subprocess.run(["sudo", "../Files/xdp-loader", "load", interfaz, programa, "-n", secprog,  "--pin-path", "/sys/fs/bpf/" + nombrePrograma.rstrip(nombrePrograma[-2:])], check=True)
                    if(extraSources == True):
                        print("The eBPF program has been loaded successfully, read the description to finish the configuration")
                    else:
                        print("The eBPF program has been loaded successfully")
                else:
                    print("Not supported option")
            except subprocess.CalledProcessError:
                print("Error al cargar la funcion")
        else:
            print("The " + cargador +  " loader is not yet implemented in this version of the software")
    else:
        print("The" + hook +  " hook is not yet implemented in this version of the software")

# Function to view the loaded eBPF functions
def getFunctionStatus(hook, cargador,interfaz):
    if (hook == "xdp"):
        if (cargador == "xdp-loader"):
            try:
                result = subprocess.run(["sudo", "../Files/xdp-loader", "status", interfaz], stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=True)
                # Mostrar salida estándar
                if result.returncode == 0:
                    print(result.stdout.decode("utf-8"))
                else:
                    #Si ha habido algun error, mostrar la salida personalizada
                    print("An error occurred while retrieving loaded functions in " + interfaz + ". Please verify that the interface exists.")
            except subprocess.CalledProcessError:
                print("An error occurred while retrieving loaded functions in " + interface + ". Please verify that the interface exists.")
        else:
            print("The " + cargador +  " loader is not yet implemented in this version of the software")
    else:
        print("The" + hook +  " hook is not yet implemented in this version of the software")

# Function to unload an eBPF function
def unloadFunction(hook, cargador, interfaz, id):
    if (hook == "xdp"):
        if (cargador == "xdp-loader"):
            try:
                if (not id=="all"):
                    subprocess.run(["sudo", "../Files/xdp-loader", "unload", interfaz, "-i", id], check=True)
                    print("Function with ID " + id +" has been unload of the interface " + interfaz + " successfully")
                else:
                    subprocess.run(["sudo", "../Files/xdp-loader", "unload", interfaz, "-a"], check=True)
                    print("All functions of the interface " + interfaz + " has been unload successfully")
            except subprocess.CalledProcessError:
                print("")
        else:
            print("The " + cargador +  " loader is not yet implemented in this version of the software")
    else:
        print("The" + hook +  " hook is not yet implemented in this version of the software")

# Function to show information about a file
def infoFile(archivo):
    fichjson = archivo + ".json"
    if (fileExists(fichjson)):
        fichjson = os.path.join("../Files", fichjson)
        with open(fichjson, "r") as ficheroDescr:
            informacion = json.load(ficheroDescr)
        for campo, valor in informacion.items():
            print(f"{campo}: {valor}")
    else:
        url = "http://localhost:8000/info/" + archivo
        result = requests.get(url)
        if result.status_code == 200:
            if (not result.text == "No info file"):
                #pasamos la respuesta a json
                result = result.json()
                for campo, valor in result.items():
                    print(f"{campo}: {valor}")
            else:
                print("No hay información sobre " + archivo)
        else:
            print("Error de conexion")

# Function to create a virtual interface with te testnev tool
def createInterface(nombre):
    try:
        subprocess.run(["sudo", "../testenv/testenv.sh", "setup", "--name", nombre], check=True)
    except subprocess.CalledProcessError:
        print("Error al crear la interfaz " + nombre)

# Function to download (if it is needed), compile and load an eBPF function
def run(hook, cargador, interfaz, programa, opcion, secprog):
    #primero vemos si el archivo se encuentra en el directorio
    downloadComplete(programa)
    if(hook == "xdp"):
        if (cargador == "xdp-loader"):
            nombreProgramaC = programa + ".c"
            nombreProgramaO = programa + ".o"
            modMake("../Files/Makefile", nombreProgramaC)
            modFile(nombreProgramaC)
            compileMakefile(nombreProgramaC)
            loadFunction(hook, cargador, interfaz, nombreProgramaO, opcion, secprog)
        else:
            print("The " + cargador +  " loader is not yet implemented in this version of the software")
    else:
        print("The" + hook +  " hook is not yet implemented in this version of the software")
    
# Function to show information about eBPF Hub
def helpProgram():
   print("Available options:" + "\n"
        + "     -u: upload files to an external repository" + "\n"
        + "     -rl: remove files from the local repository" + "\n"
        + "     -re: remove files from the external repository" + "\n"
        + "     -ll: list .c files in the local repository" + "\n"
        + "     -lla: list all files in the local repository" + "\n"
        + "     -le: list .c files in the external repository" + "\n"
        + "     -lea: list all files in the external repository" + "\n"
        + "     -d: download files from the external repository" + "\n"
        + "     -dc: download all related files from the external repository" + "\n"
        + "     -de: download an executable object of a file" + "\n"
        + "     -m: compile the file" + "\n"
        + "     -l: load an eBPF program" + "\n"
        + "         -h: eBPF hook" + "\n"
        + "         -if: eBPF Program Loading Interface (if needed)" + "\n"
        + "         --loader: function loader" + "\n"
        + "         -p: program to load" + "\n"
        + "             --section: ELF section name of the program to load" + "\n"
        + "             --progname: BPF program name of the program to load" + "\n"
        + "     -s: view the loaded eBPF functions" + "\n"
        + "         -h: eBPF hook" + "\n"
        + "         -if: eBPF Program Loading Interface (if needed)" + "\n"
        + "         --loader: function loader" + "\n"
        + "     -un: unload an eBPF function" + "\n"
        + "         -h: eBPF hook" + "\n"
        + "         -if: eBPF Program Loading Interface (if needed)" + "\n"
        + "         --loader: function loader" + "\n"
        + "         --id: ID of the function" + "\n"
        + "             all: unload all functions" + "\n"
        + "     -a: compile and load an eBPF program" + "\n"
        + "         -h: eBPF hook" + "\n"
        + "         -if: eBPF Program Loading Interface (if needed)" + "\n"
        + "         --loader: function loader" + "\n"
        + "             --section: ELF section name of the program to load" + "\n"
        + "             --progname: BPF program name of the program to load" + "\n"

        + "     -ni: create virtual interfaces with the testenv tool." + "\n"
        + "     -i: show information about the file")


if __name__== "__main__":

    opcionValida = False

    # Argument used for create a virtual interface with the testnev tool
    if ("-ni" in sys.argv):
        opcionValida = True
        indexInterfaz = sys.argv.index("-ni")
        indexInterfaz = indexInterfaz + 1
        createInterface(sys.argv[indexInterfaz]) 

    # Argument used for upload a file to an external repository
    if ("-u" in sys.argv):
        opcionValida = True
        indexUpload = sys.argv.index("-u")
        fichero = sys.argv[indexUpload + 1]
        uploadFile(fichero)

    # Argument used to remove a file from the local repository
    if ("-rl" in sys.argv):
        opcionValida = True
        indexRemove = sys.argv.index("-rl")
        fichero = sys.argv[indexRemove + 1]
        deleteLocalFile(fichero)

    # Argument used to remove a file from the external repository
    if ("-re" in sys.argv):
        opcionValida = True
        indexRemove = sys.argv.index("-re")
        fichero = sys.argv[indexRemove + 1]
        deleteExternalFile(fichero)

    # Argument used to list .c files in the local repository
    if ("-ll" in sys.argv):
        opcionValida = True
        listLocalRepo()

    # Argument used to list all files in the local repository
    if ("-lla" in sys.argv):
        opcionValida = True
        listAllLocalRepos()
    
    # Argument used to list all files from the external repository
    if ("-lea" in sys.argv):
        opcionValida = True
        listAllExternalRepos()

    # Argument used to list .c files from the external repository
    if ("-le" in sys.argv):
        opcionValida = True
        listExternalRepo()

    # Argument used to download a file from the external repository
    if ("-d" in sys.argv):
        opcionValida = True
        indexDownload = sys.argv.index("-d")
        fichero = sys.argv[indexDownload + 1]
        if (not fileExists(fichero)):
            downloadFile(fichero)
        else:
            opcion = input(fichero + " is located in the local repository. Do you want to rewrite it? (y/N)")
            if(opcion == "Y" or opcion == "y"):
                downloadFile(fichero)
            elif(opcion == "N" or opcion=="n" or opcion == "" or opcion == " "):
                print("The file hasn't been rewrited")
            else:
                print ("Not supported option")

    # Argumen used to download an exectuable object of a file
    if("-de" in sys.argv):
        opcionValida = True
        indexDownload = sys.argv.index("-de")
        fichero = sys.argv[indexDownload + 1]
        nombreObjeto = fichero + ".o"
        if (not fileExists(nombreObjeto)):
            downloadExecutable(fichero)
        else:
            opcion = input(nombreObjeto + " is located in the local repository. Do you want to rewrite it? (y/N)")
            if(opcion == "Y" or opcion == "y"):
                downloadExecutable(fichero)
            elif(opcion == "N" or opcion=="n" or opcion == "" or opcion == " "):
                print("The object hasn't been rewrited")
            else:
                print ("Not supported option")

    # Argument used to download all related files from the external repository
    if("-dc" in sys.argv):
        opcionValida = True
        indexDownload = sys.argv.index("-dc")
        fichero = sys.argv[indexDownload + 1]
        downloadComplete(fichero)

    # Argument used to view the loaded eBPF functions
    if("-s" in sys.argv):
        opcionValida = True
        if ("-h" in sys.argv):
            indexHook = sys.argv.index("-h")
            indexHook = indexHook + 1
            if ("-if" in sys.argv):
                indexInterfaz = sys.argv.index("-if")
                indexInterfaz = indexInterfaz + 1
                if("--loader" in sys.argv):
                    indexLoader = sys.argv.index("--loader")
                    indexLoader = indexLoader + 1
                    if(indexLoader + 1 > len(sys.argv)): # +1 porque empieza por 0
                        print("Invalid number of arguments")
                    else:
                        getFunctionStatus(sys.argv[indexHook], sys.argv[indexLoader], sys.argv[indexInterfaz])
    
    # Argument used to unload an eBPF function
    if("-un" in sys.argv):
        opcionValida = True
        if ("-h" in sys.argv):
            indexHook = sys.argv.index("-h")
            indexHook = indexHook + 1
            if ("-if" in sys.argv):
                indexInterfaz = sys.argv.index("-if")
                indexInterfaz = indexInterfaz + 1
                if("--loader" in sys.argv):
                    indexLoader = sys.argv.index("--loader")
                    indexLoader = indexLoader + 1
                if ("--id" in sys.argv):
                    indexPrograma = sys.argv.index("--id")
                    indexPrograma = indexPrograma + 1
                    unloadFunction(sys.argv[indexHook], sys.argv[indexLoader], sys.argv[indexInterfaz], sys.argv[indexPrograma])
                else:
                    print("You must provide a valid ID to remove a function from the interface: " + sys.argv[indexInterfaz],)
    
    # Argument used to compile a file
    if ("-m" in sys.argv):
        opcionValida = True
        indexMake = sys.argv.index("-m")
        fichero = sys.argv[indexMake + 1]
        if(fileExists(fichero)):
            modMake("../Files/Makefile", fichero)
            modFile(fichero)
            compileMakefile(fichero)
        else:
            print(fichero + " is not found in the local repository.")

    # Argument used to load an eBPF program     
    if("-l" in sys.argv):
        opcionValida = True
        if ("-h" in sys.argv):
            indexHook = sys.argv.index("-h")
            indexHook = indexHook + 1
            if ("-if" in sys.argv):
                indexInterfaz = sys.argv.index("-if")
                indexInterfaz = indexInterfaz + 1
            else:
                print ("Interface not defined")
            if("--loader" in sys.argv):
                indexLoader = sys.argv.index("--loader")
                indexLoader = indexLoader + 1
                if ("-p" in sys.argv):
                    indexPrograma = sys.argv.index("-p")
                    indexPrograma = indexPrograma + 1
                    if (indexPrograma + 1 <len(sys.argv)):
                        if(sys.argv[indexPrograma + 1] == "--section"):
                            loadFunction(sys.argv[indexHook], sys.argv[indexLoader], sys.argv[indexInterfaz], sys.argv[indexPrograma], "--section", sys.argv[indexPrograma+2])
                        elif(sys.argv[indexPrograma + 1] == "--progname"):
                            loadFunction(sys.argv[indexHook], sys.argv[indexLoader], sys.argv[indexInterfaz], sys.argv[indexPrograma], "--progname", sys.argv[indexPrograma+2])
                    else:
                        loadFunction(sys.argv[indexHook], sys.argv[indexLoader], sys.argv[indexInterfaz], sys.argv[indexPrograma], "-", "null")
                else:
                    print("Your must put a program")
            else:
                print("You must put a loader")
        else:
            print ("You must put a hook to load the program")

    # Argument used to show information about a file
    if ("-i" in sys.argv):
        opcionValida = True
        indexarchivo = sys.argv.index("-i")
        indexarchivo = indexarchivo + 1
        infoFile(sys.argv[indexarchivo])

    # Argument used to download (if it is needed), compile and load an eBPF function
    if ("-a" in sys.argv):
        opcionValida = True
        indexPrograma = sys.argv.index("-a")
        indexPrograma = indexPrograma + 1
        if("-h" in sys.argv):
            indexHook = sys.argv.index("-h")
            indexHook = indexHook + 1
            if ("-if" in sys.argv):
                indexInterfaz = sys.argv.index("-if")
                indexInterfaz = indexInterfaz + 1
            else:
                print ("Interface not defined")
            if("--loader" in sys.argv):
                indexLoader = sys.argv.index("--loader")
                indexLoader = indexLoader + 1
                if (indexLoader + 1 <len(sys.argv)):
                    if(sys.argv[indexPrograma + 1] == "--section"):
                        run(sys.argv[indexHook], sys.argv[indexLoader], sys.argv[indexInterfaz], sys.argv[indexPrograma], "--section", sys.argv[indexPrograma+2])
                    elif(sys.argv[indexPrograma + 1] == "--progname"):
                        run(sys.argv[indexHook], sys.argv[indexLoader], sys.argv[indexInterfaz], sys.argv[indexPrograma], "--progname", sys.argv[indexPrograma+2])
                else:
                    run(sys.argv[indexHook], sys.argv[indexLoader], sys.argv[indexInterfaz], sys.argv[indexPrograma], "-", "null")
            else:
                print("You must put a loader")
        else:
            print ("You must put a hook to load the program")
        
    # Argument used to show information about eBPF Hub
    if ("--help" in sys.argv):
        opcionValida = True
        helpProgram()

    # You must to put an available argument
    if(not opcionValida):
        print("Argument not available")



    


    
