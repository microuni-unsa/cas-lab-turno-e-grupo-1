#import "/components/@unsareport/epis-lab/lib.typ": lab-section
#import "/components/@unsareport/gdocs-code-block/lib.typ": code-block

== Objetivo
Esta práctica conoce, evalúa y utiliza metodologías y herramientas de prueba unitaria sobre componentes de código. Usa la clase Rectangle del anexo de la guía y su batería RectangleTest con JUnit 4.

== Instalacion de herramientas
La guía pide instalar JUnit junto con Cactus y TestNG. JUnit se obtiene del repositorio oficial, como muestra la @fig-junit-descarga. Como los entornos de desarrollo habituales ya lo incluyen, la práctica corre sin instalación adicional en esos casos. Los ejemplos de la guía usan JUnit 4.12; esta práctica usa JUnit 4.13.2. El tiempo asignado es noventa minutos para instalación y pruebas y quince minutos para el reporte.

#figure(
  image("../../img/evidencia-junit-descarga.png", width: 80%),
  caption: [Página oficial de descarga de JUnit con la versión 4.13.2 y sus archivos disponibles.],
) <fig-junit-descarga>

== Casos de prueba con JUnit
La batería es una clase Java que importa las aserciones de JUnit y marca cada caso con la anotación de prueba. RectangleTest declara un objeto Rectangle y un arreglo de cinco. Antes de cada caso corre la preparación e imprime el mensaje de inicio; después corre el cierre e imprime el de fin. El método principal lanza el ejecutor de JUnit sobre la clase.

Son seis casos. Los dos primeros revisan el constructor por defecto: shouldStartWithZeroDimensions pide altura y ancho en cero y shouldStartWithZeroArea pide además área cero. shouldStoreConstructorValues crea un rectángulo de diez por veinte y revisa altura, ancho y área. shouldBuildGrowingRectangles crea cinco rectángulos con dimensiones crecientes según el índice y revisa cada elemento. Los dos últimos ejercitan la escritura: shouldApplyWrittenDimensions escribe valores nuevos según el índice y revisa modificados y área, y shouldPrintModifiedRectangles repite esa escritura e imprime la representación en texto de cada rectángulo.

Cada caso verifica con aserción, avisa el éxito y captura el error.

#code-block(lang: "java")[
```java
@Test
public void shouldApplyWrittenDimensions() {
  r = new Rectangle();
  try {
    rList[0] = new Rectangle(0, 0);
    rList[0].setH(11);
    rList[0].setW(7);
    assertTrue("shouldApplyWrittenDimensions: modified values are wrong.",
      rList[0].getH() == 11 &&
      rList[0].getW() == 7 &&
      rList[0].getA() == 77);
    System.out.println("shouldApplyWrittenDimensions completed successfully.");
  } catch (AssertionError e) {
    System.out.println(e.getMessage());
  }
}
```
]

Si la verificación falla aparece el mensaje del error; si pasa aparece el de éxito. Desde el directorio del archivo de construcción se corre:

```sh
mvn test
```

== Funcionalidad y alcances
Rectangle guarda altura y ancho como estado. Tiene un constructor por defecto que deja ceros y otro que recibe valores iniciales. Los lectores devuelven altura, ancho y área como producto de ambas; los escritores cambian altura y ancho. La representación en texto junta altura, ancho y área en una sola cadena.

El estado y el área quedan así.

#code-block(lang: "java")[
```java
public class Rectangle {
  private int height;
  private int width;
  Rectangle(int h, int w) {
    height = h;
    width = w;
  }
  public int getA() {
    return height * width;
  }
}
```
]

La batería cubre construcción por defecto y con parámetros, lectura de área, escritura de dimensiones y representación en texto. shouldBuildGrowingRectangles lleva la verificación a cinco objetos con dimensiones crecientes. shouldApplyWrittenDimensions y shouldPrintModifiedRectangles comprueban que lo escrito reemplaza lo construido y que el área sigue a los valores nuevos.

== Verificacion y validacion de resultados
Cada caso compara lo leído con lo esperado mediante aserciones de verdad. Sobre la clase correcta los seis pasan y la salida trae los cinco rectángulos impresos, como muestra la @fig-junit-verde.

#figure(
  image("../../img/evidencia-junit-verde.png", width: 80%),
  caption: [Ejecución correcta con los seis casos en éxito y los cinco rectángulos impresos.],
) <fig-junit-verde>

La segunda ejecución duplica el valor en el escritor de altura. Los cuatro casos de lectura y construcción pasan porque no tocan ese método; shouldApplyWrittenDimensions y shouldPrintModifiedRectangles reportan valores modificados incorrectos, como muestra la @fig-junit-mutado.

#figure(
  image("../../img/evidencia-junit-mutado.png", width: 80%),
  caption: [Ejecución con defecto donde los casos de escritura detectan los valores modificados incorrectos.],
) <fig-junit-mutado>

El defecto cabe en una línea del escritor de altura.

#code-block(lang: "java")[
```java
public void setH(int h) {
  height = h; // linea correcta
  height = h * 2; // linea con defecto inducido
}
```
]

== Analisis de resultados
La batería avisa cuándo termina el trabajo y si un programa recibido se puede aceptar. Con JUnit los seis casos se repiten durante el desarrollo, en la aceptación y después de cada cambio para comprobar que nada de lo que funcionaba se rompió. Preparación, prueba y cierre separados dejan cada caso independiente del anterior. El arreglo con valores crecientes amplía la cobertura sin duplicar verificaciones. Ese defecto en el escritor muestra el uso real: los casos atrapan cambios que rompen lo anterior.
