import "package:flutter/material.dart" as material;

void main(List<String> args) {
  material.runApp(const App());
}

class App extends material.StatelessWidget {
  const App({material.Key? key}) : super(key: key);

  @override
  material.Widget build(material.BuildContext context) {
    return material.MaterialApp(
        title: "practice", theme: material.ThemeData(), home: const Home());
  }
}

class Home extends material.StatefulWidget {
  const Home({material.Key? key}) : super(key: key);

  @override
  material.State<Home> createState() => _HomeState();
}

class _HomeState extends material.State<Home> {
  @override
  material.Widget build(material.BuildContext context) {
    return const material.Text("PRACTICE");
  }
}
