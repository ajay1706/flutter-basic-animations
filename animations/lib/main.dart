import 'package:animations/anim/chain_animation.dart';
import 'package:flutter/material.dart';
import './anim/counter_animation.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animations',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

AnimationController controller;
Animation<double> animation;


@override
void initState() {
  super.initState();
  controller = AnimationController(
      duration: Duration(milliseconds: 1800),

      vsync: this);
  animation = CurvedAnimation(parent: controller,
  curve: Curves.easeIn);
  animation.addStatusListener((status){
    if(status == AnimationStatus.completed){
      controller.reverse();

    }else if(status == AnimationStatus.dismissed){
      controller.forward();

    }
  });
  controller.forward();
}

@override
  Widget build(BuildContext context) {
//  return ChainAnimation(animation: animation,);
//    return Scaffold(
//      body: Center(child: new CounterAnimator())
//    )
//   ;}

return new Scaffold(
  body: ChainAnimation(animation: animation,),
);
}


}
