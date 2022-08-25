import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        var routeName = settings.name;
        var count = settings.arguments as int;

        if (routeName == "page2") {
          return MaterialPageRoute(
            builder: (context) => Page(
              count: count,
            ),
          );
        }

        return MaterialPageRoute(
          builder: (context) => const Page404(),
        );
      },
      routes: {
        "page": (context) {
          return Page(
            count: ModalRoute.of(context)!.settings.arguments as int,
          );
        }
      },
      home: const Page(
        count: 0,
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key, required this.count}) : super(key: key);

  final int count;

  // 方法1
  void open(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Page(
            count: count + 1,
          );
        },
      ),
    );
  }

  // 方法2
  void open2(BuildContext context) {
    Navigator.of(context).pushNamed("page", arguments: count + 1);
  }

  // 方法3
  void open3(BuildContext context) {
    Navigator.of(context).pushNamed("page2", arguments: count + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title $count"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            open3(context);
          },
          child: const Text("open"),
        ),
      ),
    );
  }
}

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("404")),
    );
  }
}
