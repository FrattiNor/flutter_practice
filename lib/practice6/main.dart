import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("title"),
        ),
        body: const Page(),
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key}) : super(key: key);

  @override
  State<Page> createState() => PageState();
}

class PageState extends State<Page> {
  void showJSON() async {
    // String
    var testJSON = await rootBundle.loadString('assets/test.json');
    print(testJSON);
    print(testJSON.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: showJSON,
        child: Image.asset('assets/favicon.ico'),
      ),
    );
  }
}
