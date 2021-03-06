Ruby での演算子の優先順位を確認する Ruby スクリプトです。

コマンドラインから式を入力すると、演算子の優先順位に従って括弧を付けて式を出力します。

## 実行方法

次のように実行します。

```
$ ruby oporder.rb
```

## 動作例

`>` はプロンプトです。


```ruby
> 1 + 2 * 3
(1 + (2 * 3))
```

式の一部を括弧で囲んだ場合の例です。

```ruby
> (1 + 2) * 3
((1 + 2) * 3)
```

サンプル:

```ruby
> 10 % 3 == 0
((10 % 3) == 0)

> a = b || c
(a = (b || c))

> a = b or c
((a = b) or c)

> a ** b ** c
(a ** (b ** c))

> i & 1 << j > 0
((i & (1 << j)) > 0)

> 1 << n - 1
(1 << (n - 1))
```

## モチベーション

Ruby の演算子の優先順位は、 [Ruby 2.2.0 リファレンスマニュアル > 演算子式](http://docs.ruby-lang.org/ja/2.2.0/doc/spec=2foperator.html) に記載されていますが、コマンドラインから、さくっと確認したいので作りました。

## 制限

Ruby の全ての式には対応していません。

演算子の優先順位を確認することが目的のため、たとえば、関数呼び出しなどが入力に含まれると解釈できずエラーとなります。

## 環境

- OS X El Capitan
- ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]

## リンク

- [Ruby 2.2.0 リファレンスマニュアル > 演算子式](http://docs.ruby-lang.org/ja/2.2.0/doc/spec=2foperator.html)

