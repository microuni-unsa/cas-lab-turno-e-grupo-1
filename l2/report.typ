#import "/lib.typ": code-block, lab-section, table-border-width, unsa-report


#show: unsa-report.with(
  course_name: "Calidad de Software",
  lab_title: "Gestión de Cambios",
  lab_number: "02",
  instructor_name: "Jose Delgado Bastidas",
  members: (
    "Christian Raul Mestas Zegarra",
  ),
)


#set image(width: 78%)
#set list(indent: 2pt)
#set heading(numbering: "1.1.")
#show raw.where(block: false): it => box(inset: (x: 0.5pt))[#it]

#include "sections/1-resultados.typ"
#v(0.5em)
#include "sections/2-cuestionario.typ"
#v(0.5em)
#include "sections/3-conclusiones.typ"
#v(0.5em)
#include "sections/4-referencias.typ"
