# hooks
Gitの特定イベント(e.g. コミット)の前後で行う処理を自動化するためのスクリプト。  
ローカルで行われるものとリモートで行われるものがある。  

## 主なhooks
### ローカルで実行される
- pre-commit
- commit-msg
- pre-push

### リモートで実行される
- pre-receive
- update
- post-receive

## 使用方法
- `.git/hooks/`にある`*.sample`に実行したい処理を書く
- `.sample`拡張子を消す
- 実行権限を付与する(`chmod +x {script name}`)
