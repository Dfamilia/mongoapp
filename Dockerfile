# Este archivo se utiliza para poder construir el container basado en la app
# En este archivo se escriben las intrucciones que necesita nuestro contenedor para que este bien configurado
# Todas las imagenes que nosotros creemos siempre se tienen que basar en alguna otra imagen 
FROM node:18
# FROM: nos permite especificar basado en que imagen estara creada nuestra imagen de la app.
# Despues de indicar la imagen base necesitamos crear una carpeta donde se guardara el codigo fuente de la app.
# RUN: nos permite ejecutar comandos de terminal desde este archivo.
RUN mkdir -p /home/app
# Esta es una ruta dentro del contenedor, recordando que el S.O dentro del contenedor es linux.
# Despues de creada la carpeta, vamos a copiar el código fuente dentro de la carpeta
COPY . /home/app

# COPY vs RUN: run nos permite ejecutar comandos del S.O Linux dentro del container, mientras que,
# copy nos permite acceder a los archivos del S.O Host, copiar esos archivos y pegarlos en la ruta
# de nuestro contenedor establecida.

# . : ruta del S.O Host donde estan los archivos que quiero acceder.
# Esquema: ruta del S.O Host (.)" "ruta del archivo Host(si es diferente de donde estamos actualmente)" "
# ruta del archivo destino Guess.

EXPOSE 3000
# Este comando expone el puerto para que el Host u Otros contenedores puedan conectarse a la app.

CMD ["node", "/home/app/index.js"]
# Este comando executa un comando desde la terminal en este caso para ejecutar la app desde el contenedor
# Nota: la ruta del argumento index.js es absoluta.
# YA ESTA!!
# nuestra imagen se puede crear pero antes de hacerlo recuerda primero hacer:
# 1- Crear la red interna
# 2- Agregar los nombres de los contenedores que se conectaran a la app.