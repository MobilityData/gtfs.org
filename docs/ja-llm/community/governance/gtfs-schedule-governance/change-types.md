# 変更の種類 {: #change-types}

仕様に対する提案された変更は、その機能性や解釈への影響に基づいて分類されます。各カテゴリは、GTFS に正式に採用される前に特定のプロセスに従います。

<img class="center" width="1000" height="100%" src="../../../../../assets/governance-change-types.svg">

## 機能的変更 {: #functional-changes}

機能的変更とは、仕様の機能に大きな影響を与える修正を指します。これらの変更は通常、テストが必要であり、新しい要素（ファイル、フィールド、列挙型）の追加や既存の要素の修正を含みます。このような変更は、正式に採用されるために、仕様の完全な[変更プロセス](change-process.md)に従わなければなりません。

過去の例:

* [PR #405](https://github.com/google/transit/pull/405) は、新しいファイル networks.txt と route_networks.txt を追加しました。  
* [PR #385](https://github.com/google/transit/pull/385) は、fare_media.txt 内のフィールド fare_media_type に新しいオプションを追加しました。

## 非機能的変更 {: #non-functional-changes}

非機能的変更とは、機能に大きな影響を与えない仕様の重要な更新を指します。これらの変更は通常、テストを必要とせず、要件の更新、ベストプラクティスの追加や修正、ガバナンスフレームワークに対する編集以外の修正が含まれます。

### 要件の更新 {: #requirement-updates}

既存の機能に大きな変更を加えるものではありませんが、仕様内の現在の要素の実装や準拠に影響を与える修正です。これには、ファイルやフィールドの存在タイプの更新、ファイル要件の調整が含まれます。

* 過去の例:  
    * [PR #472](https://github.com/google/transit/pull/472) は stops.txt の存在を必須(Required)から条件付き必須(Conditionally Required)に変更しました。  
    * [PR #379](https://github.com/google/transit/pull/379) はすべての GTFS データセットに新しい要件を追加しました。  

### ガバナンス {: #governance}


仕様の管理を統括するプロセスやガイドラインの変更には、[変更プロセス](change-process.md)の更新、[役割と責任](roles.md)や[変更の種類](change-types.md)の修正、[基本原則](guiding-principles.md)の改訂、そして[ガバナンスフレームワーク](introduction.md)に関連するその他の文書の調整が含まれます。これらの更新は、明確で効果的な管理実務を保証するものです。

* 過去の例:   
    * [PR #387](https://github.com/google/transit/pull/387) は、仕様変更プロセスをスイスの営業日からカレンダー日数のみに切り替えるよう更新しました。

### ベストプラクティス {: #best-practices}


「should」文を使用して推奨事項を取り入れることで、仕様の特定部分を強化する変更です。これらの更新は、推奨されるアプローチや方法に関する指針を提供し、仕様の適用に柔軟性を持たせつつ、ユーザーがベストプラクティスに従うことを促します。

* 過去の例:  
    * [PR #485](https://github.com/google/transit/pull/485) は、行先表示(headsign)が推奨されることを追加する新しいベストプラクティスを作成しました。  
    * [PR #406](https://github.com/google/transit/pull/406) は、すべてのファイルに対するデータセット公開ガイドラインと実践推奨事項を仕様に導入しました。  

## ドキュメントの保守 {: #documentation-maintenance}

ドキュメントの保守に焦点を当てた仕様変更は、仕様の意味や機能を変更することなく、その明確さ、正確さ、表現を改善するために行われます。これらの更新には、仕様の現行の解釈を維持しつつ、より明確な説明を提供するために既存の内容を拡充することが含まれる場合があります。これらの変更にはレビューが必要ですが、投票を行うことなく採用することができます。

### 編集作業 {: #editorial}

これには、文法、スペル、句読点、誤植、古いリンクの修正が含まれます。また、改訂履歴に採用された変更を記録し、書式を調整することも含まれます。ガバナンス関連ファイルの編集更新もこのカテゴリに含まれます。

* 過去の例:  
    * [PR #506](https://github.com/google/transit/pull/505) 2024年9月の改訂履歴を更新  
    * [PR #361](https://github.com/google/transit/pull/361) fare_rules.txt 内のリンク切れを修正  
    * [PR #412](https://github.com/google/transit/pull/412) 誤って配置されていた既存の要件の位置を変更  

### 補足説明と例 {: #clarifications-examples}


補足説明は、理解を深めるために特定のポイントを展開し、必要な文脈を追加し、仕様をどのように適用するかを示す例を提供します。これらの更新により、意図された機能を変更することなく、利用者が正しく解釈し、従うことができるようになります。

* 過去の例:  
    * [PR #443](https://github.com/google/transit/pull/443) は、リファレンス文書の情報を補足する例ページへのリンクを追加しています  
    * [PR #426](https://github.com/google/transit/pull/426) は、意図された使用方法を反映するためにチケット商品の定義を修正しています
