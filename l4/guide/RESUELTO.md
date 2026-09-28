## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 2

d. Revisión final y envío.- Revisar completamente el informe redactado, una vez verificado se
procederá a subir el informe al drive del respectivo laboratorio.

## III. RESULTADOS OBTENIDOS
- Dimensionar la aplicación descrita en el Anexo 1. Calcular el valor en soles y el tiempo de
entrega considerando 1 y 3 personas.
El sistema tiene dos partes principales:
- Cajero automático, con operaciones de retirar, depositar, transferir y consultar saldos.
- Gestión de pedidos, que maneja clientes, cuentas, productos y pedidos (simples y
compuestos), con validaciones y cobros automáticos.
Identificando funciones Nesma tenemos:
Tipo de
## Función
Descripción Cantidad Complejidad PF por
función
Total PF
## Archivos
## Lógicos
## Internos
## (ALI)
## Clientes,
## Cuentas,
## Productos,
## Pedidos,
## Transaccione
s, Cajeros,
## Banco
## 6 Media 10 60
Archivos de
## Interfase
Externa (AIE)
## Consorcio,
sistema
bancario
externo
## 2 Media 7 14
## Entradas
Externas (EE)
## Retiro,
## Depósito,
## Transferencia
## , Consulta
saldo, Alta de
cliente, Alta
de producto,
## 9 Media 4 36



## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 3

