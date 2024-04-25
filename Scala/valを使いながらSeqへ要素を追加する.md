# valを使いながらSeqへ要素を追加する
こんな感じの関数を作りたかった
```scala
def validate(input: String): Either[Seq[String], String] = {
  val errors: Seq[String] = Seq.empty[String]

  if (!validation1()) errors +: "error文言1"
  if (!validation2()) errors +: "error文言2"

  if (errors.isEmpty) Right(input)
  else Left(errors)
}
```
errorsをvalで定義しているため、要素の追加ができない。  
varで定義すれば追加できるが、varは使いたくない。  
`errors1: Seq[String] = errors +: "error文言1"`こんな感じで新しいSeqを作り続けるのも避けたい。

最終的にこうした。
```scala
def validate(input: String): Either[Seq[String], String] = {
  val errors: Seq[String] = Seq(
    if (!validation1()) Some("error文言1") else None,
    if (!validation1()) Some("error文言1") else None
  ).flatten

  if (errors.isEmpty) Right(input)
  else Left(errors)
}
```
