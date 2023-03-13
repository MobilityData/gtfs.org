# Vehicle Positions

A vehicle position é usada para fornecer informações geradas automaticamente sobre a localização de um veículo, tal como a partir de um dispositivo GPS a bordo. Uma única vehicle position deve ser fornecida para cada veículo que seja capaz de fornecê-la.

A viagem que o veículo está servindo atualmente deve ser dada através de um [TripDescriptor](../reference.md#message-tripdescriptor). Você também pode fornecer um [VehicleDescriptor](../reference.md#message-vehicledescriptor), que especifica um veículo físico preciso sobre o qual você está fornecendo atualizações. A documentação é fornecida abaixo.

Um **timestamp** indicando a hora em que a leitura da posição foi feita pode ser fornecido. Note que isto é diferente do carimbo de tempo no cabeçalho de alimentação, que é a hora em que esta mensagem foi gerada pelo servidor.

**Current passage** também pode ser fornecida (seja como um `stop_sequence` ou `stop_id`). Esta é uma referência à parada para a qual o veículo está a caminho, ou já parou.

## Position

A posição contém os dados de localização dentro da vehicle position. Latitude e longitude são obrigatórias, os outros campos são opcionais. Estes tipos de dados são:

*   **Latitude** - graus Norte, no sistema de coordenadas WGS-84
*   **Longitude** - graus Leste, no sistema de coordenadas WGS-84
*   **Bearing** - direção que o veículo está enfrentando
*   **Odometer** - a distância que o veículo percorreu
*   **Speed** - velocidade momentânea medida pelo veículo, em metros por segundo

## CongestionLevel

A vehicle position também permite à agência especificar o nível de congestionamento que o veículo está passando atualmente. O congestionamento pode ser classificado sob as seguintes categorias:

*   Unknown congestion level
*   Running smoothly
*   Stop and go
*   Congestion
*   Severe congestion

Cabe à agência classificar o que você classifica como cada tipo de congestionamento. Nossa orientação é que o congestionamento severo só é usado em situações em que o tráfego está tão congestionado que as pessoas estão deixando seus carros.

## OccupancyStatus

A vehicle position também permite que a agência especifique o grau de ocupação dos passageiros para o veículo. O grau de ocupação pode ser classificado sob as seguintes categorias:

*   Empty
*   Many seats available
*   Few seats available
*   Standing room only
*   Crushed standing room only
*   Full
*   Not accepting passengers

Este campo ainda é **experimental**, e está sujeito a mudanças. Ele pode ser adotado formalmente no futuro.

## VehicleStopStatus

O status de parada do veículo dá mais significado ao status de um veículo em relação a uma parada em que ele está se aproximando ou em que está atualmente. Ele pode ser ajustado a qualquer um destes valores.

*   **Incoming at** - o veículo está prestes a chegar à parada referenciada
*   **Stopped at** - o veículo é parado na parada referenciada
*   **In transit to** - a parada referenciada é a próxima parada para o veículo - **padrão**

## VehicleDescriptor

VehicleDescriptor descreve um veículo físico preciso e pode conter qualquer um dos seguintes atributos:

*   **ID** - sistema interno de identificação para o veículo. Deve ser exclusivo para o veículo
*   **Label** - um rótulo visível pelo usuário - por exemplo, o nome de um trem
*   **License plate** - a placa de carro real do veículo
