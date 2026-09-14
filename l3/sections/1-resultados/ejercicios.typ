#import "/lib.typ": lab-section

== MODELADO DE SISTEMAS CON UML

=== Objetivo
El objetivo de la práctica es utilizar el Lenguaje Unificado de Modelado (UML) para el modelado de sistemas de software @omg2015uml. Se modelan requerimientos funcionales, estructuras estáticas de clases y flujos de actividades, verificando el cumplimiento de los puntos de vista del estándar del Instituto de Ingenieros Eléctricos y Electrónicos (IEEE) denominado IEEE Std. 1016-2009 para Descripciones de Diseño de Software (SDD) @ieee1016. Para la edición y generación visual de los diagramas se empleó la herramienta web PlantText disponible en https://www.planttext.com/.

== Diagrama de casos de uso para la descripción 1 del Anexo 1.
La Descripción 1 del Anexo 1 solicita el diagrama de casos de uso de un cajero automático con las operaciones de retirar efectivo, ingresar o depositar efectivo, hacer transferencias y obtener información de la cuenta, como movimientos y saldo. Antes de cualquier operación, el cajero debe validar la tarjeta y la clave que introduce el usuario mediante su Número de Identificación Personal (PIN). Se modela la interacción con el banco y el consorcio, entendido como la red de cajeros a la que se suscriben los bancos.

En la @fig-caso1-usecases se presenta el diagrama de casos de uso correspondiente.

#figure(
  image("../../img/ejercicio1_cajero_casos_uso.png", width: 70%),
  caption: [Diagrama de casos de uso para la descripción 1 del Anexo 1.],
) <fig-caso1-usecases>

== La descripción del diagrama 2, indique tipo de diagrama y regenere.
El Diagrama 2 corresponde a un Diagrama de Actividades según el estándar del Grupo de Gestión de Objetos (OMG).

Descripción del diagrama:
1. Inicia con la acción Recibe orden y se bifurca en dos ramas concurrentes.
2. Rama de pago: ejecuta Autoriza pago. Si ocurre fallo, se cancela la orden y finaliza; si resulta en éxito, avanza a la sincronización.
3. Rama de artículos: mediante un disparador múltiple por cada artículo de línea del pedido, comprueba el artículo de línea. Si está en existencia, se asigna a la orden. Si se necesita reordenar, se ejecuta la acción de reordenar artículo.
4. Sincronización: al cumplirse la condición de existencia asignada a todos los artículos de línea y pago autorizado, se despacha la orden y finaliza el flujo.

En la @fig-caso2-activity se presenta el diagrama regenerado.

#figure(
  image("../../img/ejercicio2_orden_actividad.png", width: 48%),
  caption: [Diagrama de actividades regenerado a partir del diagrama 2 del Anexo 1.],
) <fig-caso2-activity>

== Diagrama de clases para la descripción 3 del Anexo 1
La Descripción 3 del Anexo 1 define una aplicación para gestión de pedidos:
1. Maneja clientes con nombre, dirección, teléfono y correo electrónico. Cada cliente tiene una o varias cuentas para el pago asociadas a una tarjeta de crédito y con saldo disponible que aumenta periódicamente. Un cliente solo empieza un pedido si tiene alguna cuenta con saldo disponible.
2. Los productos registran cantidad en stock y solo se pueden pedir productos en stock.
3. Los pedidos se agrupan en simples o compuestos mediante el patrón Composite @gamma1994. Los pedidos simples se asocian a una sola cuenta de pago y contienen como máximo 20 unidades de producto. Los pedidos compuestos contienen dos o más pedidos simples o compuestos, y todos los pedidos simples deben pagarse con cuentas del mismo cliente.
4. Existe una clase con instancia única bajo el patrón Singleton @gamma1994 responsable del cobro diario, orden de distribución y confirmación. Si una cuenta no tiene fondos suficientes, el pedido se rechaza por completo.

En la @fig-caso3-class se presenta el diagrama de clases resultante.

