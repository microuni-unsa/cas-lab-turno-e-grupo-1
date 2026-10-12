#import "/components/@unsareport/epis-lab/lib.typ": lab-section

== Objetivo
El objetivo de la práctica es instalar, probar, evaluar, analizar y utilizar Subversion y TortoiseSVN como herramientas de control de versiones en la gestión de configuración de software @svnbook2008 @tortoisesvn2024.

== Instalación de Subversion y TortoiseSVN
La instalación se realizó desde el sitio oficial de descargas de TortoiseSVN en https://tortoisesvn.net/downloads.html, que distribuye de forma conjunta el cliente gráfico y las herramientas de línea de comandos de Subversion @tortoisesvn2024. La página de descargas ofrece la versión 1.14.9 en variantes de 32 bits, 64 bits y ARM64 e indica que la versión queda enlazada contra la biblioteca 1.14.5 de Subversion.

#figure(
  image("../../img/evidencia-descarga-tsvn.png", width: 62%),
  caption: [Página oficial de descargas con TortoiseSVN 1.14.9 de 64 bits.],
) <fig-descarga-tsvn>

El código fuente de Subversion se obtuvo desde el sitio oficial del proyecto Apache en https://subversion.apache.org/download.cgi, que publica la versión recomendada 1.15.0 junto con la versión 1.14.5 aún soportada con sus sumas de verificación y firmas @svnbest2024.

#figure(
  image("../../img/evidencia-descarga-svn.png", width: 62%),
  caption: [Página oficial de descargas de Apache Subversion con la versión 1.14.5.],
) <fig-descarga-svn>

El cliente de línea de comandos quedó verificado con Subversion 1.14.5 sobre x86_64-pc-linux-gnu con el respaldo de Apache Software Foundation. El cliente gráfico quedó verificado con la ventana Acerca de, que muestra la versión 1.14.9 de TortoiseSVN junto con la versión 1.14.5 de la biblioteca de Subversion y el acceso al registro de cambios.

#figure(
  image("../../img/evidencia-tsvn-about.png", width: 48%),
  caption: [Ventana Acerca de con la versión instalada de TortoiseSVN.],
) <fig-tsvn-about>

El diálogo de configuración permite ajustar idioma, integración con el explorador, programas externos de diferencias y credenciales de acceso a repositorios.

#figure(
  image("../../img/evidencia-tsvn-settings.png", width: 62%),
  caption: [Diálogo de configuración de TortoiseSVN.],
) <fig-tsvn-settings>

== Actividades del manual de usuario
Se ejecutaron las actividades de las páginas 24 a 26 del manual de usuario de TortoiseSVN, que cubren la obtención de una copia de trabajo, la edición de archivos versionados, el envío de cambios al repositorio, la actualización de la copia y la revisión del historial @tortoisesvn2024. Cada actividad se realizó con el cliente de línea de comandos y se repitió con el cliente gráfico para contrastar ambos flujos sobre el mismo repositorio.

== Actividades del SVN-BOOK
Se implementaron las actividades del SVN-BOOK sobre el ciclo básico de trabajo con un repositorio local: creación del repositorio, importación de la estructura recomendada con trunk, branches y tags, obtención de la copia, registro de archivos, envío de revisiones, actualización, copia para ramas y etiquetas, revisión de diferencias e inspección del historial @svnbook2008 @svnbest2024. La @fig-ciclo resume el ciclo ejecutado.

#figure(
  image("../../img/diagrama-ciclo.png", width: 40%),
  caption: [Ciclo básico de trabajo con Subversion ejecutado en la práctica.],
) <fig-ciclo>

== Práctica con el cliente de línea de comandos
El repositorio se creó con svnadmin create y se publicó en red con svnserve sobre la dirección del servidor local, mecanismo que permitió compartir el mismo repositorio entre el cliente de línea de comandos y TortoiseSVN. La copia inicial se obtuvo con svn checkout, operación que el sistema confirmó con la revisión 4 y la descarga de trunk, branches con rama1 y tags con v1.0.

