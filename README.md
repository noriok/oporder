Ruby での演算子の優先順位を確認する Ruby スクリプトです。

## 動作例

Ruby の式を入力すると、(演算子の優先順位に従って)括弧を付けて出力します。`>` はプロンプトです。

```ruby
> 1 + 2 * 3
(1 + (2 * 3))
> 10 % 3 == 0
((10 % 3) == 0)
> a = b || c
(a = (b || c))
> a = b or c
((a = b) or c)
```

## 環境

- OS X El Capitan
- ruby 2.2.3p173 (2015-08-18 revision 51636) [x86_64-darwin14]

## リンク

- [Ruby 2.2.0 リファレンスマニュアル > 演算子式](http://docs.ruby-lang.org/ja/2.2.0/doc/spec=2foperator.html)

