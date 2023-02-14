---
search:
    exclude: true
---

# Texto a voz

<hr/>

## Abreviaturas, pronunciaciones inusuales, dígitos grandes y ordinales

Las abreviaturas, las pronunciaciones inusuales y los dígitos grandes son habituales en los campos de texto GTFS. En el siguiente ejemplo de TriMEt, podemos ver cómo debería utilizarse el campo de texto a voz:

- Las abreviaturas se escriben completamente: por ejemplo, "SW" se convierte en "southwest"; "Ave" en "avenue".
- Las pronunciaciones se escriben de forma que el software las lea correctamente: por ejemplo, "Orenco" se convierte en "orrainkoe"; "Merlo" se convierte en "murlo".
- Las cifras grandes se escriben como se dirían: "3300" se convierte en "treinta y trescientos".

De lo contrario, el programa informático leería "3300" como "tres mil trescientos".

- Los ordinales, como 1º, 2º y 3º, deben deletrearse: por ejemplo, "1º" se convierte en "primero".

[**stops.txt**](../../reference/#stopstxt)

| stop_id | stop_name                             | tts_stop_name                                                     |
| ------- |---------------------------------------|-------------------------------------------------------------------|
| 9163    | SW 125th &amp; Longhorn               | suroeste ciento veinticinco &amp; longhorn                        |
| 9836    | Estación Orenco MAX                   | orrainkoe max station                                             |
| 9828    | Estación MAX de Merlo Rd/SW 158th Ave | estación max murlo road southwest one hundred fifty eighth avenue |
| 10074   | 3300 Bloque NW 35th                   | cuadra treinta y tres al noroeste treinta y cinco                 |

## Acrónimos

En el caso de los acrónimos a los que se hace referencia por sus letras, éstas deberían ir seguidas de puntos o separadas por espacios. Esto aclara que el acrónimo debería leerse letra por letra, y no como una palabra.

En el caso de Tampa, la cabecera "Norte a UATC" contiene un acrónimo que se pronuncia por sus letras individuales. La desambiguación texto-voz sería:

[**trips.txt**](../../reference/#tripstxt)

| trip_headsign | tts_trip_headsign |
| ------------- | ----------------- |
| Norte a UATC  | norte a u.a.t.c.  |

o

| trip_headsign | tts_trip_headsign |
| ------------- | ----------------- |
| Norte a UATC  | norte a u a t c   |

Por el contrario, algunos acrónimos deberían leerse como palabras: por ejemplo, OTAN; NASA. El campo de texto a voz debería reflejar esto.

!!! Nota

    El campo `trips.tts_trip_headsign` todavía no es oficial en la especificación.

## Aclaración de las abreviaturas con significados múltiples

La abreviatura "St" tiene múltiples significados: "calle", "santa", "estación" y "1ª" para significar "primera". El campo de texto a voz puede tratar estos double significados deletreando la palabra correcta y haciéndolo de forma legible para el software TTS.
