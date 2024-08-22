# Texto a voz

## Abreviaturas, pronunciaciones inusuales, dígitos grandes y ordinales 
 
 Las abreviaturas, pronunciaciones inusuales y dígitos grandes son comunes en los campos de texto GTFS. En el siguiente ejemplo para TriMEt, podemos ver cómo se debe utilizar el campo de texto a voz: 
 
 - Las abreviaturas están completamente escritas: por ejemplo, “SW” se convierte en “suroeste”; “Av” se convierte en “avenida”. 
 - Las pronunciaciones se escriben de forma que el software las lea correctamente: por ejemplo, “Orenco” se convierte en “orrainkoe”; “Merlo” se convierte en “murlo”. 
 - Los dígitos grandes se escriben como se dirían: “3300” se convierte en “treinta y tres cero cero. 
 De lo contrario, el software leerá “3300” como “tres mil trescientos”. 
 - Los ordinales, como 1.º, 2.º y 3.º, deben deletrearse: por ejemplo, “1.º” se convierte en “primero”. 
 
 [**stops.txt**](../../reference/#stopstxt) 
 
| stop_id | stop_name | tts_stop_name |
| ---- | ---- | ---- |
| 9163 | SW 125th & Longhorn | southwest one hundred twenty fifth & longhorn |
| 9836 | Orenco MAX Station | orrainkoe max station |
| 9828 | Merlo Rd/SW 158th Ave MAX Station | murlo road southwest one hundred fifty eighth avenue max station |
| 10074 | 3300 Block NW 35th | thirty-three-hundred block northwest thirty fifth |
 
## Acrónimos 
 
 Para los acrónimos a los que se hace referencia por sus letras, las letras deben ir seguidas de puntos o separadas por espacios. Esto aclara que el acrónimo debe leerse letra por letra y no como una palabra. 
 
 Para Tampa, el letrero “North to UATC” contiene un acrónimo que se pronuncia con sus letras individuales. La desambiguación de texto a voz sería: 
 
 [**trips.txt**](../../reference/#tripstxt) 
 
| trip_headsign | tts_trip_headsign |
| ---- | ---- |
| North to UATC | north to u.a.t.c. |
 
 o 
 
| trip_headsign | tts_trip_headsign |
| ---- | ---- |
| North to UATC | north to u a t c |
 
 Por el contrario, algunas siglas deben leerse como palabras: por ejemplo, OTAN; NASA. El campo de texto a voz debería reflejar esto. 
 
!!! note 
 
    El campo `trips.tts_trip_headsign` aún no es oficial en la especificación. 
 
## Aclaración de abreviaturas con múltiples significados 
 
 La abreviatura “St” tiene múltiples significados: “calle” (street), “santo” (saint), “estación” (station) y “1ª” para significar “primera”. El campo de conversión de texto a voz puede abordar estos dobles significados deletreando la palabra correcta y haciéndolo de manera que sea legible para el software TTS.