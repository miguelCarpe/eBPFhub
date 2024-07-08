# eBPF Hub 
eBPF Hub is an eBPF application manager that allows users to perform actions related to downloading, managing, and deploying eBPF functions. In more detail, 
this project consists of a console program that provides an intuitive environment for users to easily and efficiently carry out a wide range of tasks 
related to eBPF program management. Additionally, it offers a cloud-based eBPF application management service that serves as an online repository for eBPF functions.
To develop this first phase of the project we have based ourselves on the following tutorials:  
https://github.com/xdp-project/xdp-tutorial  
https://github.com/xdp-project/xdp-tools
## Local
In the local part, we have the repository that the user will have access to. In addition to the main console program that the client will use, we also have the 
necessary dependencies.
## Server
In the Server part, we have a centralized external repository where eBPF functions will be uploaded and downloaded. Additionally, we have the main application 
that will handle client requests, along with the necessary dependencies. 
