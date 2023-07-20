import 'package:flutter/material.dart';
import 'package:math_app/card.dart';
import 'package:num_to_words/num_to_words.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MyApp());
}

Future<int> delayedNumber() async {
  return 2;
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
            builder: (context) => MySettingsPage(title: 'Settings')),
      );
    });
  }

  void _controlsPage() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyControlsPage(title: 'Controls')),
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
  var num1 = 1;
  var num2 = 1;
  var mainNum = 2;

  var n1Text = false;
  var n2Text = false;
  var n3Text = false;

  Color bgCol = Color.fromARGB(255, 211, 47, 47);

  Widget build(BuildContext context) {
    bool checkWin() {
      if ((op == "+") && (mainNum == num1 + num2)) {
        return true;
      }

      if ((op == "-") && (mainNum == num1 - num2)) {
        return true;
      }
      return false;
    }

    void reset() {
      int rng = Random().nextInt(2);

      if (rng == 0) {
        num1 = Random().nextInt(9) + 1;
        num2 = Random().nextInt(num1) + 1;
        mainNum = num1 - num2;
      } else {
        num1 = Random().nextInt(10);
        num2 = Random().nextInt(10);
        mainNum = num1 + num2;
      }

      op = " ";
    }

    var num1String = num1.toString();
    var num2String = num2.toString();
    var mainNumString = mainNum.toString();

    void callBack() {
      print(op);
      setState(() {
        if (checkWin() == true) {
          setState(() {
            bgCol = Color.fromARGB(255, 27, 171, 27);
          });

          Future.delayed(const Duration(milliseconds: 500), () {
            // Here you can write your code
            setState(() {
              bgCol = Color.fromARGB(255, 211, 47, 47);
              reset();
              // Here you can write your code for open new view
            });
          });
        }
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Game'),
        ),
        backgroundColor: bgCol,
        body: Center(
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 3),
                MainNumCard(
                  inText: mainNum.toWords(),
                ),
                Spacer(flex: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    NumCard(
                        inText: num1.toWords(),
                        tapDown: () {
                          if (n1Text) {}
                        }),
                    Spacer(),
                    OpCard(inText: op),
                    Spacer(),
                    NumCard(
                        inText: num2String,
                        tapDown: () {
                          if (n2Text) {
                            num2String = int.parse(num2String).toWords();
                            n2Text = false;
                            print("here True");
                            print(n2Text);
                            //print(num2String);
                          } else {
                            num2String = num2.toString();
                            n2Text = true;
                            print("here false");
                            print(n2Text);
                            //print(num2String);
                          }
                        }),
                    Spacer()
                  ],
                ),
                Spacer(flex: 4),
                Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          OpButton(
                              inText: "-",
                              tapDown: () {
                                callBack();
                              }),
                          SizedBox(height: 20, width: 20),
                          OpButton(
                              inText: "+",
                              tapDown: () {
                                callBack();
                              }),
                        ],
                      ),
                      SizedBox(height: 20, width: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OpButton(
                              inText: "x",
                              tapDown: () {
                                callBack();
                              }),
                          SizedBox(height: 20, width: 20),
                          OpButton(
                              inText: "/",
                              tapDown: () {
                                callBack();
                              }),
                        ],
                      )
                    ]),
                Spacer(flex: 3),
              ]),
        ));
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
