import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare/math/mat2d.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements FlareController {
  String _animation = "idle";

  void doAnimate(String anim) {
    setState(() {
      _animation = anim;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          //flare actor
          Expanded(
            child: FlareActor(
              "images/minion.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: _animation,
              controller: this,
            ),
          ),
          //animations
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("Look"),
                onPressed: () {
                  doAnimate("Look");
                },
              ),
              RaisedButton(
                child: Text("Dance"),
                onPressed: () {
                  doAnimate("Dance");
                },
              ),
              RaisedButton(
                child: Text("Stand"),
                onPressed: () {
                  doAnimate("Stand");
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("Jump"),
                onPressed: () {
                  doAnimate("Jump");
                },
              ),
              RaisedButton(
                child: Text("Wave"),
                onPressed: () {
                  doAnimate("Wave");
                },
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    // TODO: implement advance
    return null;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {
    // TODO: implement initialize
  }

  @override
  void setViewTransform(Mat2D viewTransform) {
    // TODO: implement setViewTransform
  }
}
