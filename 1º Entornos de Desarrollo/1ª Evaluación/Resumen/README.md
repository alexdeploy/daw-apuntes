# Resumen Completo 1ª Evaluación

## TEMA 1 - Desarrollo de Software. Conceptos

- Informática: Ciencia que permite automatizar el procesamiento de la información.

- Software: Es el comportamiento lógico de un sistema informático.

- Bit / Byte: 

- Dispositivo: Puede ser digital o analógico. Un dispositivo digital es aquel capaz de almacenar información en forma de bits.

- Programar: Darle instrucciones y datos a un dispositivo para recibir una serie de resultados o provocar cierto comportamiento.

- Desarrollar software: Todo el tiempo que le dedicamos a el desarrollo. Incluye el diseño, análisis, pruebas, documentación, mantenimiento del software.

- Instrucción:

---

- Programa: Una serie de instrucciones ordenadas con una finalidad concreta que devuelven un valor o realizan una función determinada. Ejemplo: 

- Librería: Es un archivo o contenedor lógico, que contiene una serie de programas. Ejemplo: 

- Aplicación: Esta formada por uno o más programas con sus correspondientes librerías. Ejemplo: 

- Suite: Conjunto de aplicaciones que pueden ejecutarse independientemente unas de otras. Ejemplo: Microsoft Office

---

- Tipos de código: Fuente, Objeto, Ejecutable, Máquina.

  - Código Fuente:

  - Código Objeto:

  - Código Ejecutable:

  - Código Máquina:

- Compilador: Lenguajes intermedios que traducen el código máquina a otros lenguajes que nos ayudan a comunicarnos con los dispositivos.

- Enlazador: 

- Lenguaje de programación:

---

- Ejecutables portables:

- Ejecutables no portables:

- Scripts:

---

- Máquinas virtuales de sistema:

- Máquinas virtuales de proceso:

---

### ¿Cómo se califican los lenguajes?

- Tipo de ejecución:

  - Lenguajes Interpretados:

  - Lenguajes Compilados:

  - Lenguajes Virtuales:

- Nivel de Abstracción:

  - Bajo nivel:

  - Medio nivel:

  - Alto nivel: C++, Java, PHP, Python

- Paradigma de Programación:

  - Lenguajes Imperativos:

    - Estructurados:

    - Orientados a Objetos:

  - Languajes Declarativos: 

---

- Ingeniería de Software:

- Crisis del Software:

- Ciclo de vida del Software:

  1. Análisis
  
  2. Diseño

  3. Codificación

  4. Pruebas

  5. Documentación

  6. Explotación: (no confundir con implementación) consiste en publicar la solución final en la plataforma destino o entregar al cliente el producto final en el formato acordado.

  7. Mantenimiento: 

---

- Tipos de ciclos de vida:

  1. En cascada:

  2. Iterativo:

  3. Espiral:

  4. Incremental

- Modelización: 

- Lenguaje de Modelización Unificado (UML)

---

- Metodología de desarrollo:

  - Tradicionales:

  - Ágiles:

  - TDD o Test-Driven Development: NUEVA METODOLOGÍA que consiste en escribir primero las pruebas (generalmente unitarias), después escribir el código fuente que pase la prueba satisfactoriamente y, por último, refactorizar el código escrito.

## TEMA 2 - IDEs

### Conceptos

- Integrated Development Enviroment (IDE): Es una aplicación informática que tiene el objetivo de asistir al programador en la tarea de codificar un software mediante la inclusión de múltiples herramientas. Herramientas básicas:

    - Editor de código: Para escribir el código fuente.

    - Compilador: Para generar el código objeto y el ejecutable de lenguajes no interpretados.

    - Intérprete: Traduce el código.

    - Depurador: Corrige errores.

#### ¿Por qué utilizar un IDE?

- Permiten desarrollo colaborativo.

- Son “altamente configurables”: Atajos de teclado, Comandos, Herramientas...

- Permiten la virtualización de la ejecución del código.

- Te proporciona muchas funciones y herramientas útiles como:



#### ¿Cómo elegir uno?

1. Dependiendo del sistema operativo. Aunque ahora la mayoría ya son multiplataforma.

