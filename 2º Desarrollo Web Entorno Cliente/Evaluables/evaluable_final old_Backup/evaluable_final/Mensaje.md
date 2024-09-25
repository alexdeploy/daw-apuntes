Hola!

Esto es un documento para hacerte unas acalaraciones y unas preguntas.

- Aclaraciones:

1. Al principio utilizaba un bucle "for" por cada nombre de clase diferente para filtrar los botones y añadirles los EventListeners, pero después se me ocurrió pasarlos con un "switch".

Para el "case" de los valores numéricos tenía un problema, no conseguía hacerlos entrar en la concidión, probé `(parseInt(action))` para que si se convirtieran en números, entraran en la condición, pero tampoco servía, incluso puse `(typeof(parseInt(action))`. Así que pensé que los valores que no pasaran los demás "case", son todos los números, así que lo dejé en (action).

2. Después no podía asignar el EventListener a cada botón porque en los parametros de `addEventListener` no podía poner una función con parámetros (para pasar el elemento) y no quería poner todos los "churros" de las funciones de los botones en cada "case", así que se me ocurrió utilizar funciones flecha. Es la primera vez que las utilizo de forma tan resumida :) qué gusto ha dado cuando el código queda tan limio!

- Dudas:

Estoy bastante contento con cómo ha quedado 