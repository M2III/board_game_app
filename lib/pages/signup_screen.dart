import 'package:board_game_app/assets/widgets/CustomButton.dart';
import 'package:board_game_app/assets/widgets/custCircleButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}


class _SignupState extends State<Signup> {
  String result = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  TextEditingController textController = TextEditingController();
  String hintText = "Your text";
  BorderSide borderSide = BorderSide(color: Colors.transparent,);
  BorderRadius borderRadius = BorderRadius.circular(10.0);
  BorderRadius focusedBorderRadius = BorderRadius.circular(25.7);
  TextStyle hintStyle = TextStyle(color: Colors.grey,);
  TextStyle labelStyle = TextStyle(color: Color.fromARGB(174, 182, 191, 1), fontSize: 15, fontStyle: FontStyle.normal);
  Color fillColor = Color.fromRGBO(29, 25, 29, 0.34901960784313724);

  Color  iconDoneColorTheme = Colors.white;
  Color  iconFacebookColorTheme = Colors.white;


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
        backgroundColor: Colors.grey,
        body: SizedBox(
          height: height,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  //padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
                  scrollDirection: Axis.vertical,

                  child: Column(
                      children: [

                        Text( "Login",  style: TextStyle(
                          fontSize: 25.0,
                        )),
                        //https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.nullpress.net%2F2019%2F12%2F03133102%2Famazing-login-signup-ui-in-flutter_5de6163e7dad9.jpeg&imgrefurl=https%3A%2F%2Fnullpress.net%2Ffree-download-amazing-login-signup-ui-in-flutter%2F&tbnid=olr6IMLHHeSGWM&vet=12ahUKEwi36-iY-4fzAhWH_4UKHbyvD2kQMygIegUIARC0AQ..i&docid=vZ_jPENP6mL2jM&w=590&h=300&q=login%20sign%20up%20flutter&ved=2ahUKEwi36-iY-4fzAhWH_4UKHbyvD2kQMygIegUIARC0AQ#imgrc=olr6IMLHHeSGWM&imgdii=TJwthrPtjHVfgM
                        const SizedBox(height: 15),
                        Text(
                            "Welcome back ! Login with your credentials", style: TextStyle(
                            fontSize: 13.0
                        )),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child:
                          TextField(
                            controller: textController,
                            decoration: InputDecoration(
                                hintText: hintText,
                                hintStyle: hintStyle,
                                labelStyle: labelStyle,
                                filled: true,
                                fillColor: fillColor,
                                prefixIcon: const Icon(Icons.email),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: borderSide,
                                  borderRadius: focusedBorderRadius,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: borderSide,
                                  borderRadius: borderRadius,
                                )
                            ),
                            //keyboardType: ,
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child:
                          TextField(
                            controller: textController,
                            decoration: InputDecoration(
                                hintText: hintText,
                                hintStyle: hintStyle,
                                labelStyle: labelStyle,
                                filled: true,
                                fillColor: fillColor,
                                prefixIcon: const Icon(Icons.lock),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: borderSide,
                                  borderRadius: focusedBorderRadius,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: borderSide,
                                  borderRadius: borderRadius,
                                )
                            ),
                            //keyboardType: ,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomButton(buttonColor: 'eszrez', radius: 20.0, label: 'Login',),
                          ],
                        ),

                        const SizedBox(height: 10),
                        Row(children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                          const Text("OR"),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: const Divider(
                                  color: Colors.black,
                                  height: 36,
                                )),
                          ),
                        ]),
                        Text(
                            "Sign in with ", style: TextStyle(
                            fontSize: 16.0
                        )),


                        //list of icon google, facebook
                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                              child:
                              custCircleButton(
                                  onPressed: () {
                                    setState(() {
                                      // result = codeController.text;
                                    });
                                  },
                                  icon: Icons.email,
                                  color: iconFacebookColorTheme,
                                  tag: "done-btn"),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                              child:
                              custCircleButton(
                                  onPressed: () {
                                    setState(() {
                                      // result = codeController.text;
                                    });
                                  },
                                  icon: Icons.email,
                                  color: iconFacebookColorTheme,
                                  tag: "done-btn"),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child:
                              custCircleButton(onPressed: () {
                                setState(() {
                                  // result = codeController.text;
                                });
                              },icon: Icons.email,
                                  color: iconFacebookColorTheme,
                                  tag: "done-btn"),
                            ),
                          ],
                        ),


                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                                "Don't have an account ?  ", style: TextStyle(
                                fontSize: 16.0
                            )),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {},
                              child: const Text('Signup'),
                            ),
                          ],
                        )

                      ]
                  )
              )
            ],

          ),
        )


    );
  }

}