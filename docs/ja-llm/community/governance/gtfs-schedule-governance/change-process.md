# 変更プロセス {: #change-process}

## 概要 {: #overview}

仕様変更プロセスは、コミュニティが [GTFS Repository](https://github.com/google/transit/pulls) において、仕様への変更を提案、レビュー、採用する方法を案内するものです。

仕様変更プロセスは **2つの主要な段階** に分かれており、3つの [変更タイプ](change-types.md) に基づいて **3つのトラック** に分類されます。それらは [機能的変更](change-types.md/#functional-changes)、[非機能的変更](change-types.md/#non-functional-changes)、および [ドキュメント保守](change-types.md/#documentation-maintenance) です。

<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-overview.svg">

### ステージ1: Issue {: #stage-1-issue}

Issue ステージは、新しいアイデアの議論、ニーズの特定、仕様改善の提案を目的としています。Issue は、変更の必要性や支持を評価するとともに、Pull Request ステージに進むために必要なリソースを整理する役割を果たします。

新しいアイデアに関して合意形成を行うために、Issue ステージから始めることが推奨されます。ただし、提案の範囲がすでに明確に定義されている場合は、直接 Pull Request ステージから始めることも適切です。

### ステージ2: プルリクエスト {: #stage-2-pull-request}

プルリクエストのステージは、イシューステージで出されたアイデアが仕様に向けて開発・実装される段階です。このステージは、変更の種類に応じて3つのトラックに分かれています。

このプロセス全体は [GitHub google/transit リポジトリ](https://github.com/google/transit/pulls) 内で行われ、すべての変更が採用される前に徹底的に評価されることを保証します。

## プロセストラック {: #process-tracks}

提案された変更の種類に応じて、変更プロセスには異なるトラックが適用されます。Issue 段階は3つのトラックすべてで同じですが、Pull Request 段階は各トラックごとに異なります。

### トラックA: 機能的変更 {: #track-a-functional-changes}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-functional.svg">

このプロセスは、コミュニティが [GTFS Repository](https://github.com/google/transit/pulls) における仕様への [機能的変更](change-types.md/#functional-changes) を提案、レビュー、採用する方法を示しています。 

* 提案は、GTFS Repository に Pull Request を作成することで提出されます。  
* コミュニティは提案を洗練させるために議論を行います。この期間は少なくとも7日間続かなければなりません。  
* [Contributors](roles.md/#contributors) と [Maintainer](roles.md/#maintainer) が提案された変更をレビューします。この期間は少なくとも7日間続かなければなりません。  
* テストの前に、コミュニティは提案に対する全会一致の合意を確認するための投票を行います。これは、参加するすべての投票者が賛成しなければならないことを意味します。有効な投票とするためには、少なくとも5人のContributorが参加し、そのうち最低2人がProducer、2人がConsumerでなければなりません。投票期間は少なくとも14日間続かなければなりません。  
* [First Adopters](roles.md/#first-adopter) が提案された変更をテストします。  
* コミュニティは、変更を正式に採用すべきかどうかを決定するための投票を行います。この投票は80%多数決ルールに従い、投票の少なくとも80%が賛成でなければ可決されません。有効な投票とするためには、少なくとも5人のContributorが参加し、そのうち最低2人がProducer、2人がConsumerでなければなりません。投票期間は少なくとも14日間続かなければなりません。  
* 最後に、変更が仕様に実装されます。  

### トラックB: 非機能的変更 {: #track-b-non-functional-changes}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-non-functional.svg">

このプロセスは、コミュニティが [GTFS Repository](https://github.com/google/transit/pulls) における仕様への [非機能的変更](change-types.md/#non-functional-changes) を提案、レビュー、採択する方法を示しています。

* 提案は、GTFS Repository に Pull Request を作成することで提出されます。  
* コミュニティは提案を洗練させるために議論を行います。この期間は少なくとも7日間続かなければなりません。  
* [Contributors](roles.md/#contributors) と [Maintainer](roles.md/#maintainer) が提案された変更をレビューします。この期間は少なくとも7日間続かなければなりません。  
* コミュニティは、変更を正式に採択すべきかどうかを決定するために投票を行います。この投票は80%多数決ルールに従い、可決には少なくとも80%の賛成票が必要です。有効な投票とするためには、少なくとも5人のContributorが参加し、そのうち最低2人のProducerと2人のConsumerを含まなければなりません。投票期間は少なくとも14日間続かなければなりません。  
* 最後に、変更が仕様に実装されます。  

### トラック C: ドキュメント保守 {: #track-c-documentation-maintenance}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-documentation.svg">

このプロセスは、コミュニティが [ドキュメントを保守するための変更](change-types.md/#documentation-maintenance) を [GTFS Repository](https://github.com/google/transit/pulls) に提案、レビュー、採用する方法を示しています。

* 提案は、GTFS Repository に Pull Request を作成することで提出されます。  
* コミュニティは提案を洗練するために議論を行います。この期間は少なくとも7日間続かなければなりません。  
* [Contributors](roles.md/#contributors) と [Maintainer](roles.md/#maintainer) が提案された変更をレビューします。この期間も少なくとも7日間続かなければなりません。  
* 最後に、変更が仕様に実装されます。  

## プロセス手順 {: #process-steps}


Issue と Pull Request の各段階におけるすべての手順を以下に示します。Track A のみがすべての手順を利用することに注意してください。Track B と Track C は、短縮版のプロセスを利用します: 

|  | Track A: 機能的変更 | Track B: 非機能的変更 | Track C: ドキュメント保守 |
| ----- | :---: | :---: | :---: |
| **[ステップ 1.1: Issue 公開](#step-11-issue-publication)** | ✓ | ✓ | ✓ |
| **[ステップ 1.2: Issue 議論](#step-12-issue-discussion)** | ✓ | ✓ | ✓ |
| **[ステップ 2.1: Pull Request 公開](#step-21-pull-request-publication)** | ✓ | ✓ | ✓ |
| **[ステップ 2.2: Pull Request 議論](#step-22-pull-request-discussion)** | ✓ | ✓ | ✓ |
| **[ステップ 2.3: Pull Request レビュー](#step-23-pull-request-review)** | ✓ | ✓ | ✓ |
| **[ステップ 2.4: テスト投票](#step-24-vote-to-test)** | ✓ |  |  |
| **[ステップ 2.5: テスト](#step-25-testing)** | ✓ |  |  |
| **[ステップ 2.6: 採用投票](#step-26-vote-to-adopt)** | ✓ | ✓ |  |
| **[ステップ 2.7: 採用](#step-27-adoption)** | ✓ | ✓ | ✓ |

### ステップ 1.1: Issue の公開 {: #step-11-issue-publication}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-step-1.1.svg">

[貢献者](roles.md/#contributors) は、[GTFS リポジトリ](https://github.com/google/transit/pulls) に Issue を作成することで、仕様を改善するためのアイデアを共有します。 

* 誰でも Issue を作成して議論を始めることができます。

**<ins>アクション</ins>** 

1. **Issue の提出**

    * [貢献者](roles.md/#contributors) は、アイデアとそれが解決する問題を説明する Issue を投稿します。

**<ins>提案</ins>** 

| 提案 | 詳細 |
| :---- | :---- |
| **仕様変更テンプレートを使用する** | [提供されているテンプレート](https://github.com/google/transit/issues/new?assignees=&labels=spec-change&projects=&template=spec_change.yml) を使用し、フィールドに概要を記入してください。 |
| **議論を促す** | 内容は完璧である必要はなく、議論を刺激し、会話が進むにつれて変化していくべきです。 |
| **関心のある貢献者をタグ付けする** | 議論に関心を持ちそうな他の貢献者をタグ付けし、関連するプラットフォームで Issue を共有してください。 |

### ステップ 1.2: Issue 議論 {: #step-12-issue-discussion}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-step-1.2.svg">

コミュニティは、次の段階で Pull Request として提出される仕様変更の提案を作成するために議論を行います。

**<ins>アクション</ins>** 

1. **Issue 議論**

    * [貢献者](roles.md/#contributors) は元の Issue 投稿に返信し、フィードバックを共有します。

2. **ワーキンググループ提案**

    * 必要に応じて、任意の [貢献者](roles.md/#contributors) が、ビデオ会議ソフトウェアを使用して関心のあるすべての関係者間で議論を促進するためにワーキンググループの設立を提案することができます。  
    * ワーキンググループは、任意の [貢献者](roles.md/#contributors) または [メンテナー](roles.md/#maintainer) によって組織することができます。  
    * ワーキンググループ会議で行われた議論は、Issue コメントに要約するべきです。

**<ins>提案</ins>** 

| 提案 | 詳細 |
| :---- | :---- |
| **議論の範囲を明確化** | 提案の範囲を明確にすることに議論を集中させます。 |
| **要件の確認** | 提案を作成するために必要なすべての要件が確認されていることを確実にします。 |
| **意見収集** | 複数の貢献者からフィードバックを収集し、提案に対する全体的な支持を評価します。 |
| **議論の要約** | 合意に達した点、合意された範囲、アドボケートやテストに関心のある関係者の発表など、最新の議論内容を元の投稿に定期的に更新します。 |
| **潜在的なアドボケートの特定** | 完全な提案を作成し、Pull Request 段階でアドボケートの役割を担う意思のある貢献者を特定します。 |

### ステップ 2.1: プルリクエストの公開 {: #step-21-pull-request-publication}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-step-2.1.svg">

> 注: すべてのトラックに適用されます

仕様変更の提案は、[GTFS Repository](https://github.com/google/transit/pulls) にプルリクエストを作成することで公開されます。提案を公開する [Advocate](roles.md/#advocate) は、1つの変更に集中しなければなりません。誰でも修正を提案することができます。

**<ins>アクション</ins>** 

1. **変更の適用**

    * [Advocate](roles.md/#advocate) は、元の [GTFS Repository](https://github.com/google/transit/pulls) を、自身または所属組織のアカウントに [fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo#forking-a-repository) します。  
    * [Advocate](roles.md/#advocate) は、fork 内にブランチを作成し、提案された変更を適用します。 

2. **プルリクエストの提出**

    * [Advocate](roles.md/#advocate) は、自身の fork から [GTFS Repository](https://github.com/google/transit/pulls) に [プルリクエスト](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request-from-a-fork) を作成します。 

**<ins>要件</ins>**

| 要件 | 詳細 |
| :---- | :---- |
| **単一の変更** | プルリクエストは、1回につき1つの変更に集中するべきです。「単一の変更」とは、自己完結した修正であり、1つの概念、機能、またはルールに焦点を当て、無関係な更新をまとめないものを指します。 |
| **詳細な説明**  | プルリクエストには、提案された変更の詳細な説明を含めなければなりません。提供されている [プルリクエストテンプレート](https://github.com/google/transit/blob/master/.github/PULL_REQUEST_TEMPLATE.md) に従うことが推奨されます。 |
| **変更の種類** | Advocate は、プルリクエストの冒頭で変更の種類（機能的、非機能的、またはドキュメント保守）を指定しなければなりません。  <br>- すべてのコントリビューターは、誤分類された変更をいつでも指摘し、正しい採用トラックに従うようにすることができます。 <br>- 合意に至らない場合、Maintainer が明確化を行い、適切なトラックを推奨することができます。 |
| **提案される議論期間** | Advocate は、提案された変更の範囲に基づいて、最低限の推定議論期間を指定するべきです。  <br>- 例: 「提案について全員が十分に議論できるよう、少なくとも1か月の議論期間を確保することを推奨します。」 |
| **メーリングリストでの告知** | Advocate は、[GTFS Changes メーリングリスト](https://groups.google.com/g/gtfs-changes) にプルリクエストの作成を告知しなければなりません。その際には、変更の簡単な説明とプルリクエストへのリンクを含める必要があります。 |

### ステップ 2.2: プルリクエストでの議論 {: #step-22-pull-request-discussion}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-step-2.2.svg">
  
> 注: すべてのトラックに適用されます 

コミュニティは、提案を洗練し発展させるための議論を行います。

**<ins>アクション</ins>** 

1. **提案の議論**

    * [貢献者](roles.md/#contributors) はプルリクエストのコメント欄で提案について議論します。

2. **提案の更新**

    * [提案推進者](roles.md/#advocate) は、受け取ったコメントに基づいて提案内容を更新します。

3. **ワーキンググループでの提案**

    * 必要に応じて、任意の [貢献者](roles.md/#contributors) が、ビデオ会議ソフトウェアを用いて関心のあるすべての関係者間で議論を行うためのワーキンググループの設立を提案することができます。  
    * ワーキンググループは [提案推進者](roles.md/#advocate) または [メンテナー](roles.md/#maintainer) のいずれかが組織することができます。  
    * ワーキンググループの会議で行われた議論は、プルリクエストのコメントに要約して記録するべきです。

**<ins>要件</ins>** 

| 要件 | 詳細 |
| :---- | :---- |
| **最小議論期間**  | 議論は提案推進者が必要と考える期間続きますが、少なくとも7日間の暦日が必要です。 |
| **コントリビューターライセンス契約** | 提案に編集を加えるすべての貢献者（提案推進者を含む）は、[コントリビューターライセンス契約](https://github.com/google/transit/blob/master/CONTRIBUTING.md#before-you-contribute) に署名しなければなりません。 |

### ステップ 2.3: プルリクエストのレビュー {: #step-23-pull-request-review}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-step-2.3.svg">

> 注: すべてのトラックに適用されます 

コミュニティは [Advocate](roles.md/#advocate) にフィードバックを提供し、提案をテストに向けて準備します。 

**<ins>アクション</ins>** 

1. **レビュー期間の告知**

    * [Advocate](roles.md/#advocate) がプルリクエストのコメント欄でレビュー期間の開始を告知します。

2. **Maintainer によるレビュー**

    * [Maintainer](roles.md/#maintainer) がプルリクエストをレビューし、用語が現行の仕様と整合しているかを確認します。   
    * [Maintainer](roles.md/#maintainer) はコメントで修正を提案するか、言語が正しいことを確認し、それに応じて [Advocate](roles.md/#advocate) が必要な調整を行い、次のステップに進みます。

3. **Contributor からのフィードバック**

    * [Contributors](roles.md/#contributors) もこの期間中にプルリクエストをレビューし、[Advocate](roles.md/#advocate) がテスト前に最終調整を行えるようフィードバックを提供することができます。

**<ins>要件</ins>** 

| 要件 | 詳細 |
| :---- | :---- |
| **最小レビュー期間**  | レビューは Advocate が必要と判断する期間続きますが、少なくとも 7 日間の暦日が必要です。<br>- Documentation Maintenance Track には最小レビュー期間の要件はありません。 |

### ステップ 2.4: テストへの投票 {: #step-24-vote-to-test}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-step-2.4.svg">

> 注: Track B: 非機能的変更および Track C: ドキュメント保守 には該当しません

コミュニティは、提案の範囲に関するコンセンサスを確認し、テストに進めるのに十分な技術的妥当性があることを確認するために投票を行います。

**<ins>アクション</ins>** 

1. **投票開始の告知**

    * [Advocate](roles.md/#advocate) が Pull Request のコメント欄で投票開始を告知し、投票終了時刻を明記します。  
    * [Advocate](roles.md/#advocate) が [GTFS Changes メーリングリスト](https://groups.google.com/g/gtfs-changes) のディスカッションスレッドで投票を告知し、Pull Request コメントへのリンクと投票終了時刻を提供します。

2. **投票プロセス**  
     
    * [Contributors](roles.md/#contributors) は Pull Request のコメント欄で投票しなければなりません。

3. **編集とキャンセル**  
     
    * [Advocate](roles.md/#advocate) は投票期間中、編集上の目的に限り提案を編集することができます。それ以外の変更は投票プロセスを再開する必要があります。  
    * [Advocate](roles.md/#advocate) はいつでも投票をキャンセルすることができます。  
    
4. **投票終了の告知**  
     
    * [Advocate](roles.md/#advocate) は Pull Request のコメント欄で投票終了を告知し、結果を含めます。  
    * [Advocate](roles.md/#advocate) はまた、[GTFS Changes メーリングリスト](https://groups.google.com/g/gtfs-changes) のディスカッションスレッドでも投票終了を告知し、結果を含めます。

5. **投票失敗**  
     
    * 投票が失敗した場合、[Advocate](roles.md/#advocate) は以下のいずれかを選択できます:  
        1. 提案の作業を継続する  
        2. 提案を放棄する  
    * [Advocate](roles.md/#advocate) はその決定を Pull Request のコメント欄および [GTFS Changes メーリングリスト](https://groups.google.com/g/gtfs-changes) のディスカッションスレッドで告知しなければなりません。

**<ins>要件</ins>** 

投票は以下の条件を満たさなければなりません:

| 要件 | 詳細 |
| :---- | :---- |
| **承認ルール** | 投票はすべての contributor が +1 を投票した場合にのみ可決されます（全会一致のコンセンサス）。|
| **投票フォーマット** | 投票は以下の形式で行わなければなりません: <br>- *“+1 または \-1, 組織名, Contributor の種類 (Consumer, Producer, または General Contributor), 提供しているフィードまたは利用しているアプリケーションへのリンク”* |
| **反対票** | 反対票 (-1) を投じる contributor は実行可能なフィードバックを提供しなければなりません。<br>- 実行可能なフィードバックとは、実際的かつ建設的であり、特定された問題を解決するための具体的な観察や提案を含むものです:  <br> - “*この提案は GTFS の後方互換性の原則を尊重していないため、別のファイルを作成することを提案します。*” |
| **最小投票数** | 少なくとも 5 票が投じられなければなりません。 |
| **参加者構成** | 少なくとも 2 名の GTFS consumer **および** 2 名の GTFS producer が投票に参加しなければなりません。<br>- これらの contributor は、両方の役割を担える場合でも、Consumer **または** Producer のいずれかとしてのみカウントされます。<br>- 提案をテストする意向のある First Adopters は投票でき、この要件にカウントされますが、提案の Advocate として行動している場合は除きます。 |
| **Advocate の投票** | Advocate は自分の提案に投票してはいけません。 |
| **無効な投票** | 以下の場合、投票は無効と見なされます:  <br>- contributor が公式の投票期間外（前または後）に投票した場合 <br>- 個人または組織が複数回投票した場合（1 人または 1 組織につき 1 票のみ許可されます） <br>- contributor が反対票を投じたにもかかわらず、実行可能なフィードバックを含めなかった場合 |
| **最小投票期間**  | 投票期間は少なくとも **14 日間（暦日）** 続き、**23:59:59 UTC** に終了しなければなりません。 |

### ステップ 2.5: テスト {: #step-25-testing}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-step-2.5.svg">

> 注: Track B: 非機能的変更および Track C: ドキュメント保守には該当しません

1つの GTFS [Producer](roles.md/#producers) と 1つの GTFS [Consumer](roles.md/#consumers) が [First Adopters](roles.md/#first-adopter) としてボランティア参加し、提案された変更を実装してテストを行います。

**<ins>アクション</ins>** 

1. **テスターの確認**  
     
    * [Advocate](roles.md/#advocate) は、変更をテストし、Pull Request のコメント欄で意見を提供する [First Adopters](roles.md/#first-adopter) の身元を確認します。
    
2. **テスト**

    * [First Adopters](roles.md/#first-adopter) は、変更を公開環境で適用しテストします。Producer の場合は公開 GTFS フィード、Consumer の場合は公開されている本番環境のアプリケーションを意味します。
    * テストは、採択のための投票を行う前にすべての要件が満たされるまで必要な期間続けられます。

3. **テストの証明**

    * [First Adopters](roles.md/#first-adopter) は、Pull Request のコメントで実装された変更へのリンクを共有することで、テストを行った証拠を示します。

**<ins>要件</ins>** 

[Advocate](roles.md/#advocate) は、テスト期間のすべての要件が完了した後にのみ、採択のための投票 ([ステップ 2.6](#step-26-vote-to-adopt)) に進むことができます。

| 要件 | 詳細 |
| :---- | :---- |
| **最小テスト期間**  | テスト期間は **少なくとも 7 日間の暦日** 続けなければなりません。 |
| **テスターの参加** | 少なくとも 2 名のコントリビューターが参加し、そのうち 1 名は Consumer、1 名は Producer でなければなりません。 |
| **テスト中の問題特定** | 変更をテストする First Adopters は、Pull Request にコメントすることで特定した問題を報告しなければなりません。理想的には解決策を提案し、Advocate が提案に必要な調整を行えるようにします。<br>- 変更が提案の範囲に大きな影響を与える場合、任意のコントリビューターがそれを指摘でき、Advocate は提案を議論ステップ ([ステップ 2.2](#step-22-pull-request-discussion)) に戻すか、撤回を検討することになります。 |
| **テストの証明** | First Adopters は、公開環境で変更を適用・テストし、共有しなければなりません。<br>- Producer の場合は公開 GTFS フィードへのリンク <br>- Consumer の場合は GTFS を利用するアプリケーションへの公開リンク |

### ステップ 2.6: 採択のための投票 {: #step-26-vote-to-adopt}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-step-2.6.svg">

> 注: Track C: Documentation Maintenance には該当しません

コミュニティは、提案された変更を公式に仕様に採択するかどうかを確認するために投票を行います。

**<ins>アクション</ins>** 

1. **投票の告知**  
     
    * [Advocate](roles.md/#advocate) は Pull Request のコメント欄で投票開始を告知し、投票終了時刻を明記します。  
    * [Advocate](roles.md/#advocate) は [GTFS Changes メーリングリスト](https://groups.google.com/g/gtfs-changes) のディスカッションスレッドでも投票を告知し、Pull Request コメントへのリンクと投票終了時刻を提示します。  
    
2. **投票プロセス**  
     
    * [Contributors](roles.md/#contributors) は Pull Request のコメント欄で投票しなければなりません。  
    
3. **編集とキャンセル**  
     
    * [Advocate](roles.md/#advocate) は投票期間中、編集上の目的に限り提案を編集することができます。  
    * [Advocate](roles.md/#advocate) はいつでも投票をキャンセルすることができます。  
    
4. **投票終了の告知**  
     
    * [Advocate](roles.md/#advocate) は Pull Request のコメント欄で投票終了を告知し、結果を含めます。  
    * [Advocate](roles.md/#advocate) は [GTFS Changes メーリングリスト](https://groups.google.com/g/gtfs-changes) のディスカッションスレッドでも投票終了を告知し、結果を含めます。  

5. **投票の不成立**  
     
    * 投票が不成立となった場合、[Advocate](roles.md/#advocate) は以下のいずれかを選択することができます:  
        1. 提供された実行可能なフィードバックに基づいて提案を調整し、再度投票を行う  
        2. 議論のステップ（[ステップ 2.2](#step-22-pull-request-discussion)）に戻り、スコープを再定義する  
        3. 提案を放棄する  
    * [Advocate](roles.md/#advocate) は自身の決定を Pull Request のコメント欄および [GTFS Changes メーリングリスト](https://groups.google.com/g/gtfs-changes) のディスカッションスレッドで告知しなければなりません。  

**<ins>要件</ins>** 

投票は以下の条件を満たさなければなりません:

| 要件 | 詳細 |
| :---- | :---- |
| **承認ルール** | 投票者の 80%以上が +1 を投じた場合、投票は可決されます（特別多数決）。 |
| **投票フォーマット** | 投票は以下の形式で行わなければなりません: <br>- *“+1 または \-1, 組織名, コントリビューターの種類 (Consumer, Producer, または General Contributor), 提供しているフィードまたは利用しているアプリケーションへのリンク”* |
| **反対票** | 反対票 (-1) を投じるコントリビューターは、実行可能なフィードバックを提供しなければなりません。<br>- 実行可能なフィードバックとは、実際的かつ建設的であり、特定された問題を解決するための具体的な観察や提案を含むものです:  <br> - “*この提案は GTFS の後方互換性の原則を尊重していないため、別のファイルを作成することを提案します。*” |
| **最低投票数** | 少なくとも 5 票が投じられなければなりません。 |
| **参加者構成** | 少なくとも 2 名の GTFS consumer **および** 2 名の GTFS producer が投票に参加しなければなりません。<br>- これらのコントリビューターは、両方の役割を担える場合でも、Consumer **または** Producer のいずれかとしてのみカウントされます。<br>- 提案をテストした First Adopters は投票でき、この要件にカウントされますが、提案の Advocate である場合は除きます。 |
| **Advocate の投票** | Advocate は自身の提案に投票してはいけません。 |
| **無効票** | 以下の場合、投票は無効とみなされます:  <br>- コントリビューターが公式の投票期間外（前または後）に投票した場合 <br>- コントリビューターが複数回投票した場合（1 コントリビューターにつき 1 票のみ許可されます） <br>- コントリビューターが反対票を投じたが、実行可能なフィードバックを含めなかった場合 |
| **最低投票期間**  | 投票期間は少なくとも **14 日間の暦日** 続かなければならず、**23:59:59 UTC** に終了しなければなりません。 |

### ステップ 2.7: 採択 {: #step-27-adoption}


<img class="center" width="1000" height="100%" src="../../../../../assets/governance-process-step-2.7.svg">
  
> 注: すべてのトラックに適用されます。

[Maintainer](roles.md/#maintainer) は、投票が成功した後に正式に採択された変更を実装します。

**<ins>アクション</ins>** 

1. **実装**

    * 投票が可決された場合、[Maintainer](roles.md/#maintainer) は [Contributors](roles.md/#contributors) が Contributor License Agreement に署名していることを条件に、14暦日以内に投票された Pull Request をマージします。

2. **改訂履歴の更新**

    * [Maintainer](roles.md/#maintainer) は、投票が成功した後に採択されたすべての変更を、月に1回、改訂履歴に記録します。

**<ins>要件</ins>** 

| 要件 | 詳細 |
| :---- | :---- |
| **実装** | Maintainer は、正式に採択されたすべての変更を14暦日以内にマージするべきです |
| **改訂履歴** | Maintainer は、仕様の改訂履歴を毎月更新し、最近採択されたすべての変更を簡単な説明と各変更に関連する議論へのリンクとともに記録するべきです。ドキュメント保守の変更はこの要件から除外されますが、有用と判断される場合は改訂履歴に追加することができます。 |
