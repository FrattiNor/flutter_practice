// ignore_for_file: avoid_print
import 'package:flutter/material.dart' as material;

class App extends material.StatelessWidget {
  const App({material.Key? key}) : super(key: key);

  @override
  material.Widget build(material.BuildContext context) {
    return const material.MaterialApp(home: Demo());
  }
}

class Demo extends material.StatefulWidget {
  const Demo({material.Key? key}) : super(key: key);

  @override
  material.State<Demo> createState() => _DemoState();
}

class _DemoState extends material.State<Demo> {
  // initState
  // Widget首次插入到Widget树中时被调用，对于每个State对象，Flutter只会调用一次该回调
  @override
  void initState() {
    super.initState();
    print("initState");
  }

  // didChangeDependencies
  // 当State对象的依赖发生改变时被调用（例如当系统语言Local或应用主题发生改变时，Flutter会通知组件调用此生命周期）
  // 注意：当组件挂载时也会被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  // build
  // 用于构建Widget子树，会在以下场景被调用
  // 调用initState之后
  // 调用didUpdateWidget之后
  // 调用setState之后
  // 调用didChangeDependencies之后
  // 在State对象从树中的一个位置移除后又重新插入到树的其他位置之后
  @override
  material.Widget build(material.BuildContext context) {
    return const material.Text("demo");
  }

  // reassemble
  // 此回调专门为了开发调试而提供的
  // 在热重载时被调用。此回调在Release模式下永远不会被调用
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  // didUpdateWidget
  // 在Widget是重新构建时，Flutter会调用canUpdate来检查Widget树中同一位置的新旧节点，然后决定是否需要更新
  // 如果canUpdate返回true，则调用此回调
  @override
  void didUpdateWidget(covariant Demo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  // deactivate
  // 当State对象从树中移除时，会调用此回调，在一些场景下，Flutter框架会将State对象重新插到树中
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  // dispose
  // 当State对象从树中被永久移除时调用
  // 通常用于释放资源
  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }
}
