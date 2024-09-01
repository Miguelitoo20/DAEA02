#!/bin/bash

# Construye la imagen Docker especificando el Dockerfile correcto
docker build -t mymicroservice .

# Ejecuta el contenedor, asegurándote de mapear los puertos correctamente
docker run -d -it --rm -p 5000:80 --name mymicroservicecontainer mymicroservice

cd frontend

# Construye la imagen Docker especificando el Dockerfile correcto
docker build -t my-react-app .

# Ejecuta el contenedor, asegurándote de mapear los puertos correctamente
docker run -d -p 3000:80 --name my-react-container my-react-app