2. Dependiendo del lenguaje en el que queremos programar. Un IDE puede soportar varios lenguajes.

3. Dependiendo el Framework.

4. Dependiendo las herramientas y funciones que necesitemos.

#### IDEs más utilizados

### Netbeans

Comenzó como un proyecto estudiantil en Republica Checa (originalmente
llamado Xelfi), en 1996 bajo la tutoría de la Facultad de Matemáticas y Física en la universidad de Charles en Praga.

- Fundación APACHE: Es una organización sin fines de lucro (una fundación) creada para dar soporte a los proyectos de software bajo la denominación Apache. La ASF se formó a partir del llamado Grupo Apache y fue registrada en Delaware (Estados Unidos), en junio de 1999. En el año 2016 Oracle anunció que donaba el código de NetBeans a la fundación Apache para que esta se hiciera cargo de su desarrollo. Esto provocó un rebranding del software a su actual nombre Apache NetBeans.

- ANT Project: Es un formato proyecto. Es una carpeta con el conjunto de archivos de código fuente en Java, mas la información asociada a estos; Librerías, Estructura, Classpath... En dicha carpeta, se añade un fichero xml que se encarga de fijar los pasos para la compilación, depuración, ejecución y empaquetado del mismo.

### Eclipse

- Está escrito en su mayoría en Java y su uso principal es para desarrollar aplicaciones Java.

- También puede ser usado para desarrollar aplicaciones en otros lenguajes de programación a través de plugins, incluyendo; Ada, ABAP, C, C++, C#, Clojure, COBOL, D, Erlang, Fortran, Groovy, Haskell, JavaScript, Julia, Lasso, Lua, NATURAL, Perl, PHP, Prolog, Python, R, Ruby, Rust, Scala, y Scheme.

- Las características del programa se pueden ampliar y mejorar mediante el uso de plug-ins.

- Dispone de un editor de texto con resaltado de sintaxis.

- La compilación es en tiempo real.

- Tiene pruebas unitarias con Junit.

- Refactorización.

### Diferencias entre Netbeans y Eclipse

- Netbeans es más para principiantes.

- Eclipse al utilizar más complementos, tiene más impacto en el rendimiento.

- Netbeans necesita una extensión para apoyar el modelado.

- Netbeans requiere menos memoria.

- Netbeans utiliza el compilador de java mientras que Eclipse utiliza un compilador externo, y por tanto, la compilación incremental es más rápida.

- Y algunas más...



## TEMA 3 - CASE y GIT

## TEMA 4 - Diseño y Testing

### Teoría

- JUnit (Unit for Java)/ NUnit (Unit por .Net) / xUnit (Se utiliza para referirse a las pruebas en global)

- Caja Blanca

- Caja Negra

- Pruebas Unitarias: 

- Automatización de pruebas unitarias:

- Pruebas de integración: 

- Depuración de programas: 

- Errores de compilación: 

- Errores lógicos o "Bugs":

### Práctica

- Hacer Testing con JUnit en Netbeans y Eclipse. 

- Hacer Debugging con Netbeans y Eclipse.

## TEMA 5 - Documentación

Tipos de comentarios:

- `//` : Una linea.

- `/*` : Multilinea.

- `/**` : Javadoc.

Tags:

````java

/**
* @author - Indica el autor de la clase. Se pueden añadir varios separados por comas.

* @deprecated - Se utiliza para indicar que en un futuro pueden surgir incopatibilidades si siguen úsandolas. Para indicar la sustitución se utiliza '@link ...' {@link #method(int, int) methodName} .

* @param - Añade un parámetro y su descripción a la sección “Parameters” de la documentación. Se aplica a parámetros de constructores y métodos.

* @return - Añade a la sección “Returns” de la documentación. Se aplica a métodos. Describe el valor de retorno del método.

* @see - Añade un cabecero “See Also” con un enlace o texto que apunta a una referencia. Puede ser: un string, un enlace, un paquete, una clase, un método o un campo.

* @since - 

* @serial - 

* @throws - 
º
* @version - 
**/

````

### Tips:

- El comentario se debe poner inmediatamente antes del ítem a comentar.

- Los comentarios javadoc tienen dos partes: Descripción y Tags. Pueden ser texto o HTML.



## TEMA 6 - Refactorización