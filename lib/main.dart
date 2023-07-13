import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Game Sloppy Copy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Math: The Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _gamePage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyGamePage(title: 'Game')),
      );
    });
  }

  void _settingsPage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MySettingsPage(title: 'Settings')
        ),
      );
    });
  }

  void _controlsPage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyControlsPage(title: 'Controls')
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Game Logo Here',
            ),
            ElevatedButton(
              onPressed: _gamePage,
              child: const Text('Continue'),
            ),
            ElevatedButton(
              onPressed: _gamePage,
              child: const Text('New Game'),
            ),
            ElevatedButton(
              onPressed: _controlsPage,
              child: const Text('How to Play'),
            ),
            ElevatedButton(
              onPressed: _settingsPage,
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyGamePage extends StatefulWidget {
  MyGamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyGamePageState createState() => _MyGamePageState();
}

class _MyGamePageState extends State<MyGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
      ),
    );
  }
}

class MyControlsPage extends StatefulWidget {
  MyControlsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyControlsPageState createState() => _MyControlsPageState();
}

class _MyControlsPageState extends State<MyControlsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Controls'),
      ),
    );
  }
}

class MySettingsPage extends StatefulWidget {
  MySettingsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MySettingsPageState createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
    );
  }
}