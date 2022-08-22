## 获取父 Widget 的 State

---

- 通过 Context 获取

方法 1：context.findAncestorStateOfType\<State\>

findAncestorStateOfType 能从下往上找最近的指定 State 对象

方法 2：State.of(context)

一般来说 StatefulWidget 的状态是私有的，那么我们不应该直接获取其 State 对象，如果 State 是希望暴露的，我们则可以直接获取其 State 对象，通过 findAncestorStateOfType 获取 State 方法是通用的，我们无法在语言层指定 State 是否私有，所以在 Flutter 中有一个默认的约定，如果 State 是希望暴露的，StatefulWidget 中提供一个 of 静态方法来获取其 State 对象

- 通过 GlobalKey 获取

GlobalKey 是 Flutter 提供的在整个 App 中引用 Element 的机制，如果一个 Widget 设置了 GlobalKey，那么我们可以通过 GlobalKey.currentWidget 获取该 Widget 对象，currentElement 和 currentState 同理。

注意：使用 GlobalKey 开销较大，尽可能不去使用，另外同一个 GlobalKey 在整个 Widget 树中必须唯一。
