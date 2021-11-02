# ejercicios-dbt-cratedb

Se describe un paso a paso de un ejemplo de uso del adaptador de CrateDB para 

## Prerequisitos

### Python
Debe tener instalado python. En caso de no contar con esta herramienta consultar la siguiente dirección y proceder según el sistema operativo de su máquina.
https://www.python.org/downloads/

 * En caso de usar Windows, ver las consideraciones especiales.

### pip
pip es el instalador de paquetes de python, el cual será necesario para la instalación de dbt y el adaptador dbt-cratedb. En caso de no contar con la herramienta

Descargar el siguiente archivo:
https://bootstrap.pypa.io/get-pip.py

Ejecutar el archivo get-pip.py utilizando python.

Para actualizar pip, posteriormente ejecutar

python -m pip install --upgrade pip

### postgresql

Considerar la instalación requerida para el sistema operativo según lo que se indica en https://www.postgresql.org/download/

### git

Descargar e instalar según indicaciones en https://git-scm.com/downloads según el sistema operativo utilizado.

### Consideraciones adicionales
 * La versión recomendada de python es la 3.8.10 ya que con versiones más nuevas podría generar problemas de dependencias en el proceso de instalación de dbt.
 * Para windows podría requerirse habilitar "developer mode" y "long paths" e instalar visual C++ build tools
 * En Windows es necesario incluir las variables de entorno para poder ejecutar ambos programas desde cmd o powershell.


## Instalación de dbt
 
 pip install dbt
 pip install --upgrade dbt

## Instalación del driver dbt-cratedb

pip install dbt-cratedb==0.20.2

## Configuración del profile

Por defecto, el archivo profiles.yaml, dónde se encuentran las posibles conexiones a bases de datos, se encuentra ubicado en ~/.dbt/profiles.yml.
El contenido de este dependerá de la conexión a la base de datos. Para este ejemplo en particular que considera el adaptador de CrateDB, el contenido de este archivo debe ser similar al siguiente

crate:
  outputs:
    dev:
      type: cratedbadapter
      threads: 1
      host: <IP de la BD>
      port: 5432
      user: crate
      database: ""
      schema: dbt_dev
  target: dev


## Inicialización del proyecto
Para iniciar un nuevo proyecto de dbt, correr el siguiente comando.

dbt init ejemplo-dbt

Esto creará un directorio que contiene múltiples directorios y archivos.

## Copia de archivos csv a sus respectivos directorios

Posterior a la inicialización del proyecto de dbt, guardar el contenido de cada directorio dentro del directorio example_files de este repositorio, con su respectivo directorio en el proyecto de dbt de la siguiente forma.

 * example_files/csv_files -> data
 * example_files/models_files -> models
 * example_files/snapshots_files -> snapshots
 * example_files/tests_files -> tests

Adicionalmente se reemplaza el contenido del archivo dbt_project.yml en el proyecto de dbt, por el contenido en el directorio example_files de este repositorio.

## Carga de datos crudos a Cratedb

dbt seed

## Validación de condiciones indicadas en los tests

dbt test

## Generación de nuevas tablas resultantes de las transformaciones

dbt run

## Generación de los snapshots

dbt snapshot.
