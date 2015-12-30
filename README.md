Ruby での演算子の優先順位を確認する Ruby スクリプトです。

## 動作例

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
