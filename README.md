DMM WEBCAMPコンテンツ【システム設計】 DMM WEBCAMPの学習コンテンツ[システム設計]の研修課題です。

<h1>ながのCAKE</h1>

<h3>◆概要</h3>
  長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。

<h3>◆案件の背景</h3>
  元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。
  InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

<h3>◆通販について</h3>
・通販では注文に応じて製作する受注生産型としている。
・現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない。
・送料は1配送につき全国一律800円。
・本来は軽減税率により宅配物は税率8%ですが、今回は10%で統一します。
・友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。
・支払方法はクレジットカード、銀行振込から選択できる。

<h3>◆実装機能</h3>

<h5>[会員側実装機能]</h5>
★顧客は会員登録、ログイン・ログアウト、退会ができる
★会員のログインはメールアドレスとパスワードで行う
☆会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示する
★サイトの閲覧はログインなしで行える
★商品をカートに入れ、1度に複数種類、複数商品の購入ができる。また、カート内の商品は個数変更・削除ができる
★カートへの商品追加はログインなしでは行えない
★クレジットカード情報はシステム上保持しない
☆会員は配送先を複数登録しておくことが可能である

<h6>会員はマイページから下記が行える</h6>
★ユーザ情報の閲覧・編集
★注文履歴の閲覧
☆配送先の閲覧・編集

<h6>注文履歴一覧には下記の情報が表示されること</h6>
★注文日
★配送先
★支払金額（商品合計＋送料）
☆注文ステータス

<h6>注文履歴詳細には下記の情報が表示されること</h6>
★注文日
★配送先
★支払方法
☆注文ステータス
★商品の注文内容詳細（商品名、単価、個数、小計）
★請求情報（商品合計、送料、支払金額）

<h6>会員登録時、下記の情報をユーザ情報として入力できる</h6>
・名前（姓・名）
・名前（カナ姓・カナ名）
・郵便番号
・住所
・電話番号
・メールアドレス
・パスワード

<h6>その他</h6>
☆商品は税込価格で表示される

<h5>[管理者側(店側)実装機能]</h5>
★管理者用メールアドレスとパスワードでログインできる
（管理者用メールアドレスとパスワードは事前に「/nagano_cake/db/seeds.rb」に登録している）

<h6>商品について、下記が行える</h6>
★新規追加、編集、閲覧
☆販売停止

<h6>商品情報は下記のものを持つ</h6>
★商品名
★商品説明文
☆ジャンル
★税抜価格
★商品画像
☆販売ステータス
★会員登録されているユーザ情報の閲覧、編集、退会処理が行える

<h6>ユーザの注文履歴が一覧・詳細表示でき、下記の情報が表示される</h6>
【注文履歴一覧】
★購入日時
★購入者
★注文個数
☆注文ステータス

【注文履歴詳細】
★購入者
★注文日
★配送先
★支払方法
★料金（商品合計、送料、請求金額合計）
☆注文ステータス
☆各注文商品詳細（商品名、単価(税込)、数量、小計）
☆各注文商品の製作ステータス
☆注文ごとに注文ステータスの更新、注文商品ごとに製作ステータスの更新ができる

<h3>◆用語の定義</h3>
    <table border="1" class="mx-auto">
        <thead>
        <tr>
            <th width="200">用語</th>
            <th width="500">意味</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>顧客</td>
            <td>ながのCAKEの商品を購入する人（客）</td>
        </tr>
        <tr>
            <td>会員</td>
            <td>ECサイトにユーザ登録している顧客</td>
        </tr>
        <tr>
            <td>ECサイト</td>
            <td>顧客が利用するサイト</td>
        </tr>
        <tr>
            <td>管理サイト</td>
            <td>店で働く事務員・パティシエ等が利用するサイト（管理者用サイト）</td>
        </tr>
        <tr>
            <td>注文ステータス</td>
            <td>注文の状態遷移を表す（後述）。</td>
        </tr>
        <tr>
            <td>製作ステータス</td>
            <td>注文に紐付く注文商品の状態遷移を表す（後述）。</td>
        </tr>
        <tr>
            <td>販売ステータス</td>
            <td>商品の販売状況を表す。現状、<b>販売中</b>、<b>売切れ</b>の2パターンがある。<br>
                販売停止商品は「売切れ」をセットする。</td>
        </tr>
        <tr>
            <td>会員ステータス</td>
            <td>現状、<b>有効</b>・<b>退会</b>の2パターンがある。</td>
        </tr>
        <tr>
            <td>ジャンル</td>
            <td>商品の種類。<br>
                現状、<b>ケーキ</b>、<b>プリン</b>、<b>焼き菓子</b>、<b>キャンディ</b>の4ジャンルある。</td>
        </tr>
        <tr>
            <td>注文個数</td>
            <td>1回の注文に紐付く注文個数の合計。<br>
                例）商品Aを3個、商品Bを2個注文→注文個数は5。</td>
        </tr>
        <tr>
            <td>商品小計</td>
            <td>商品単価（税込）×個数<br>
                例）1,200円（税込）の商品を2個購入＝商品小計は2,400円</td>
        </tr>
        </tbody>
    </table>

