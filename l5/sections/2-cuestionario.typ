#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CUESTIONARIO")[
  = CUESTIONARIO
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  == Hasta que nivel de recuperación de versiones pasadas se puede realizar
  Subversion conserva el historial completo del repositorio desde la revisión 1, por lo que cualquier revisión pasada resulta recuperable mientras el repositorio mantenga su integridad. El cliente puede sincronizar la copia a una revisión arbitraria con el procedimiento de actualización a revisión, revisar una versión antigua sin alterar la copia actual y revertir cambios publicados mediante una fusión inversa que genera una revisión nueva @svnbook2008 @svnrefupdate2024.

  En la práctica, la recuperación alcanzó la revisión 1 inicial desde la revisión 6 final con el historial completo disponible en el diálogo Show log y en el registro svn log. No existe un límite de profundidad distinto del tamaño del repositorio: cada commit genera un número global incremental y el sistema reconstruye cualquier estado previo a partir de las diferencias almacenadas.

  == Cual es la estructura del nombre o etiqueta propuesta para cada version
  La estructura recomendada organiza el repositorio en tres directorios: trunk para la línea principal de desarrollo, branches para líneas paralelas de trabajo y tags para marcas de versiones estables @svnbest2024. Las ramas y etiquetas se implementan como copias lógicas de bajo costo dentro del repositorio, sin duplicar el contenido físico.

  En la práctica se aplicó la estructura trunk con main.py y notas.txt, la rama branches/rama1 creada desde trunk en la revisión 3 y la etiqueta tags/v1.0 creada desde trunk en la revisión 4 como versión estable. La convención de nombres adopta v seguido de números mayor, menor y parche para etiquetas, mientras que las ramas usan nombres descriptivos de la tarea, convención consistente con el control de versiones semántico de uso generalizado en la industria @semver2024.

  == Grafique el diagrama de actualización de versión luego de un cambio
  La @fig-actualizacion muestra el flujo de actualización luego de un cambio: el Usuario A edita su copia y envía el commit, el repositorio crea la revisión N+1 y la confirma, y el Usuario B actualiza su copia para recibir esa revisión.

  #figure(
    image("../img/diagrama-actualizacion.png", width: 40%),
    caption: [Diagrama de secuencia de la actualización de versión luego de un cambio.],
  ) <fig-actualizacion>
]
