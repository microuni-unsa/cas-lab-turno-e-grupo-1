#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CUESTIONARIO")[
  = CUESTIONARIO
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  == Que tipo de prueba se realiza con las pruebas unitarias, que aspecto de calidad mide?
  La prueba unitaria es prueba de componente sobre la unidad mínima, antes de integrar. Cada caso compara lo observado con la especificación: hace lo debido y evita lo indebido. Lo que mide es corrección funcional, porque confirma que constructores, lectores y escritores devuelven lo esperado. Con el marco de trabajo JUnit, acrónimo en inglés de Java Unit, la batería se repite durante el desarrollo, en la aceptación y ante cambios futuros.

  == Las pruebas unitarias son obligatorias, porque?
  Son obligatorias porque nadie debería entregar un programa sin probarlo ni aceptarlo sin probarlo. La batería del programador marca cuándo termina el trabajo; la del receptor, si se puede aceptar. Probar a mano solo funciona en programas pequeños, así que en desarrollo profesional la disciplina se sostiene con automatización. Repetir la batería ante cada cambio confirma que lo que funcionaba sigue funcionando.

  == Que modelos de calidad utilizan los resultados de pruebas unitarias?
  Los resultados alimentan los modelos de calidad de producto de la familia de normas Organización Internacional de Normalización 25000, sobre todo adecuación funcional y su corrección funcional. También alimentan los modelos de mejora del proceso de prueba, como el modelo de madurez de pruebas integrado, que pide baterías automatizadas, repetibles y trazables a la especificación. El conteo de casos superados y defectos por unidad es entonces evidencia objetiva del nivel alcanzado.
]
