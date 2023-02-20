# Service Alerts

Os service alerts permitem que você forneça atualizações sempre que houver interrupção na rede. Atrasos e cancelamentos de viagens individuais geralmente devem ser comunicados usando [trip updates](trip-updates.md).

Você tem a opção de fornecer o seguinte:

*   URL - link para seu site, explicando mais sobre o alerta
*   Texto de cabeçalho - um resumo do alerta
*   Descrição - uma descrição completa do alerta, que será sempre mostrada ao lado do cabeçalho (portanto, não deve repetir esta informação).

## TimeRange

O alerta será exibido quando apropriado dentro do intervalo de tempo determinado. Este intervalo deve cobrir todo o tempo que o alerta for útil para que o passageiro veja.

Se nenhum tempo for dado, exibiremos o alerta pelo tempo em que ele estiver na alimentação. Se forem dados múltiplos intervalos, exibiremos durante todos eles.

## EntitySelector

O seletor de entidades permite especificar exatamente quais partes da rede este alerta afeta, para que possamos exibir somente os alertas mais apropriados para o usuário. Você pode incluir múltiplos seletores de entidades para alertas que afetam múltiplas entidades.

As entidades são selecionadas usando seus identificadores GTFS, e você pode selecionar qualquer uma das seguintes opções:

*   Agency - afeta toda a rede
*   Route - afeta toda a rota
*   Route type - afeta qualquer rota deste tipo. por exemplo, todos os metrôs.
*   Trip - afeta uma viagem em particular
*   Stop - afeta uma parada específica

Você pode incluir mais de um dos campos listados acima em uma `informed_entity`. Quando múltiplos campos são incluídos em `informed_entity`, eles devem ser interpretados como sendo unidos pelo operador lógico `AND`. Em outras palavras, o alerta só deve ser aplicado em um contexto que atenda a todos os campos fornecidos em `informed_entity`. Por exemplo, se `route_id: "1` " e `stop_id:` " `5` " estiverem ambos incluídos em `informed_entity`, então o alerta deve ser aplicado somente ao itinerário 1 na parada 5. NÃO deve ser aplicado a qualquer outra parada na rota 1, e NÃO deve ser aplicado a qualquer outra rota na parada 5.

Se você gostaria de representar um alerta que afeta mais de uma entidade (por exemplo, um alerta tanto para a rota 1 quanto para a parada 5) , você deve adicionar várias `informed_entity` ao seu `alert`, sendo que cada uma delas se aplica à entidade afetada (por exemplo, uma `informed_entity` que inclui a rota 1 e outra `informed_entity` que inclui a parada 5).

## Cause

Qual é a causa deste alerta? Você pode especificar uma das seguintes:

*   Unknown cause
*   Other cause (não representada por nenhuma destas opções)
*   Technical problem
*   Strike
*   Demonstration
*   Accident
*   Holiday
*   Weather
*   Maintenance
*   Construction
*   Police activity
*   Medical emergency

## Effect

Que efeito este problema tem sobre a entidade especificada? Você pode especificar um dos seguintes:

*   No service
*   Serviço reduzido
*   Reduced service (atrasos insignificantes só devem ser fornecidos através de [trip updates](trip-updates.md)).
*   Detour
*   Additional service
*   Modified service: As operações são diferentes do que o cavaleiro normalmente esperaria. Um exemplo é um alerta que lembra aos cavaleiros um horário de férias que é diferente do serviço normal naquele dia da semana.
*   Stop moved
*   Other effect (não representados por nenhuma destas opções)
*   Unknown effect
*   No effect: O alerta fornece informações para os cavaleiros, mas não afeta as operações. Exemplos incluem a publicidade de reuniões públicas e a solicitação de feedback através de pesquisas.
*   Accessibility issue: O alerta fornece informações sobre questões de acessibilidade que afetam o acesso sem etapas. Exemplos incluem um elevador fora de serviço ou rampas móveis.
