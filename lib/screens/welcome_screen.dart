import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen'; //добавили в перем-ю static

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  //добавляем Mixin
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this, //это значит, мы имеем ввиду этот _WelcomeScreenState
      upperBound: 100.0, //добавим счётчик от 0 до 100, вместо слов Flash Chat
    );
    controller.forward();
    controller.addListener(() {
      setState(() {
        //добавим состояние, чтоб фон менялся, т.к. мы перестраиваем Widget build(BuildContext context)
      });
      print(controller.value); //вывод в терминал Ticker, от 0 до 1.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            Colors.white, //вернём знач-е на white, т.к. мы поменяли
        //верхнюю границу счётчика до 100, а opacity не может быть больше 1.
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(children: <Widget>[
                    Hero(
                        //добавили Hero Animation.
                        tag: 'logo',
                        child: Container(
                          child: Image.asset('images/logo.png'),
                          height: controller.value, //теперь добавим анимацию увеличения лого
                        )),
                    Text('Flash chat', //вернём начал-е значение текста
                        style: TextStyle(
                            fontSize: 45.0, fontWeight: FontWeight.w900))
                  ]),
                  SizedBox(height: 48.0),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                          elevation: 5.0,
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, LoginScreen.id);
                              },
                              minWidth: 200.0,
                              height: 42.0,
                              child: Text('Log In')))),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30.0),
                          elevation: 5.0,
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RegistrationScreen.id);
                              },
                              minWidth: 200.0,
                              height: 42.0,
                              child: Text('Register'))))
                ])));
  }
}
