## Guía de migración: transición de active_period a communication_period e impact_period 

 
El GTFS-Realtime `alert.active_period` se definió como *“Tiempo en que la alerta debe mostrarse al usuario. Si no está presente, la alerta se mostrará mientras aparezca en el feed. Si se dan varios rangos, la alerta se mostrará durante todos ellos.”* 

Había una ambigüedad en esta definición donde el “tiempo en que la alerta debe mostrarse al usuario” puede interpretarse como: 
* Tiempo en que se informa al usuario de la alerta. 
* Tiempo en que la interrupción del servicio resultante de la alerta está en efecto. 

Para resolver esta ambigüedad, se introducen `communication_period` y `impact_period`. 
* `communication_period`: Tiempo en el que la alerta debe mostrarse al usuario estrictamente por razones informativas. 
* `impact_period`: Tiempo en el que los servicios se ven afectados por la alerta. 

Para garantizar la implementación de los nuevos campos manteniendo la compatibilidad con versiones anteriores y teniendo en cuenta los costos de infraestructura, la comunidad acordó asignar `active_period` como obsoleto pero permitir que coexista con `communication_period` y `impact_period`. 

Esta guía de migración define cómo interpretar la coexistencia de los 3 campos juntos y describe los pasos para la migración gradual a los nuevos campos `communication_period` y `impact_period`. El objetivo es convencer a productores y consumidores de que empiecen gradualmente a usar `communication_period` y `impact_period` en lugar de `active_period`. 
 
## Productores 

Para los productores, pueden seguir teniendo los 3 campos en la misma alerta. Intenten especificar `communication_period` y `impact_period` en tantas alertas como sea posible, especialmente alertas con NO_SERVICE. **¡No dupliquen alertas para separar active_period de los nuevos campos!** Configuren una alerta por incidente de servicio real, pueden especificar `communication_period`, `impact_period` y `active_period`. 

Siempre que una alerta tenga `communication_period` y `impact_period` especificados, se recomienda no incluir `active_period` (ya es un campo opcional). 

Para promover las mejores prácticas, se recomienda especificar `communication_period` y `impact_period` juntos tanto como sea posible. 

Todos los ejemplos siguientes son válidos. 

### La opción recomendada 

```` 
alert { 
“communication_period”: [{ "start": …, "end": … }], ← Tiempo en que el usuario es informado de la alerta. 
“impact_period”: [{ "start": …, "end": … }], ← Tiempo en que la interrupción del servicio resultante de la alerta está en efecto. Puede haber varios períodos de tiempo si la interrupción del servicio es recurrente. 
...
} 
```` 

### Otras opciones válidas que no se recomiendan 

```` 
alert { 
“active_period”: [{ "start": …, "end": … }], 
“communication_period”: [{ "start": …, "end": … }], 
"impact_period”: [{ "start": …, "end": … }], 
...
} 
```` 

```` 
alert { 
“active_period”: [{ "start": …, "end": … }], 
"impact_period”: [{ "start": …, "end": … }], 
...
} 
```` 

```` 
alerta { 
“período_activo”: [{ "inicio": …, "fin": … }], 
“período_comunicación”: [{ "inicio": …, "fin": … }], 
...
} 
```` 
 
```` 
alerta { 
“período_activo”: [{ "inicio": …, "fin": … }], 
...
} 
```` 

```` 
alerta { 
“período_comunicación”: [{ "inicio": …, "fin": … }], 
...
} 
```` 
 
```` 
alert { 
“impact_period”: [{ "start": …, "end": … }], 
...
} 
```` 

Se sugiere que notifique a los consumidores existentes (por ejemplo, a través de una lista de correo de desarrolladores) que el uso de `active_period` se está dejando de usar por una fecha límite establecida y que los consumidores deben comenzar a usar `commnication_period` y `impact_period` en su lugar. Esta guía de migración debe incluirse, con énfasis en la sección *"Consumidor"*. Después de que pase la fecha límite, puede eliminar las entidades `active_period` de su feed y publicar solo `commnication_period` y `impact_period`. 

## Consumidores 
 
Para los consumidores, puede interpretar los campos según su definición de especificación. 

Si `active_period` existe con `communication_period` y `impact_period`, **ignora `active_period`** y utilisa los otros dos campos. 
 
Si `active_period` existe con `impact_period`, **ignora active_period** y no lo interprete como `communication_period`. 
 
Si `active_period` existe con `communication_period`, **ignora active_period** y no lo interprete como `impact_period`. 

Si `active_period` existe solo, entonces úselo.