#figure(
  image("../../img/ejercicio3_pedidos_clases.png", width: 72%),
  caption: [Diagrama de clases para la descripción 3 del Anexo 1.],
) <fig-caso3-class>

== Completar los 3 tipos de diagramas para cada caso.
Se completan los tres tipos de diagramas requeridos, casos de uso, clases y actividades, para cada uno de los tres casos del Anexo 1.

=== Caso 1: Cajero automático
El diagrama de casos de uso se presentó en el ejercicio 1. Se completa con clases y actividades:

#figure(
  image("../../img/ejercicio4_caso1_cajero_clases.png", width: 72%),
  caption: [Diagrama de clases para el cajero automático.],
) <fig-caso1-class>

#figure(
  image("../../img/ejercicio4_caso1_cajero_actividades.png", width: 48%),
  caption: [Diagrama de actividades para el cajero automático.],
) <fig-caso1-act>

=== Caso 2: Procesamiento y despacho de orden
El diagrama de actividades se presentó en el ejercicio 2. Se completa con casos de uso y clases:

#figure(
  image("../../img/ejercicio4_caso2_orden_casos_uso.png", width: 70%),
  caption: [Diagrama de casos de uso para el procesamiento de orden.],
) <fig-caso2-usecases>

#figure(
  image("../../img/ejercicio4_caso2_orden_clases.png", width: 48%),
  caption: [Diagrama de clases para el procesamiento de orden.],
) <fig-caso2-class>

=== Caso 3: Gestión de pedidos
El diagrama de clases se presentó en el ejercicio 3. Se completa con casos de uso y actividades:

#figure(
  image("../../img/ejercicio4_caso3_pedidos_casos_uso.png", width: 70%),
  caption: [Diagrama de casos de uso para la gestión de pedidos.],
) <fig-caso3-usecases>

#figure(
  image("../../img/ejercicio4_caso3_pedidos_actividades.png", width: 48%),
  caption: [Diagrama de actividades del cobro diario y distribución de pedidos.],
) <fig-caso3-act>

== Generar los mockup para requerimientos de Anexo 1
Se presentan las maquetas de Interfaz Gráfica de Usuario (GUI) para los requerimientos del Anexo 1.

=== Mockups para el cajero automático - Caso 1
En la @fig-mockup-atm-login se muestra la pantalla para introducir tarjeta y clave secreta. En la @fig-mockup-atm-menu se expone el menú con las operaciones disponibles. En la @fig-mockup-atm-withdraw se detalla la selección del importe de retiro.

#figure(
  image("../../img/mockup1_cajero_autenticacion.png", width: 52%),
  caption: [Mockup de validación de tarjeta y clave PIN.],
) <fig-mockup-atm-login>

#figure(
  image("../../img/mockup2_cajero_menu.png", width: 52%),
  caption: [Mockup de menú principal del cajero automático.],
) <fig-mockup-atm-menu>

#figure(
  image("../../img/mockup3_cajero_retiro.png", width: 52%),
  caption: [Mockup de retiro de efectivo.],
) <fig-mockup-atm-withdraw>

=== Mockups para la gestión de pedidos - Caso 3
En la @fig-mockup-order-client se muestra la gestión de cliente y cuentas con saldo. En la @fig-mockup-order-create se presenta la creación de pedidos respetando el límite de 20 unidades y la existencia en stock. En la @fig-mockup-order-admin se expone el panel del gestor de pedidos para cobro diario y distribución.

#figure(
  image("../../img/mockup4_pedidos_cliente_cuentas.png", width: 48%),
  caption: [Mockup de cliente y cuentas con saldo disponible.],
) <fig-mockup-order-client>

#figure(
  image("../../img/mockup5_pedidos_creacion.png", width: 48%),
  caption: [Mockup de creación de pedido con validación de stock y límite de unidades.],
) <fig-mockup-order-create>

#figure(
  image("../../img/mockup6_pedidos_admin_gestor.png", width: 48%),
  caption: [Mockup del panel de control del gestor de pedidos.],
) <fig-mockup-order-admin>

