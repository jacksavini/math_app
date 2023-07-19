import 'package:flutter/material.dart';
import 'dart:math';

import 'package:math_app/card.dart';

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
            const Text(
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
  callBack() {
    setState(() {op = "L";});
  }

  OpCard oc = new OpCard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
      ),
      backgroundColor: Colors.red[700],
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex:3),
            MainNumCard(inText: "7",),
            Spacer(flex:2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                NumCard(inText: "3",),
                Spacer(),
                OpCard(),
                Spacer(),
                NumCard(inText: "4",),
                Spacer()
              ],
            ),
            Spacer(flex:4),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: <Widget>[
                    OpButton(
                      inText: "-",
                      tapDown: (){ callBack(); }
                    ),
                    SizedBox(
                      height:20,
                      width:20
                    ),
                    OpButton(
                      inText: "+",
                      tapDown: (){ callBack(); }
                    ),
                  ],
                ),
                SizedBox(
                  height:20,
                  width:20
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    OpButton(
                      inText: "x",
                      tapDown: (){ callBack(); }
                    ),
                    SizedBox(
                      height:20,
                      width:20
                    ),
                    OpButton(
                      inText: "/",
                      tapDown: (){ callBack(); }
                    ),
                  ],
                )
              ]
            ),
            Spacer(flex:3),
          ]
        ),
      
      )
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