# Revolucionando redes en zonas rurales

Este es un proyecto que busca revolucionar el acceso a internet en zonas rurales mediante el desarrollo de una red que permita el intercambio de datos entre los usuarios sin necesidad de conectarse a internet. 

## Estructura del proyecto

El proyecto está organizado en las siguientes carpetas:

- `back`: contiene el proyecto de backend desarrollado con Spring Boot, que incluye una base de datos y servicios REST para manejar eventos y usuarios.
- `front`: contiene el proyecto de frontend desarrollado con React, que permite a los usuarios registrarse y crear eventos para compartir información.
- `hardware`: contiene los códigos fuente para el hardware utilizado en el proyecto.

## Cómo utilizar el proyecto

Para utilizar el proyecto, se deben seguir los siguientes pasos:

1. Clonar el repositorio.
2. En la carpeta `back/project`, ejecutar el comando `docker-compose up -d` para levantar el servicio de base de datos y la aplicación de Spring Boot.
3. En la carpeta `front`, ejecutar el comando `npm install` para instalar las dependencias.
4. En la misma carpeta, ejecutar el comando `npm run dev` para levantar el servidor de desarrollo de React.
5. En la carpeta `hardware`, compilar y cargar el código fuente en los dispositivos de hardware utilizados.

Una vez realizados estos pasos, se puede acceder a la aplicación a través de un navegador web en la dirección `http://localhost:4242` `http://localhost:8080` 
