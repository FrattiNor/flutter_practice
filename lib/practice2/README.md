## State 的生命周期

---

- initState

Widget 首次插入到 Widget 树中时被调用，对于每个 State 对象，Flutter 只会调用一次该回调

- didChangeDependencies

当 State 对象的依赖发生改变时被调用（例如当系统语言 Local 或应用主题发生改变时，Flutter 会通知组件调用此生命周期）

注意：当组件挂载时也会被调用

- build

用于构建 Widget 子树，会在以下场景被调用

调用 initState 之后

调用 didUpdateWidget 之后

调用 setState 之后

调用 didChangeDependencies 之后

在 State 对象从树中的一个位置移除后又重新插入到树的其他位置之后

- reassemble

此回调专门为了开发调试而提供的

在热重载时被调用。此回调在 Release 模式下永远不会被调用

- didUpdateWidget

在 Widget 是重新构建时，Flutter 会调用 canUpdate 来检查 Widget 树中同一位置的新旧节点，然后决定是否需要更新

如果 canUpdate 返回 true，则调用此回调

- deactivate

当 State 对象从树中移除时，会调用此回调，在一些场景下，Flutter 框架会将 State 对象重新插到树中

- dispose

当 State 对象从树中被永久移除时调用

通常用于释放资源

## 生命周期调用

---

Widget 挂载

- initState

- didChangeDependencies

- build

点击热重载

- reassemble

- didUpdateWidget

- build

取消挂载热重载

- reassemble

- deactive

- dispose

## 生命周期流程图

---

```
StatefulWidget launched

          |
          |
         \|/

      initState

          |
          |
         \|/

 didChangeDependencies

          |
          |
          |---------------------- didUpdateWidget <-----|
          |                                             |
          |                             /|\             |
          |                              |              |
          |                              |              |
          |                                             |
          |                          reassemble         |
          |                                             |
          |                             /|\             |
          |                              |              |
          |                             yes             |
          |                              |              |
                                                        |
        build --------------------> hot reload? ---NO---|

          |
          |
         \|/

       deactive

          |
          |
         \|/

       dispose

          |
          |
         \|/

StatefulWidget destroy
```

在继承 StatefulWidget 重写其方法时，对于包含 @mustCallSuper 标注的父类方法，都要在子类方法中调用父类方法
