移行ガイド 

## 移行ガイド `active_period` から `communication_period` および `impact_period` への移行 

 
GTFS-realtime の `alert.active_period` は次のように定義されていました。アラートをユーザーに表示するするべきであるがある時間。指定がない場合、アラートはフィードに表示されている間表示されます。複数の範囲が指定されている場合、アラートはそれらのすべての期間に表示されます。 

この定義には、`アラートをユーザーに表示するするべきであるがある時間`が、次の両方と解釈できるという曖昧さがありました。 
- ユーザーにアラートが通知される時間。 
- アラートによって発生するサービスの中断が有効になっている時間。 

この曖昧さを解消するために、`communication_period` と `impact_period` が導入されました。 
-`communication_period`: 情報提供のみを目的として、アラートをユーザーに表示するするべきである時間。 
-`impact_period`: サービスがアラートの影響を受ける時間。 

後方互換性を維持し、インフラストラクチャ コストを考慮しながら新しいフィールドの実装を確実にするため、コミュニティは `active_period` を非推奨として割り当てるが、`communication_period` および `impact_period` と共存させることに合意しました。 

この移行ガイドでは、3 つのフィールドすべてが共存する場合の解釈方法を定義し、新しいフィールド`communication_period` および `impact_period` への段階的な移行手順の概要を示します。目標は、プロデューサーとコンシューマーに `active_period` の代わりに `communication_period` および `impact_period` を徐々に使用するように説得することです。 

##プロデューサー 
プロデューサーの場合、同じアラートに 3 つのフィールドすべてを含めることができます。できるだけ多くのアラート、特に NO_SERVICE のアラートで `communication_period` と `impact_period` を指定するようにしてください。**`active_period` を新しいフィールドから分離するためにアラートを重複させないでください!** 実際のサービスインシデントごとに 1 つのアラートを設定し、`communication_period`、`impact_period`、および `active_period` を指定できます。 

アラートに `communication_period` と `impact_period` が指定されている場合は、`active_period` を含めないことを推奨(すでに任意のフィールドです)。 

ベストプラクティスを促進するために、`communication_period` と `impact_period` をできるだけ一緒に指定することを推奨。 

以下の例はすべて有効です。 

###推奨オプション 

```` 
alert { 
“communication_period”: [{ "start": …, "end": … }], ← アラートがユーザーに通知される時間。 
“impact_period": [{ "start": …, "end": … }], ← アラートによって発生するサービス障害が有効な時間。サービス障害が繰り返し発生する場合は、複数の期間を指定できます。 
...
} 
```` 

###推奨ないその他の有効なオプション 

```` 
alert { 
“active_period”: [{ "start": …, "end": … }], 
“communication_period”: [{ "start": …, "end": … }], 
“impact_period": [{ "start": …, "end": … }], 
...
} 
```` 

```` 
alert { 
“active_period”: [{ "start": …, "end": … }], 
“impact_period": [{ "start": …, "end": … }], 
...
} 
```` 
 
```` 
alert { 
“active_period”: [{ "start": …, "end": … }], 
“communication_period”: [{ "start": …, "end": … }], 
...
} 
```` 
 
```` 
alert { 
“active_period”: [{ "start": …, "end": … }], 
...
} 
```` 

```` 
alert { 
“communication_period”: [{ "start": …, "end": … }], 
...
} 
```` 

```` 
alert { 
“impact_period”: [{ "start": …, "end": … }], 
...
} 
```` 

既存の消費者に、（開発者メーリングリストなどを介して）`active_period`の使用が設定された期限までに非推奨となり、代わりに `commnication_period`と `impact_period`を使用するするべきであることを通知することをお勧めします。この移行ガイドを含めるするべきである、*"Consumer"*セクションを強調する必要があります。期限が過ぎたら、フィードから`active_period`エンティティを削除し、`commnication_period`と `impact_period`のみを公開できます。 

## コンシューマー 

コンシューマーの場合、仕様定義に基づいてフィールドを解釈できます。 
-`active_period` が `communication_period` および `impact_period` と共に存在する場合、**`active_period` を無視して**、他の 2 つのフィールドを使用します。 

 
-`active_period` が `impact_period` と共に存在する場合、**`active_period` を無視して**、`communication_period` として解釈しません。 

 
-`active_period` が `communication_period` と共に存在する場合、**`active_period` を無視して**、`impact_period` として解釈しません。 

 
-`active_period` が単独で存在する場合は、それを使用します。