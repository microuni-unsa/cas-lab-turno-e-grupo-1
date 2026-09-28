#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CUESTIONARIO")[
  = CUESTIONARIO
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  == Qué resuelve conocer el dimensionamiento temprano del proceso de construcción de software
  Conocer el dimensionamiento temprano permite estimar el tamaño funcional antes de iniciar la construcción @nesma2023 @boehm2000. Con ese tamaño se calcula esfuerzo, costo y plazo de entrega, se asignan personas y recursos técnicos, se planifica el cronograma y se compara el avance real frente a lo estimado, y se evalúa la viabilidad económica antes de comprometer recursos significativos. En el Anexo 1, el dimensionamiento permitió fijar 125 puntos ajustados, S/ 18,750 de costo directo y 12.5 meses con 1 persona frente a 4.2 meses con 3 personas bajo supuestos explícitos.

  == Ventaja de usar la metodología NESMA
  La metodología NESMA mide el tamaño funcional de forma objetiva y reproducible con independencia del lenguaje de programación @nesma2023. Facilita la comparación entre proyectos porque usa unidades funcionales de entradas, salidas, archivos y consultas. Simplifica la estimación de costo y plazo desde etapas tempranas del ciclo de vida. Su alineación con el estándar ISO/IEC 24570 garantiza consistencia con otros métodos de medición funcional.

  == Confiabilidad del dimensionamiento COCOMO
  El modelo COCOMO II resulta confiable cuando se usan parámetros calibrados y datos reales del proyecto @boehm2000. Su base empírica proviene de cientos de proyectos reales que respaldan sus fórmulas y constantes. Permite ajustar la estimación según el tipo de proyecto y los factores de costo de experiencia, complejidad y calidad. Entrega estimaciones consistentes de esfuerzo, plazo y costo cuando el tamaño en KLOC o puntos de función está bien definido. En el Anexo 1, la plantilla entrega PM = 8.99 persona mes (170.85 días y USD 12,172.73) con los factores del laboratorio y un plan de 129.75 días, por lo que la confiabilidad depende de la calidad de la conversión de tamaño y de los parámetros adoptados.
]
