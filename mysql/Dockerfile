FROM mysql:5.7

# Copia todos los scripts SQL desde la carpeta local "initdb"
# al directorio que MySQL usa para la inicialización (/docker-entrypoint-initdb.d)
COPY initdb/ /docker-entrypoint-initdb.d/
