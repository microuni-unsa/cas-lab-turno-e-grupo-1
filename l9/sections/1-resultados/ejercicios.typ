#import "/components/@unsareport/gdocs-code-block/lib.typ": code-block
== Objetivo
Esta práctica conoce, evalúa y utiliza metodologías y herramientas para gestionar actividades y recursos de calidad de software, con Selenium como herramienta principal. Instala el controlador WebDriver, adapta y ejecuta los ejercicios ej_1, ej10, ej27, ej3, ej4, ej5, ej6, ej7, ej8 y ej9 del repositorio Python con Selenium, y reporta tareas y resultados según la estructura de la guía @guia9 @githubselenium.

== Instalacion de Selenium
La instalación sigue la guía oficial de primeros pasos: basta agregar la biblioteca Selenium al proyecto, como muestra la @fig-instalacion. Desde Selenium 4.6 ya no se descargan ni gestionan controladores a mano, pues Selenium Manager encuentra el controlador que corresponde al navegador @selenium2025.

#figure(
  image("../../img/instalacion-selenium.png", width: 80%),
  caption: [Guía oficial de instalación de Selenium para Python.],
) <fig-instalacion>

El archivo de proyecto declara la dependencia con Selenium 4.52.0 como versión mínima.

#code-block(lang: "toml")[
```toml
[project]
name = "src"
version = "0.1.0"
requires-python = ">=3.13"
dependencies = [
    "selenium>=4.52.0",
]
```
]

Cada guion crea su navegador con una factoría común que fija el modo sin cabeza, la ventana de 1366 por 768 píxeles y un tiempo máximo de carga de 30 segundos. Ningún guion depende de rutas fijas de Windows ni de descargas manuales. Las pruebas corren en Chromium 157 con su chromedriver y en Firefox 159 con geckodriver 0.36.0.

== Adaptacion de los ejercicios
Los guiones originales usan la interfaz de Selenium 3, retirada en la versión 4: el argumento ruta del ejecutable en el constructor y los localizadores find_element_by_name o find_elements_by_tag_name. La adaptación reemplaza la ruta fija por el objeto Service y cada localizador antiguo por la llamada find_element con la enumeración By, como documenta la guía oficial @selenium2025.

#code-block(lang: "python")[
```python
driver.find_element(By.NAME, "q")
driver.find_element(By.XPATH, "//*[@name='q']")
```
]

Las pausas fijas con suspensión también salen: cada espera pasa a ser una espera explícita que continúa cuando aparece la condición buscada, o la espera implícita de cinco segundos en el ejercicio dedicado a ella. Tres páginas cambiaron desde la publicación del repositorio. La caja de búsqueda de Google ahora es un área de texto y su lista de sugerencias incluye un segundo cuadro oculto, así que los ejercicios 3 y 4 esperan la visibilidad del primer cuadro. Las páginas de w3schools perdieron el contenedor con identificador main de los XPath absolutos originales, así que el ejercicio 5 usa el selector label punto switch con campo inputdemo y el ejercicio 6 toma el primer desplegable de la página @githubselenium.

== Ejercicio 1: comprobacion del funcionamiento
Abrir python punto org y comprobar que el título contenga Python es todo el ejercicio. Tarda 2.3 segundos y la @fig-ej1 recoge la página obtenida.

#code-block(lang: "python")[
```python
driver.get("http://www.python.org")
self.assertIn("Python", driver.title)
```
]

#figure(
  image("../../img/ej1-python-org.png", width: 80%),
  caption: [Página de Python con título de bienvenida en Chromium.],
) <fig-ej1>

== Ejercicio 3: escritura en el buscador
La prueba escribe selenium en el buscador de Google y comprueba el texto ingresado junto a diez sugerencias visibles. El fragmento decisivo combina send_keys con la espera de visibilidad del primer cuadro de sugerencias. El envío de la consulta queda fuera de la prueba porque la red actual redirige los envíos automatizados a la página de verificación de tráfico inusual de Google. Las sugerencias obtenidas quedan en la @fig-ej3.

