import "package:flutter/material.dart" as material;

class App extends material.StatefulWidget {
  const App({material.Key? key}) : super(key: key);

  @override
  material.State<App> createState() => _AppState();
}

class _AppState extends material.State<App> {
  int count = 0;

  void addCount() {
    setState(() {
      count++;
    });
  }

  @override
  material.Widget build(material.BuildContext context) {
    return material.MaterialApp(
      title: "practice",
      theme: material.ThemeData(
        primaryColor: material.Colors.blue,
      ),
      home: material.Scaffold(
        appBar: material.AppBar(
          title: const material.Text("简易计数器"),
        ),
        body: Home(count: count, add: addCount),
        floatingActionButton: material.FloatingActionButton(
          onPressed: addCount,
          tooltip: "增加count",
          child: const material.Icon(material.Icons.add),
        ),
      ),
    );
  }
}

class Home extends material.StatelessWidget {
  const Home({material.Key? key, this.count = 0, required this.add})
      : super(key: key);

  final int count;
  final void Function() add;

  @override
  material.Widget build(material.BuildContext context) {
    return material.Center(
      child: material.Column(
        mainAxisSize: material.MainAxisSize.min,
        children: [
          const material.Text(
            "点击下方+号按钮增加 count",
          ),
          material.Text(
            "count: $count",
            style: const material.TextStyle(
              fontSize: 30,
              fontWeight: material.FontWeight.bold,
            ),
          ),
          material.ElevatedButton(
            onPressed: add,
            child: const material.Text("add"),
          )
        ],
      ),
    );
  }
}