#figure(
  image("../../img/evidencia-cli-checkout.png", width: 62%),
  caption: [Obtención de la copia de trabajo con svn checkout hasta la revisión 4.],
) <fig-cli-checkout>

La estructura recomendada se preparó con los directorios trunk, branches y tags. Sobre trunk se agregaron los archivos main.py con el programa inicial y notas.txt con notas de la versión. El registro se realizó con svn add y el primer envío con svn commit con el mensaje de estructura inicial, operación que el sistema confirmó con la revisión 1.

La edición consistió en actualizar main.py con nuevas líneas del programa. El comando svn status marcó el archivo con la letra M de modificado, el comando svn diff mostró el cambio línea por línea y el envío con svn commit generó las revisiones 5 y 6 con el mensaje de showcase.

#figure(
  image("../../img/evidencia-cli-status-diff-commit.png", width: 62%),
  caption: [Detección del cambio con svn status, revisión con svn diff y envío con svn commit hasta la revisión 6.],
) <fig-cli-commit>

La sincronización posterior con svn update confirmó que la copia quedó al día. El historial completo con svn log en modo detallado muestra las seis revisiones con autor, fecha, mensaje y rutas afectadas.

#figure(
  image("../../img/evidencia-cli-log.png", width: 62%),
  caption: [Historial detallado con svn log y rutas afectadas por revisión.],
) <fig-cli-log>

La inspección de ramas y etiquetas se realizó con svn list sobre branches y tags, que mostró rama1 y v1.0 creadas con svn copy desde trunk en las revisiones 3 y 4.

#figure(
  image("../../img/evidencia-cli-list-branches.png", width: 62%),
  caption: [Listado de la rama rama1 en branches con svn list.],
) <fig-cli-branches>

#figure(
  image("../../img/evidencia-cli-list-tags.png", width: 62%),
  caption: [Listado de la etiqueta v1.0 en tags con svn list.],
) <fig-cli-tags>

La recuperación de la versión inicial se verificó con svn cat sobre la revisión 1, que devolvió el programa original con una sola línea. El registro íntegro de la sesión inicial de cuatro revisiones se conserva en el archivo evidencia-svn-log.txt del directorio src.

#figure(
  image("../../img/evidencia-cli-cat-r1.png", width: 62%),
  caption: [Recuperación del programa original con svn cat sobre la revisión 1.],
) <fig-cli-cat>

== Práctica con TortoiseSVN
Las mismas tareas se repitieron con el cliente gráfico. La obtención de la copia se realizó con la opción SVN Checkout, que solicita la dirección del repositorio y la carpeta destino y muestra el progreso hasta la revisión indicada.

#figure(
  image("../../img/evidencia-tsvn-checkout.png", width: 62%),
  caption: [Diálogo SVN Checkout con la dirección del repositorio y la carpeta destino.],
) <fig-tsvn-checkout>

La finalización de la obtención quedó confirmada con la descarga de trunk, branches y tags hasta la revisión 4.

#figure(
  image("../../img/evidencia-tsvn-checkout-done.png", width: 62%),
  caption: [Confirmación de checkout con la revisión 4 y los archivos descargados.],
) <fig-tsvn-checkout-done>

La exploración del repositorio se realizó con la opción Repo-browser, que muestra la estructura trunk, branches y tags junto con la rama rama1 y la etiqueta v1.0 creadas en la práctica.

#figure(
  image("../../img/evidencia-tsvn-repobrowser.png", width: 62%),
  caption: [Explorador de repositorio con trunk, branches y tags.],
) <fig-tsvn-repo>