#code-block(lang: "python")[
```python
caja = driver.find_element(By.NAME, "q")
caja.send_keys("selenium")
sugerencias = WebDriverWait(driver, 10).until(
    EC.visibility_of_element_located(
        (By.XPATH, "(//ul[@role='listbox'])[1]")
    )
)
```
]

#figure(
  image("../../img/ej3-sugerencias.png", width: 80%),
  caption: [Sugerencias de Google al escribir selenium sin enviar la consulta.],
) <fig-ej3>

== Ejercicio 4: localizacion por XPath relativo
Nombre y XPath relativo apuntan a la misma caja de búsqueda. La prueba comprueba que ambos localizadores resuelven el mismo elemento y obtiene también diez sugerencias visibles. La @fig-ej4 muestra el elemento hallado por la ruta relativa, resaltado en rojo.

#code-block(lang: "python")[
```python
por_nombre = driver.find_element(By.NAME, "q")
por_xpath = driver.find_element(By.XPATH, "//*[@name='q']")
self.assertEqual(por_nombre, por_xpath)
```
]

#figure(
  image("../../img/ej4-sugerencias.png", width: 80%),
  caption: [Elemento ubicado por XPath relativo, resaltado en rojo, con sus sugerencias.],
) <fig-ej4>

== Ejercicio 5: accionamiento del interruptor
La página de w3schools trae cuatro interruptores. La prueba pulsa dos veces el primero y comprueba que su estado conmuta en cada pulsación, con una espera del cambio de estado tras cada pulsación. Antes de pulsar, el desplazamiento centra el elemento en la vista para que la barra superior fija no intercepte la pulsación. Los interruptores tras la primera pulsación se ven en la @fig-ej5.

#code-block(lang: "python")[
```python
etiqueta.click()
WebDriverWait(driver, 10).until(
    lambda d: primero.is_selected() != inicial
)
```
]

#figure(
  image("../../img/ej5-toggle.png", width: 80%),
  caption: [Interruptores de w3schools tras la primera pulsación.],
) <fig-ej5>

== Ejercicio 6: seleccion en el desplegable
El desplegable nativo trae trece opciones, de Select car a Volvo. La prueba las recorre y selecciona Nissan por su valor 10 con la clase Select. La @fig-ej6 muestra el desplegable con Nissan elegido.

#code-block(lang: "python")[
```python
seleccion = Select(desplegable)
seleccion.select_by_value("10")
self.assertEqual(seleccion.first_selected_option.text, "Nissan")
```
]

#figure(
  image("../../img/ej6-select.png", width: 80%),
  caption: [Desplegable nativo con Nissan seleccionado por valor 10.],
) <fig-ej6>

== Ejercicio 7: cambio de pestana
Un guion de ventana abre la segunda pestana, la prueba carga example punto com en ella y vuelve a la primera. La espera del conteo de ventanas reemplaza las pausas fijas del original. El destino original era stackoverflow punto com, reemplazado por example punto com como página determinista. La segunda pestana con el dominio de ejemplo se ve en la @fig-ej7.

#code-block(lang: "python")[
```python
driver.execute_script("window.open('');")
WebDriverWait(driver, 10).until(EC.number_of_windows_to_be(2))
driver.switch_to.window(driver.window_handles[1])
```
]

#figure(
  image("../../img/ej7-segunda-pestana.png", width: 80%),
  caption: [Segunda pestana con el dominio de ejemplo tras el cambio de ventana.],
) <fig-ej7>

== Ejercicio 8: navegacion atras y adelante
Google, Gmail y YouTube en secuencia: la prueba los visita, retrocede dos veces y avanza una, con verificación de la dirección en cada paso. Gmail redirige al inicio de sesión de cuentas de Google, que la prueba acepta como destino válido junto a la bandeja. La parada en YouTube antes de retroceder queda en la @fig-ej8.