== Revisar e indicar si se ha cumplido del estándar IEEE Std. 1016-2009 Recommended Practice for Software Design Descriptions, utilice algún método de revisión y verificación.
Se utilizó el método de Revisión Basada en Listas de Verificación (CBR) para comprobar los puntos de vista requeridos por IEEE Std. 1016-2009 en los modelos elaborados:

#table(
  columns: (1.5fr, 1.2fr, 2.5fr),
  align: left + horizon,
  stroke: 0.5pt + rgb("#808080"),
  table.header(
    table.cell(fill: rgb("#EAEAEA"))[Punto de Vista IEEE 1016],
    table.cell(fill: rgb("#EAEAEA"))[Estado],
    table.cell(fill: rgb("#EAEAEA"))[Evidencia de Cumplimiento],
  ),
  [Contexto], [Cumple], [Casos de uso delimitando frontera del sistema y actores.],
  [Composición], [Cumple], [Descomposición de pedidos en simples y compuestos.],
  [Lógico], [Cumple], [Diagramas de clases con entidades, métodos y atributos.],
  [Dependencias], [Cumple], [Relaciones de inclusión, asociaciones y herencia.],
  [Información], [Cumple], [Estructura de datos en clases y atributos de cuentas.],
  [Dinámica de estados], [Cumple], [Estados de pedidos y transiciones de cobro.],
  [Algoritmos y actividades], [Cumple], [Flujos de cobro diario, despacho y retiro en actividades.],
  [Interacción], [Cumple], [Comunicación entre cajero, consorcio y banco.],
  [Recursos], [Cumple], [Control de disponibilidad de saldo y existencias de stock.],
)

Se concluye que el diseño cumple con los puntos de vista requeridos por el estándar.

== Genere una tabla de todos los diagramas UML, describa la utilidad de cada uno.
A continuación se resume la utilidad de los catorce diagramas oficiales de UML 2.5:

#table(
  columns: (1.3fr, 1.2fr, 2.7fr),
  align: left + horizon,
  stroke: 0.5pt + rgb("#808080"),
  table.header(
    table.cell(fill: rgb("#EAEAEA"))[Diagrama UML],
    table.cell(fill: rgb("#EAEAEA"))[Categoría],
    table.cell(fill: rgb("#EAEAEA"))[Utilidad],
  ),
  [Clases], [Estructural], [Muestra clases, atributos, métodos y relaciones estáticas.],
  [Objetos], [Estructural], [Muestra instancias concretas de clases en un momento dado.],
  [Componentes], [Estructural], [Organiza módulos de software y sus dependencias.],
  [Despliegue], [Estructural], [Mapea componentes de software en nodos de hardware.],
  [Paquetes], [Estructural], [Agrupa elementos del modelo en subsistemas lógicos.],
  [Estructura Compuesta], [Estructural], [Muestra la estructura interna y puertos de un clasificador.],
  [Perfiles], [Estructural], [Permite definir estereotipos para dominios particulares.],
  [Casos de Uso], [Comportamiento], [Modela requerimientos funcionales y actores del sistema.],
  [Actividades], [Comportamiento], [Modela flujos de trabajo, decisiones y concurrencia.],
  [Máquina de Estados], [Comportamiento], [Modela el ciclo de vida y cambios de estado de un objeto.],
  [Secuencia], [Interacción], [Muestra el intercambio temporal de mensajes entre objetos.],
  [Comunicación], [Interacción], [Enfatiza la organización estructural de objetos que colaboran.],
  [Tiempos], [Interacción], [Modela cambios de estado a lo largo de una escala temporal.],
  [Global de Interacción], [Interacción], [Ofrece una vista general combinando actividades y secuencias.],
)

== Genere un reporte de la práctica y exponga sus conclusiones
El reporte de la práctica se encuentra documentado a lo largo del presente documento, y las conclusiones obtenidas se exponen de manera estructurada en la sección correspondiente.
