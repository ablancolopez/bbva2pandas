

# Extractor de informes de BBVA
[![Checked with mypy](http://www.mypy-lang.org/static/mypy_badge.svg)](http://mypy-lang.org/)
[![Made with Python](https://img.shields.io/badge/Made%20with-Python-1f425f.svg)](https://www.python.org/)

Biblioteca y script para extraer los movimientos de tu cuenta bancaria de los informes en PDF que proporciona BBVA cada mes. Expórtalos a csv o sqlite.

## Dependencias

Se necesitan las siguientes dependencias de libpoppler para pdftotext:

```bash
sudo apt install build-essential libpoppler-cpp-dev pkg-config python3-dev
```

## Descarga de los informes

En [bbva.es](https://bbva.es), inicia sesión y ve a Posición global > Cuentas y Tarjetas > Ficha. Luego haz clic en Operaciones > Extracto mensual cuentas. ¡Listo para empezar!

## Uso de la biblioteca

Simplemente proporciona la ruta del archivo:

```python
import bbva2pandas
dataframe = bbva2pandas.Report('myfile').to_df()
```


## Ejecución del script

El script proporcionado carga todos los PDFs en el directorio indicado y genera un archivo CSV/sqlite
```
usage: bbva2pandas [-h] [--output_filename OUTPUT_FILENAME] directory {csv,sqlite}
bbva2pandas: error: the following arguments are required: directory, output_format
```

## Docker

Construir y ejecutar con Docker (no se requieren dependencias locales):

```bash
# Construir la imagen
make build

# Ejecutar sobre los PDFs en el directorio actual
make run

# Ejecutar pruebas
make test

# O usar docker directamente:
docker run --rm -v "$PWD:/data" bbva2pandas /data csv
```

## Pruebas

```bash
# Localmente
python3 -m unittest discover tests

# Con Docker
make test
```
