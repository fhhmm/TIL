# classとobject
classは使用時にインスタンス化が必要。  
objectはインスタンス化不要(できない)。

```scala
class ExampleClass {
  def example() {
    ...
  }
}

object ExampleObject {
  def example() {
    ...
  }
}

object Main {
  val c = ExampleClass()
  c.exmaple()

  ExampleObject.exampla()
}
```

同じ定義から属性の異なる複数のインスタンスを作成したい場合はclassを使う。(e.g. DTO)  
属性等を持たない場合はobjectを使う。(e.g. ユーティリティ関数をまとめる)

## singleton classとobject
objectはScalaの言語レベルでサポートされているシングルトンクラス。  
手動でsingleton classを定義する場合とobjectを利用する場合で下記の違いがある。

### 初期化
objectの初期化プロセスはカスタマイズできない。  
そのため、環境変数や設定ファイルの値によって振る舞いを変えたい場合は、singleton classを手動で定義する。

### 継承
objectは他のobjectやtraitを継承できない。

### 初期化タイミング
TODO: 初期化タイミングの差異もあるらしいが、どちらもアクセスした時点でインスタンス化が行われるらしく、詳細な違いは分からない…
