# implicit parameter
## 文脈引き渡し
関数やメソッドを呼び出す際に自動で(明示的な指定なしで)渡されるパラメータ。
```scala
def hello(msg: String)(implicit prefix: String): Unit = {
  println(prefix + msg)
}

implicit val prefix: String = "Hello, "
hello("world!")  // -> "Hello, world!"
```

## 型クラス


# implicit conversion
