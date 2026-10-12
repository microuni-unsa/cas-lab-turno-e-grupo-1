#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CONCLUSIONES")[
  = CONCLUSIONES
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  1. El control centralizado de versiones con Subversion garantiza trazabilidad total de los cambios en la gestión de configuración. El repositorio local alcanzó la revisión 6 con estructura trunk, branches y tags, rama rama1 y etiqueta v1.0, y cada revisión conserva autor, fecha, mensaje y rutas afectadas verificables con el historial detallado @svnbook2008.

  2. El cliente gráfico TortoiseSVN reduce la fricción operativa del mismo modelo sin alterar su semántica. Las tareas de checkout, commit, update, show log, repo-browser y comparación visual con TortoiseMerge producen resultados equivalentes a los comandos de línea, por lo que la elección entre ambos clientes depende del perfil del usuario y no del repositorio @tortoisesvn2024.

  3. La comparación con Git confirma que la centralización simplifica el control con numeración global y copias lógicas para ramas y etiquetas, mientras que el modelo distribuido traslada el historial a cada clon y separa el commit local del push remoto. Para equipos que requieren un punto único de verdad con administración simple, Subversion con TortoiseSVN resulta suficiente; para trabajo desconectado con ramificación intensiva, Git ofrece mayor flexibilidad @progit2014 @gitdocs2024.
]
