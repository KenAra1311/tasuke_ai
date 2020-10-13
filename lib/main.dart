import 'package:flutter/material.dart';
import 'package:tasuke_ai/pages/auth/sign_up_page.dart';
import 'package:tasuke_ai/pages/splash/splash_page.dart';
import 'package:tasuke_ai/pages/welcome/welcome_page.dart';
import 'package:tasuke_ai/widgets/organisms/header.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SplashPage(),
        '/welcome': (BuildContext context) => WelcomePage(),
        '/sign-up': (BuildContext context) => SignUpPage(),
        '/home': (BuildContext context) => MyApp(),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: '助け愛',
        backgroundColor: Color(0xfff44436),
        iconThemeColor: Color(0xffffffff),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _counter++),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
