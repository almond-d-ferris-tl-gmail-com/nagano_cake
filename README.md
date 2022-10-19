<!--セル結合:colspan=""(列の長さ)、rowspan=""(行の長さ)-->
<!--# →見出し、- →リスト、1. →番号付きリスト、^ →縦結合、> →横結合-->
<!--Read.meの表を組むためにターミナルで「gem install github-markdown」を入力する-->
DMM WEBCAMPコンテンツ【システム設計】 DMM WEBCAMPの学習コンテンツ[システム設計]の研修課題。

# ながのCAKE

## ◆概要
  長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。<br>

## ◆案件の背景
  元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。<br>
  InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。<br>

## ◆通販について
- 通販では注文に応じて製作する受注生産型としている。
- 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない。
- 送料は1配送につき全国一律800円。
- 本来は軽減税率により宅配物は税率8%だが、今回は10%で統一する。
- 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。
- 支払方法はクレジットカード、銀行振込から選択できる。

## ◆用語の定義
|用語|意味|<!--head-->
----|-----
|顧客|ながのCAKEの商品を購入する人（客）|<!--body-->
|会員|ECサイトにユーザ登録している顧客|
|ECサイト|顧客が利用するサイト|
|管理サイト|店で働く事務員・パティシエ等が利用するサイト（管理者用サイト）|
|注文ステータス|注文の状態遷移を表す（後述）。|
|製作ステータス|注文に紐付く注文商品の状態遷移を表す（後述）。|
|販売ステータス|商品の販売状況を表す。現状、<b>販売中</b>、<b>売切れ</b>の2パターンがある。<br>販売停止商品は「売切れ」をセットする。|
|会員ステータス|現状、<b>有効</b>・<b>退会</b>の2パターンがある。|
|ジャンル|商品の種類。<br>現状、<b>ケーキ</b>、<b>プリン</b>、<b>焼き菓子</b>、<b>キャンディ</b>の4ジャンルある。|
|注文個数|1回の注文に紐付く注文個数の合計。<br>例）商品Aを3個、商品Bを2個注文→注文個数は5。|
|商品小計|商品単価（税込）×個数<br>例）1,200円（税込）の商品を2個購入＝商品小計は2,400円|

## ◆各種ステータス
|ステータス名|用途|ステータス|設定タイミング|<!--head-->
----|-----
|注文ステータス|注文状況を表す。<br>会員の購入履歴にも表示する。|入金待ち|注文した時点でデフォルトで設定される|<!--body-->
|^|^|入金確認|事務員が入金を確認したら更新する|
|^|^|製作中|紐付く注文商品の製作ステータスが一つでも「製作中」になったら自動更新|
|^|^|発送準備中|紐付く注文商品の製作ステータスが全部「製作完了」になったら自動更新|
|^|^|発送済み|事務員が発送完了時に設定する|

|製作ステータス|各商品の製作状況を表す。<br>内部でのみ使用する。|製作不可  |注文を受けた時点でデフォルトで設定される|
|^|^|製作待ち|紐付く注文ステータスが「入金確認」になったら自動更新|
|^|^|製作中|製作着手するタイミングでパティシエが設定する|
|^|^|製作完了|製作が完了したタイミングでパティシエが設定する|

## ◆会員側のフロー
1. 会員登録・ログインをする
1. 商品を検索・閲覧する
1. カートに入れる
1. 注文する
1. 配送される

## ◆店側のフロー
### 会員の注文確定後、商品の製作から発送までのフロー
1. 入金確認できた注文の注文ステータスを「入金確認」に変更する
1. 製作着手する商品の製作ステータスを「製作中」に変更する
1. 完成した商品の製作ステータスを「制作完了」に変更する
1. 注文ステータスが「発送準備中」の注文商品を梱包する
1. 発送したら注文ステータスを「発送済み」に更新する
※2〜3は注文に紐付く商品数分行う<br>

## ◆実装機能
★マークは実装必須の要件、☆マークは任意の実装要件。<br>