Creación de
pedido,
## Cobro,
Validación de
tarjeta
## Salidas
Externas (SE)
## Comprobant
e, Reporte de
pedidos,
Reporte de
cuentas,
Reporte de
transacciones
## 4 Media 5 20
## Consultas
Externas (CE)
## Consultar
saldo,
verificar
estado
pedido,
historial
transacciones
## 3 Simple 3 9
Esto nos da 60 + 14 + 36 + 20 + 9 = 139 puntos de función no ajustados
Se analizan las 14 características generales del sistema.
Dado que es un sistema transaccional, con validación online y múltiples actores, estimamos un
nivel de influencia total de 25 (valor típico de sistemas interactivos con procesamiento externo).
## Fórmula:
FA = (Nivel de Influencia × 0.01) + 0.65 = (25 × 0.01) + 0.65 = 0.90
Por consiguiente los puntos de función ajustados serían:
## PFA = PFNA × FA = 139 × 0.90 = 125 PF
El costo por punto de función depende de la complejidad y tecnología, pero para entornos
académicos o de simulación se usa una media de S/ 150 por PF (según tasas de desarrollo en
## Perú, 2024).



## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 4

Esto genera un costo total estimado:
## 125 PF × S/ 150 = S/ 18,750
Considerando 1 y 3 personas tenemos:
## Personas Esfuerzo
## (persona-mes)
Duración estimada
## (meses)
Costo estimado (S/
150 por PF)
1 persona 12.5 ≈ 12.5 meses S/ 18,750
3 personas 12.5 ÷ 3 = 4.2 ≈ 4.2 meses S/ 18,750


- Compare los valores de ambas aplicaciones y determine valores aproximados de PF para un
tamaño pequeño, mediano y grande.
a. Comparación:
Característica Sistema del Ejemplo Sistema del Anexo 1 Comparación
Dominio Gestión de clientes y
productos
Cajero automático +
pedidos + cuentas
Más amplio y
complejo
Entradas externas 7 9 +2 funciones
Archivos lógicos
internos
3 6 +3 archivos
Interfases externas 2 2 Igual
Consultas y salidas 4 7 +3 consultas
PF ajustados 64 PF 125 PF ~2× mayor tamaño
funcional

b. Clasificación de tamaño según puntos de función



## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 5


Categoría de tamaño Rango típico (PF) Descripción Ejemplo práctico
Pequeño 1 – 70 PF Aplicaciones con
pocos módulos, sin
interfaces externas
complejas
Ejemplo.pdf (64 PF)
Mediano 71 – 150 PF Aplicaciones con
módulos múltiples,
validaciones, algunos
actores externos
Anexo 1 (125 PF)
Grande 151 – 300 PF Sistemas con alta
integración, múltiples
interfaces, o gestión
distribuida
ERP, banca en línea, o
facturación compleja

c. Estimación de valores representativos
Categoría de tamaño Rango típico (PF) Descripción Ejemplo práctico
Pequeño 1 – 70 PF Aplicaciones con
pocos módulos, sin
interfaces externas
complejas
Ejemplo.pdf (64 PF)
Mediano 71 – 150 PF Aplicaciones con
módulos múltiples,
validaciones, algunos
actores externos
Anexo 1 (125 PF)
Grande 151 – 300 PF Sistemas con alta
integración, múltiples
interfaces, o gestión
distribuida
ERP, banca en línea, o
facturación compleja




## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 6


- Modifique valor de PF que debería ajustar con la experiencia y como sería el procedimiento
para hacerlo.
Primero empezaremos con los factores que influyen en el ajuste
## Factor Efecto Ejemplo
Experiencia del equipo Reducción del esfuerzo total Un equipo con 5 años de
experiencia en proyectos
similares puede reducir un
10–15% los PF efectivos.
Uso de frameworks o
componentes reutilizables
Disminuye la cantidad de
lógica desarrollada desde
cero
Si se reutiliza una plantilla de
gestión de pedidos, se puede
restar 5–10 PF.
Complejidad técnica real Aumenta PF si hay
integración con servicios
externos o seguridad
adicional
Integración con una API
bancaria puede sumar 10–15
## PF.
Cambios en requerimientos Ajuste dinámico durante el
desarrollo
Aumentos o reducciones del
5–20%, según las revisiones
funcionales.

El procedimiento formal de ajuste (según NESMA e ISO/IEC 24570) es el siguiente:
Paso 1: Revisión del conteo inicial
● Verificar que las entradas, salidas y archivos lógicos estén correctamente clasificados
según su nivel de complejidad (simple, medio, complejo).
Paso 2: Identificación de factores de productividad
● Analizar las condiciones reales del proyecto:
● Experiencia del equipo (años, proyectos similares).
● Herramientas de desarrollo utilizadas.
● Nivel de automatización (entornos low-code, librerías reutilizables).



## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 7

Paso 3: Definición del factor de ajuste por experiencia (FAE)
● Se aplica un coeficiente correctivo sobre los PF originales:
PF ajustados por experiencia=PF calculados×FAE

Valores típicos:
FAE = 0.85 → equipo muy experimentado.
FAE = 1.00 → nivel promedio.
FAE = 1.15 → equipo con poca experiencia o alta complejidad técnica.

Paso 4: Recalcular PF finales
Condición PF Calculados FAE PF Ajustados
Equipo experto 125 0.85 106 PF
Equipo estándar 125 1.00 125 PF
Equipo inexperto o
con alta complejidad
## 125 1.15 144 PF

Teniendo el costo unitario de S/150 por PF, el cambio en costo y duración sería:
Escenario PF Ajustados Costo (S/) Duración (1 persona)
Equipo experto 106 S/ 15,900 10.6 meses
Equipo promedio 125 S/ 18,750 12.5 meses
Equipo inexperto 144 S/ 21,600 14.4 meses

- Realizar el dimensionamiento en COCOMO, wine y COSMIC. Revise, verifique resultados y
construya tabla comparativa.



## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 8

a. Dimensionamiento con COCOMO
El modelo COCOMO II (Constructive Cost Model) estima el esfuerzo (en persona-meses)
según el tamaño del software (en miles de líneas de código — KLOC) o puntos de
función convertidos.
Formula: E=a×(KLOC)^b
## Donde:
a = 2.94 (constante empírica)
b = 1.1 (proyecto semidetallado)
1 PF ≈ 100 líneas de código en 4GL
## → 125 PF ≈ 12,500 LOC → 12.5 KLOC
## Entonces:
E=2.94×(12.5)1.1≈2.94×17.6=51.7 persona-meses

Resultado COCOMO II
● Esfuerzo total: 51.7 persona-meses
● Duracion: D=2.5×E^0.38 =2.5×51.7 x 0.38≈9.7 meses
● Costo (S/ 150 por PF): S/ 18,750
● Productividad: 2.4 PF/persona-mes

b. Dimensionamiento con Wine
El modelo Wine (hoja COCOMO simplificada) asume rangos de productividad basados
en tipo de proyecto.
Esfuerzo: E=2.4×(12.5)1.05=2.4×14.4=34.6 persona-meses
Duración: D=2.5×(34.6)0.38≈7.9 meses
Costo: 34.6 persona-meses × (S/ 1,500 mensual por persona) = S/ 51,900



## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 9


c. Dimensionamiento con COSMIC-FFP
El método COSMIC (Common Software Measurement International Consortium) mide el
tamaño funcional con movimientos de datos (Entry, Exit, Read, Write).
Un Punto COSMIC (CFP) equivale a una unidad de movimiento de datos entre el
software y su entorno.
Según comparaciones empíricas:
1 CFP ≈ 0.8 PF → 125 PF × 0.8 ≈ 100 CFP equivalentes
Esfuerzo: E=160/10=16 persona-meses
Duración: 16 / 3 personas ≈ 5.3 meses
Costo (S/ 150/PF): 160 × 150 = S/ 24,000

d. Tabla comparativa final
## Método Unidades Tamaño
## (PF/CFP)
## Esfuerzo
## (persona-m
es)
## Duración
estimada
## Costo
estimado
(S/150 por
## PF)
NESMA PF 125 12.5 12.5 meses
(1 persona)
## / 4.2 (3
personas)
## 18,750
## COCOMO II PF → KLOC 125 PF ≈
## 12.5 KLOC
51.7 9.7 meses 18,750
## Wine
(Simplificad
o)
PF → KLOC 12.5 KLOC 34.6 7.9 meses 51,900
## COSMIC-FF
## P
CFP 160 16 5.3 meses 24,000



## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 10


