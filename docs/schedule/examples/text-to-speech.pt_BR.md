---
search:
    exclude: true
---

# Texto para o discurso

<hr/>

## Abreviaturas, pronúncias incomuns, dígitos grandes e ordinais

Abreviações, pronúncia incomum e dígitos grandes são comuns aos campos de texto GTFS. No exemplo abaixo para a TriMEt, podemos ver como o campo texto-para-fala deve ser usado:

- As abreviações são totalmente soletradas: por exemplo, "SW" torna-se "sudoeste"; "Ave" torna-se "avenida".
- As pronúncias são soletradas de forma que o software as leia corretamente: por exemplo, "Orenco" torna-se "orrainkoe"; "Merlo" torna-se "murlo".
- Dígitos grandes são escritos como seriam ditos: "3300" se torna "trinta e três centenas".

Caso contrário, o software passaria a ler "3300" como "três mil e trezentos".

- Ordinais, tais como 1º, 2º e 3º, devem ser soletrados: por exemplo, "1º" torna-se "primeiro".

[**stops.txt**](../../reference/#stopstxt)

| stop_id | stop_name                        | tts_stop_name                                                        |
| ------- | -------------------------------- | -------------------------------------------------------------------- |
| 9163    | SW 125th &amp; Longhorn          | sudoeste cento e vinte e cinco &amp; longhorn                        |
| 9836    | Estação Orenco MAX               | estação orrainkoe max                                                |
| 9828    | Estação Merlo Rd/SW 158ª Ave MAX | murlo road southwest cento e cinquenta e oito avenida estação máxima |
| 10074   | 3300 Bloco NW 35                 | trigésima terceira centena de blocos a noroeste trigésima quinta     |

## Siglas

Para as siglas que são referidas por suas letras, as letras devem ser seguidas por pontos ou separadas por espaços. Isto esclarece que a sigla deve ser lida letra por letra, e não lida como uma palavra.

Para Tampa, a sigla "Norte para UATC" contém uma sigla que é pronunciada por suas letras individuais. A desambiguação do texto para a fala seria:

[**trips.txt**](../../reference/#tripstxt)

| trip_headsign   | tts_trip_headsign |
| --------------- | ----------------- |
| Norte para UATC | norte a u.a.t.c.  |

ou

| trip_headsign   | tts_trip_headsign     |
| --------------- |-----------------------|
| Norte para UATC | do norte para u a t c |

Ao contrário, alguns acrônimos devem ser lidos como palavras: por exemplo, OTAN; NASA. O campo texto-para-fala deve refletir isto.

!!! Nota

    O campo `trips.tts_trip_headsign` ainda não é oficial na especificação.

## Esclarecendo abreviações com múltiplos significados

A abreviação "St" tem múltiplos significados: "rua", "santo", "estação" e "1º" para significar "primeiro". O campo texto-para-fala pode endereçar esses double significados ao soletrar a palavra correta, e fazendo isso de uma forma legível pelo software TTS.