### [会員側実装機能]
★顧客は会員登録、ログイン・ログアウト、退会ができる<br>
★会員のログインはメールアドレスとパスワードで行う<br>
☆会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示する<br>
★サイトの閲覧はログインなしで行える<br>
★商品をカートに入れ、1度に複数種類、複数商品の購入ができる。また、カート内の商品は個数変更・削除ができる<br>
★カートへの商品追加はログインなしでは行えない<br>
★クレジットカード情報はシステム上保持しない<br>
☆会員は配送先を複数登録しておくことが可能である<br>

#### 会員はマイページから下記が行える
★ユーザ情報の閲覧・編集<br>
★注文履歴の閲覧<br>
☆配送先の閲覧・編集<br>

#### 注文履歴一覧には下記の情報が表示されること
★注文日<br>
★配送先<br>
★支払金額（商品合計＋送料）<br>
☆注文ステータス<br>

#### 注文履歴詳細には下記の情報が表示されること
★注文日<br>
★配送先<br>
★支払方法<br>
☆注文ステータス<br>
★商品の注文内容詳細（商品名、単価、個数、小計）<br>
★請求情報（商品合計、送料、支払金額）<br>

#### 会員登録時、下記の情報をユーザ情報として入力できる
・名前（姓・名）<br>
・名前（カナ姓・カナ名）<br>
・郵便番号<br>
・住所<br>
・電話番号<br>
・メールアドレス<br>
・パスワード<br>

#### その他
☆商品は税込価格で表示される<br>

### [管理者側(店側)実装機能]
★管理者用メールアドレスとパスワードでログインできる<br>
（管理者用メールアドレスとパスワードは事前に「/nagano_cake/db/seeds.rb」に登録している）<br>

#### 商品について、下記が行える
★新規追加、編集、閲覧<br>
☆販売停止<br>

#### 商品情報は下記のものを持つ
★商品名<br>
★商品説明文<br>
☆ジャンル<br>
★税抜価格<br>
★商品画像<br>
☆販売ステータス<br>
★会員登録されているユーザ情報の閲覧、編集、退会処理が行える<br>

#### ユーザの注文履歴が一覧・詳細表示でき、下記の情報が表示される
#### 【注文履歴一覧】
★購入日時<br>
★購入者<br>
★注文個数<br>
☆注文ステータス<br>

#### 【注文履歴詳細】
★購入者<br>
★注文日<br>
★配送先<br>
★支払方法<br>
★料金（商品合計、送料、請求金額合計）<br>
☆注文ステータス<br>
☆各注文商品詳細（商品名、単価(税込)、数量、小計）<br>
☆各注文商品の製作ステータス<br>
☆注文ごとに注文ステータスの更新、注文商品ごとに製作ステータスの更新ができる<br>

## ◆使用方法
### 顧客側
1. はじめに会員登録をお願い致します。登録なしに商品を閲覧することは可能ですが、注文する際は必須になります。
1. お好きな商品が見つかりましたらカートに入れていただき、注文情報入力へお進みください。
1. 支払い方法、配送先等を選択していただき、注文確定を押すと注文が完了いたします。

### 管理者側
1. まず管理者登録をお願いいたします。登録が完了しますと、管理者機能が使用可能になります。
1. 商品を登録していただきますと、顧客サイトで閲覧が可能になります。
1. 顧客から注文がありますと、注文一覧に表示され、詳細が確認できます。
   入金が確認できたら注文ステータスを変更し、製作が終了しましたら製作ステータスを変更してください。
   （それぞれ連動して変更が反映されます）
1. 顧客一覧から顧客詳細の確認・変更等が可能です。

## ◆開発環境
- cloud9

### 使用言語
- Ruby 3.1.2
- HTML
- CSS
- SCSS
- JavaScript

### フレームワーク、データベース、その他
- Ruby on Rails 6.1.7
- SQlite3 1.4
- puma 5.0
- sass-rails 6
- webpacker 5.0
- turbolinks 5
- jbuilder 2.7
- redis 4.0
- bcrypt 3.1.7
- image_processing 1.2
- bootsnap 1.4.4

### Gem
- devise
- net-smtp
- kaminari 1.2.1
- enum_help
- pry-byebug

## ◆作成者(アカウント名)
- M-H(almond-d-ferris-tl-gmail-com)