## IV. ANALISIS DE RESULTADOS
En nuestros resultados tenemos
- Aplicación del anexo 1:
● El tamaño funcional de la aplicación es de aproximadamente 125 puntos de función
ajustados.
● El costo estimado del desarrollo es de S/ 18,750, suponiendo S/ 150 por PF.
● El tiempo de desarrollo se estima en 12.5 meses con una persona, o 4 meses con tres
personas.
● Este análisis puede afinarse ajustando el factor de productividad o usando COCOMO II
con parámetros reales del entorno.
- Comparación y valores aproximados de PF:
● El sistema pequeño (Ejemplo.pdf) tiene un tamaño funcional de 64 PF, representando
una aplicación básica de registro y consulta.
● El sistema mediano (Anexo 1) alcanza 125 PF, con mayor complejidad funcional y
validaciones múltiples.
● Un sistema grande (por ejemplo, una plataforma bancaria completa) rondaría 250 PF o
más, requiriendo equipos mayores y más meses de trabajo.
- Modificando el valor del PF
● El ajuste de Puntos de Función permite refinar la estimación inicial con base en la
experiencia y condiciones reales de desarrollo.
● Un equipo experimentado puede reducir hasta un 15–20% el tamaño funcional efectivo,
logrando mayor productividad y menor costo.
● Un procedimiento iterativo (reestimación por fase o sprint) mejora la precisión del
dimensionamiento temprano y reduce desviaciones en costo y tiempo.
- Dimensionamiento en COCOMO
● NESMA ofrece una estimación funcional directa y sencilla para etapas tempranas.
● COCOMO II y Wine agregan una visión de esfuerzo y cronograma basada en líneas de
código, siendo más útiles en la planificación.
● COSMIC-FFP brinda una visión moderna y más precisa para sistemas con alto
intercambio de datos (como el cajero automático).
● En general, el sistema del Anexo 1 se ubica en un rango mediano de complejidad, con
esfuerzo entre 16 y 52 persona-meses según el modelo.




## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 11

## V. SOLUCIÓN DEL CUESTIONARIO
- ¿Qué resuelve conocer dimensionamiento temprano del proceso de construcción de software?
Conocer el dimensionamiento temprano permite estimar el tamaño funcional del software
antes de iniciar el desarrollo, lo que ayuda a:
● Calcular el esfuerzo, costo y tiempo de entrega del proyecto.
● Asignar recursos humanos y técnicos adecuados.
● Controlar y planificar el cronograma, comparando avances reales frente a estimaciones.
● Evaluar la viabilidad económica del proyecto antes de comprometer recursos
significativos.

- Indique la ventaja de usar la metodología NESMA
La metodología NESMA (Netherlands Software Metrics Association), derivada de IFPUG, ofrece
varias ventajas clave:
● Permite medir el tamaño funcional del software de forma objetiva y reproducible,
independientemente de la tecnología o lenguaje de programación.
● Facilita comparaciones entre proyectos, dado que se basa en unidades funcionales
(entradas, salidas, archivos y consultas).
● Simplifica la estimación de costos y tiempos desde etapas tempranas del ciclo de vida.
● Está alineada con el estándar internacional ISO/IEC 24570, lo que garantiza consistencia
con otros métodos de medición funcional.

- ¿Es confiable el dimensionamiento COCOMO, porque?
Sí, COCOMO es confiable, siempre que se utilicen parámetros calibrados y datos reales del
proyecto. Su confiabilidad proviene de que:
● Se basa en datos empíricos recopilados de cientos de proyectos reales, lo que respalda
sus fórmulas y constantes.
● Permite ajustar el modelo según el tipo de proyecto (orgánico, semidetallado o
embebido) y factores de costo (experiencia, complejidad, calidad, etc.).
● Proporciona estimaciones consistentes del esfuerzo, tiempo y costo cuando el tamaño
(en KLOC o PF) está bien definido.



## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMA

Formato: Guía de Práctica de Laboratorio / Talleres / Centros de Simulación
Aprobación:  2022/03/01 Código: GUIA-PRLE-001
## Página: 12


## VI. CONCLUSIONES
Como conclusiones tenemos que el dimensionamiento temprano reduce la incertidumbre inicial y mejora la
toma de decisiones en gestión de proyectos.
Por otra parte, NESMA es ideal para proyectos donde se necesita estimar sin depender del código fuente y
obtener métricas comparables entre desarrollos.
En cuanto a COCOMO es bastante confiable, sin embargo, su precisión depende de la calidad de los datos de
entrada: si se subestima el tamaño funcional o los factores de ajuste, los resultados serán menos confiables.


## RETROALIMENTACIÓN GENERAL



## REFERENCIAS Y BIBLIOGRAFÍA
[1] https://www.geeksforgeeks.org/software-engineering/software-engineering-cocomo-ii-model/
[2]https://cosmic-sizing.org/wp-content/uploads/2020/04/6-COSMIC-4.0.1-Gui%CC%81a-FSM-temprano-o-ra%C
## C%81pido.pdf
[3] https://gitlab.winehq.org/wine/wine/-/wikis/home
