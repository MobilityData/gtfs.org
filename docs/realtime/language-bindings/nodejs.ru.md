# Языковые привязки JavaScript GTFS-realtime

[![npm версия](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

Предоставляет классы JavaScript и связанные с ними типы, созданные на основе спецификации [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer. Эти классы позволят вам разобрать двоичный поток данных ProtocolBuffer GTFS-realtime в объекты JavaScript.

Эти связки предназначены для использования в [среде Node.js](http://nodejs.org/), но при определенных усилиях их, вероятно, можно использовать и в других средах JavaScript.

Мы используем библиотеку [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) для поддержки протокольных буферов JavaScript.

## Добавьте зависимость

Чтобы использовать классы `gtfs-realtime-bindings` в своем проекте, вам нужно сначала установить наш [пакет Node.js npm](https://www.npmjs.com/package/gtfs-realtime-bindings):

    npm install gtfs-realtime-bindings

## Пример кода

Следующий фрагмент кода Node.js демонстрирует загрузку фида GTFS-realtime с определенного URL, его разбор как FeedMessage (корневой тип схемы GTFS-realtime) и итерацию результатов.

Для того чтобы этот пример заработал, необходимо сначала установить `node-fetch` с помощью NPM.

_Примечание: этот пример использует модули ES (синтаксис`import`/`export`) и не совместим с CommonJS (синтаксис `require` ). Вы можете использовать CommonJS, преобразовав `import` в `require` и установив `node-fetch@2`. Подробнее о ES-модулях [здесь](https://nodejs.org/api/esm.html)._

```javascript
import GtfsRealtimeBindings from "gtfs-realtime-bindings";
import fetch from "node-fetch";

(async () => {
  try {
    const response = await fetch("<GTFS-realtime source URL>", {
      headers: {
        "x-api-key": "<redacted>",
        // replace with your GTFS-realtime source's auth token
        // e.g. x-api-key is the header value used for NY's MTA GTFS APIs
      },
    });
    if (!response.ok) {
      const error = new Error(`${response.url}: ${response.status} ${response.statusText}`);
      error.response = response;
      throw error;
      process.exit(1);
    }
    const buffer = await response.arrayBuffer();
    const feed = GtfsRealtimeBindings.transit_realtime.FeedMessage.decode(
      new Uint8Array(buffer)
    );
    feed.entity.forEach((entity) => {
      if (entity.tripUpdate) {
        console.log(entity.tripUpdate);
      }
    });
  }
  catch (error) {
    console.log(error);
    process.exit(1);
  }
})();
```

Для получения более подробной информации о соглашениях об именах для классов JavaScript, созданных на основе the [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto), ознакомьтесь с [проектом ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js/wiki), который мы используем для сериализации буфера протокола.
