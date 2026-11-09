#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CUESTIONARIO")[
  = CUESTIONARIO
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  == Cual es la tecnica de diseno de prueba mas utilizada? Porque?
  La partición de equivalencia con valores límite, porque agrupa entradas que se comportan igual y prueba los bordes donde se concentran los defectos. En esta práctica aparece al elegir valores representativos del desplegable y estados del interruptor en lugar de probar cada combinación posible. Menos casos con la misma cobertura de comportamiento distinto, y fáciles de repetir con Selenium @riunet2018.

  == Indicar las variables de configuracion de selenium para una aplicacion simple
  Navegador con su controlador emparejado en versión, opciones de arranque como modo sin cabeza y tamaño de ventana, y tiempos de espera implícita, explícita y de carga de página. Esta práctica fija Chromium 157 con su chromedriver, modo sin cabeza, ventana de 1366 por 768, espera implícita de cinco segundos, esperas explícitas de diez segundos y carga máxima de 30 segundos. Con eso los guiones se comportan igual en cada corrida sobre páginas públicas @selenium2025 @seleniumwaits2025.

  == Identificar algun inconveniente de uso de selenium e indicar la forma de solucion
  La fragilidad ante cambios de la página y protecciones contra robots: los XPath absolutos del repositorio dejaron de existir, la caja de Google cambió de etiqueta y el envío de consultas redirige a verificación de tráfico inusual. La salida es usar localizadores robustos por nombre, XPath relativo y selector de hojas de estilo en cascada, esperas explícitas por visibilidad en lugar de pausas fijas, y documentar como límite lo que la red bloquea en vez de automatizarlo @githubselenium @selenium2025.
]
