import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:abc_game/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 0), ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>MainScreen())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsBackground),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  //Image.asset(Assets.assetsLetterC,scale: 2,color: Colors.white,),
          RotationTransition(
            turns: AlwaysStoppedAnimation(143/360),
            child: SleekCircularSlider(
              appearance: CircularSliderAppearance(
                customWidths: CustomSliderWidths(
                  trackWidth: 30,
                  handlerSize: 10,

                ),
                customColors: CustomSliderColors(
                  trackColor: Colors.white,
                  shadowColor: Colors.black,
                  dotColor: Colors.orange,
                  hideShadow: false,
                  shadowMaxOpacity: 1,
                  progressBarColor: Colors.amber
                ),
                size: 121,
                counterClockwise: true
              ),
              min: 0,
              max: 5000,
              initialValue: 500,
              onChange: (double value) {
                print(value.toString());
                if(value.toString()=="5000"){
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    animType: AnimType.BOTTOMSLIDE,
                    title: "congratulation",
                    desc: "you win the game",
                    btnCancelText: "Ok",
                    dismissOnTouchOutside: false,
                    btnOkOnPress: () {},
                  )..show().then((value) {

                  });
                }
                // callback providing a value while its being changed (with a pan gesture)
              },
              onChangeStart: (double startValue) {
                // callback providing a starting value (when a pan gesture starts)
              },
              onChangeEnd: (double endValue) {
                // ucallback providing an ending value (when a pan gesture ends)
              },
              innerWidget: (double value) {
                // use your custom widget inside the slider (gets a slider value from the callback)
              },
            ),
          )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


