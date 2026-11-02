#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CONCLUSIONES")[
  = CONCLUSIONES
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  1. Probar por unidad con JUnit verifica la corrección funcional de Rectangle caso por caso. Las seis pruebas cubren constructor por defecto, lector de área, constructor con parámetros, lista parametrizada, escritores y representación en texto, así que cada avance del código tiene su prueba @upm2024.

  2. Repetir la batería en cada cambio cumple el objetivo de evaluar la herramienta en uso real. Los casos de construcción y lectura validan lectores y constructores; los de escritura y representación detectan la alteración del escritor de altura y dejan el defecto localizado sin revisión manual exhaustiva @uv2010.

  3. Organizar la batería como clase con preparación y cierre deja un procedimiento ordenado y reutilizable. Aserciones con mensajes descriptivos y el corredor de JUnit facilitan reportar resultados con trazabilidad a la especificación @junit2024.

  4. Comparar la ejecución correcta con la del defecto inducido muestra para qué sirven las pruebas: atrapar cambios que rompen lo anterior. El marco de trabajo TestNG, acrónimo en inglés de Test Next Generation, y la herramienta Cactus del proyecto Jakarta quedan como alternativas para un alcance mayor, hacia pruebas de integración y de componentes del lado del servidor @testng2024 @cactus2024.
]
