ブックマークレット - お髭処ソフト
=================================

「ブックマークレット」とはブックマーク (お気に入り) を利用してウェブブラウザに
ちょっとした機能を追加するものです。

ここでは私ひげダイスが作成した、ちょっとしたオリジナルブックマークレットを
公開・配布しています。

ブックマークレットの登録・利用方法は、[はてなブックマークレットページの
ブックマークレットの登録・利用方法](http://www.hatena.ne.jp/tool/bookmarklet#howto)
の説明が丁寧で詳しいので、そちらをご参照ください。

iPhone では少し特殊です。[iPhone・iPadのSafariが驚くほど便利になる！私が愛用しているブックマークレットまとめ | Mac・iPhone・iPad - ITポケット](http://it-pocket.com/iphone-ipad-safari-bookmarklet) の方法をご参照ください。



ブロガー・Twitter ユーザー向けブックマークレット
------------------------------------------------

### 現在のページへのリンク作成 ###

ウェブブラウザで現在表示中のウェブページのリンクを効率的にコピーするための
ブックマークレットです。

プロンプト版は、「OK」を押すまで異なるスタイルで「タイトル」と URL・URI を
表示します。
一覧版は、同じものを新規ウィンドウ（タブ）に一覧表示します。
目的のスタイルが表示されたら「コピー」して、ブログ原稿などに貼りつけると
少ない労力でコンテンツを作成できます。

通常 Safari では URL エンコードされた URL をアドレス欄よりコピーしようとすると
デコード後のものがコピーされてしまいます。（例えば Wikipedia の日本語の項目）
これを使用すると、もとの（いわゆる）半角文字だけの URL がコピーできます。


#### プロンプト版 ####
☆ <a href="javascript:(function(f,b){var%20e=&quot;%20&quot;,a=window.prompt,d=function(g,h,i){return%20a(g,'<a%20href=&quot;'+h+'&quot;'+(i?e+'target=&quot;'+i+'&quot;':&quot;&quot;)+&quot;>&quot;+f+&quot;</a>&quot;)},c;c=a(&quot;Text&quot;,f+e+b);if(!c){c=d(&quot;HTML&quot;,b)}if(!c){c=d(&quot;HTML%20_blank&quot;,b,&quot;_blank&quot;)}if(!c){c=d(&quot;HTML%20_top&quot;,b,&quot;_top&quot;)}})(window.document.title,window.document.URL);">Link to Here</a>

iPhone 用ソースコード
```javascript
javascript:(function(f,b){var%20e="%20",a=window.prompt,d=function(g,h,i){return%20a(g,'<a%20href="'+h+'"'+(i?e+'target="'+i+'"':"")+">"+f+"</a>")},c;c=a("Text",f+e+b);if(!c){c=d("HTML",b)}if(!c){c=d("HTML%20_blank",b,"_blank")}if(!c){c=d("HTML%20_top",b,"_top")}})(window.document.title,window.document.URL);
```


#### 一覧版 ####
☆ <a href="javascript:(function(f,d){var%20c=&quot;&amp;lt;&quot;,e=&quot;&amp;gt;&quot;,a=window.open().document,b=function(g,h){var%20i=&quot;<li>&quot;+c+'a%20href=&quot;'+g+'&quot;'+(h?'%20target=&quot;'+h+'&quot;':&quot;&quot;)+e+f+c+&quot;/a&quot;+e+&quot;</li>&quot;;return%20i};a.writeln(&quot;<html><head><title>Links</title></head><body>&quot;);a.writeln(&quot;<ul>&quot;);a.writeln(&quot;<li>&quot;+f+&quot;%20&quot;+d+&quot;</li>&quot;);a.writeln(b(d));a.writeln(b(d,&quot;_blank&quot;));a.writeln(b(d,&quot;_top&quot;));a.writeln(&quot;</ul>&quot;);a.writeln(&quot;</body></html>&quot;)})(window.document.title,window.document.URL);">Links to Here</a>

iPhone 用ソースコード
```javascript
javascript:(function(f,d){var%20c="&amp;lt;",e="&amp;gt;",a=window.open().document,b=function(g,h){var%20i="<li>"+c+'a%20href="'+g+'"'+(h?'%20target="'+h+'"':"")+e+f+c+"/a"+e+"</li>";return%20i};a.writeln("<html><head><title>Links</title></head><body>");a.writeln("<ul>");a.writeln("<li>"+f+"%20"+d+"</li>");a.writeln(b(d));a.writeln(b(d,"_blank"));a.writeln(b(d,"_top"));a.writeln("</ul>");a.writeln("</body></html>")})(window.document.title,window.document.URL);
```



ライセンス
----------

[README.md](README.md) ファイルをご参照ください。


- - - - - - - - - - - - - - - - -
by Higedice (ひげダイス)  2012 
<http://d.hatena.ne.jp/higedice/>
<http://twitter.com/higedice>

