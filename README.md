# informe-utn
Clase de LaTex para informes y trabajos de la UTN-FRC

## dependencias
En arch linux necesitas instalar los paquetes: *texlive-latex texlive-latexrecommended texlive-latexextra*
```
sudo pacman -S texlive-latex texlive-latexrecommended texlive-latexextra
```
*(agregar paquetes de otras distribuciones)*

## instalación
Para instalar esta clase en tu sistema simplemente corre el script install.sh
```
./install.sh
```
O simplemente puedes agregar los archivos *informeutn.cls* y *UTN_logo.png* en el mismo directorio de tu archivo .tex

## configuración
La clase tiene varios parametros configurables. Algunos de ellos son obligatorios, otros no.

### obligatorios
```
\documentclass[<tipo_de_doc>]{informeutn}
```
`<tipo_de_doc>` puede tomar dos valores:
 - `chaptersright`: Hace que todos los comienzos de los capitulos empiecen en la pagina derecha. En impresiones doble
                    faz hace que los capitulos empiecen siempre en la cara frontal de la hoja.
 - vacio: No modifica donde empiezan los capitulos.

```
\materia{}
\titulo{}
\comision{}
\autores{}
\fecha{}
```

### opcionales
```
\subtitulo{}
```