El envío de cambios se realizó con la opción SVN Commit, que lista los archivos modificados y exige el mensaje de la revisión antes de confirmar. La sincronización se realizó con la opción SVN Update, que trae los cambios del equipo hacia la copia local. La revisión del historial se realizó con la opción Show log, que presenta las revisiones con autor, fecha y mensaje, equivalentes a las obtenidas con el cliente de línea de comandos.

#figure(
  image("../../img/evidencia-tsvn-log.png", width: 62%),
  caption: [Diálogo Show log con las revisiones 1, 2, 5 y 6 con autor, fecha y mensaje.],
) <fig-tsvn-log>

Las diferencias entre versiones se revisaron con la herramienta TortoiseMerge, que presenta el cambio línea por línea con resaltado visual.

== Cuadro comparativo entre TortoiseSVN, Subversion y Git
La @tbl-comparativa contrasta el cliente gráfico, el cliente de línea de comandos de Subversion y Git como sistema distribuido de control de versiones @svnbook2008 @tortoisesvn2024 @progit2014 @gitdocs2024.

#figure(
  table(
    columns: (1fr, 1.25fr, 1.35fr, 1.35fr),
    align: left + horizon,
    stroke: 0.5pt + rgb("#808080"),
    table.header(
      table.cell(fill: rgb("#EAEAEA"))[Dimensión],
      table.cell(fill: rgb("#EAEAEA"))[TortoiseSVN],
      table.cell(fill: rgb("#EAEAEA"))[Subversion en línea de comandos],
      table.cell(fill: rgb("#EAEAEA"))[Git],
    ),
    [Modelo de versiones], [Centralizado con repositorio único y revisiones globales], [Centralizado con repositorio único y revisiones globales], [Distribuido con copia completa del historial en cada clon],
    [Interfaz], [Gráfica integrada al explorador con menús contextuales], [Texto con comandos svn directos], [Texto con comandos git y clientes gráficos externos],
    [Obtención del proyecto], [SVN Checkout con dirección y carpeta destino], [svn checkout con dirección y carpeta destino], [git clone con dirección del remoto],
    [Envío de cambios], [SVN Commit con diálogo y lista de archivos], [svn commit con mensaje obligatorio], [git commit sobre el repositorio local y git push hacia el remoto],
    [Actualización], [SVN Update hacia la revisión indicada], [svn update hacia la revisión indicada], [git pull que trae y fusiona cambios del remoto],
    [Historial], [Show log con gráfico de revisiones], [svn log con detalle de rutas], [git log con historial completo local],
    [Ramificación], [Branch y tag con copias lógicas en el servidor], [svn copy entre rutas del repositorio], [git branch con ramas locales ligeras],
    [Etiquetado], [Carpeta tags con copias de versiones estables], [svn copy hacia tags con nombre de versión], [git tag con marcas nominales o anotadas],
    [Resolución de conflictos], [TortoiseMerge con edición visual lado a lado], [svn diff y svn resolve con marcas en archivos], [git mergetool y fusión de tres vías],
    [Plataforma], [Windows con integración al explorador], [Windows, Linux y macOS en terminal], [Windows, Linux y macOS en terminal y servicios de hospedaje],
  ),
  caption: [Comparación entre TortoiseSVN, Subversion en línea de comandos y Git.],
) <tbl-comparativa>

== Análisis de resultados
Los dos clientes de Subversion operan sobre el mismo modelo centralizado y producen revisiones idénticas: las seis revisiones aparecen tanto en el historial de línea de comandos como en el diálogo Show log. La línea de comandos ofrece trazabilidad exacta de cada operación con respuestas textuales del servidor, mientras que el cliente gráfico reduce errores en el uso diario al validar mensajes, listar archivos y resolver diferencias con apoyo visual. Frente a Git, Subversion simplifica la gestión centralizada con numeración global de revisiones y copias lógicas para ramas y etiquetas, mientras que Git traslada el historial completo a cada clon y separa el commit local del push remoto, lo que acelera el trabajo individual pero exige disciplina en la sincronización @progit2014.
