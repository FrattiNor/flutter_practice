import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _globalKey,
        appBar: AppBar(title: const Text("获取父级State")),
        body: const ChildApp(),
        drawer: const Drawer(),
      ),
    );
  }
}

class ChildApp extends StatelessWidget {
  const ChildApp({Key? key}) : super(key: key);

  void open(BuildContext context) {
    // findAncestorStateOfType
    ScaffoldState state = context.findAncestorStateOfType<ScaffoldState>()!;
    state.openDrawer();

    // State.of
    ScaffoldMessengerState state2 = ScaffoldMessenger.of(context);
    state2.showSnackBar(const SnackBar(content: Text("SnackBar")));

    // GlobalKey
    _globalKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          open(context);
        },
        child: const Text("打开抽屉"),
      ),
    );
  }
}