#code-block(lang: "python")[
```python
driver.get("http://www.youtube.com")
driver.back()
driver.back()
driver.forward()
```
]

#figure(
  image("../../img/ej8-youtube.png", width: 80%),
  caption: [Parada en YouTube durante el recorrido de navegación.],
) <fig-ej8>

== Ejercicio 9: espera explicita
Diez segundos de margen para que aparezca la caja de búsqueda: WebDriverWait con la condición de presencia por nombre. La prueba confirma el elemento visible y el título Google @seleniumwaits2025.

#code-block(lang: "python")[
```python
elemento = WebDriverWait(driver, 10).until(
    EC.presence_of_element_located((By.NAME, "q"))
)
```
]

== Ejercicio 10: espera implicita
Cinco segundos de espera implícita y una localización directa de la caja, sin espera explícita. La prueba también confirma el elemento visible y el título Google @seleniumwaits2025.

#code-block(lang: "python")[
```python
driver.implicitly_wait(5)
driver.get("http://www.google.com")
elemento = driver.find_element(By.NAME, "q")
```
]

== Ejercicio 27: el mismo guion en Firefox
Firefox con geckodriver repite la comprobación de Google y demuestra que el código WebDriver es intercambiable entre navegadores. El guion original abría Internet Explorer, retirado por Microsoft en junio de 2022 y sin controlador para Linux, así que Firefox es el segundo navegador de esta práctica. La caja con el texto de prueba se ve en la @fig-ej27.

#code-block(lang: "python")[
```python
driver = webdriver.Firefox(service=service, options=options)
driver.get("http://www.google.com")
self.assertIn("Google", driver.title)
```
]

#figure(
  image("../../img/ej27-firefox.png", width: 80%),
  caption: [Búsqueda de prueba en Firefox con geckodriver.],
) <fig-ej27>

== Ejecucion completa y alcances
Los diez ejercicios corren en Chromium sin cabeza, salvo el ejercicio 27 que usa Firefox. Las diez pruebas terminan en OK en unos 80 segundos, con tiempos por ejercicio entre 2.3 y 15.6 segundos. El registro confirma título de bienvenida de Python, diez sugerencias por ejercicio de escritura, cuatro interruptores, trece opciones con Nissan elegido, cambio de pestana verificado en ambas direcciones, recorrido de navegación con redirección de Gmail aceptada, y Firefox 159.0.1 con geckodriver 0.36.0.

En función, el ejercicio automatiza interacciones reales de navegador: apertura, escritura, pulsación, selección, cambio de ventana, navegación histórica y sincronización con esperas. Para medir cubre localización de elementos por nombre, XPath, selector de hojas de estilo en cascada y etiqueta, verificación de estado y texto, e intercambio del mismo guion entre Chromium y Firefox. Eso responde a lo que pide la guía: instalar Selenium con sus funcionalidades, ejecutar los ejercicios indicados y revisar sus resultados @guia9.

== Suficiencia de Selenium para pruebas funcionales
Selenium cubre ese alcance: emula la interacción del usuario con el navegador, escribe guiones intercambiables entre navegadores con WebDriver y sincroniza con esperas explícitas e implícitas. Es código abierto y la base habitual de la automatización funcional web, con localizadores por identificador, nombre, texto de enlace, selector y XPath relativo o absoluto @selenium2025 @riunet2018.

Analizar sigue el patrón de cada guion: abrir la página, actuar sobre los elementos, verificar estado o contenido, y capturar la pantalla como evidencia. Lo medido es presencia y visibilidad de elementos, texto ingresado y sugerencias, estado de controles, opciones de desplegables, títulos y direcciones en cada paso, y equivalencia del mismo guion en dos navegadores. La red impone un límite observado: el envío de consultas a Google redirige a verificación de tráfico inusual, así que esa parte queda documentada y fuera de la automatización.
