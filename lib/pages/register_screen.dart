import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:board_game_app/assets/widgets/customtextfield_widget.dart';
import 'package:flutter/painting.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  String result = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  TextEditingController textController = TextEditingController();
  String hintText = "Your text";
  BorderSide borderSide = const BorderSide(color: Colors.transparent,);
  BorderRadius borderRadius = BorderRadius.circular(10.0);
  BorderRadius focusedBorderRadius = BorderRadius.circular(25.7);
  TextStyle hintStyle = const TextStyle(color: Colors.grey,);
  TextStyle labelStyle = const TextStyle(color: Color.fromARGB(174, 182, 191, 1), fontSize: 15, fontStyle: FontStyle.normal);
  Color fillColor = const Color.fromRGBO(29, 25, 29, 0.34901960784313724);

  Color  iconDoneColorTheme = Colors.white;
  Color  iconFacebookColorTheme = Colors.white;

  static const Color color = Color.fromRGBO(255, 255, 255, 1.0);

  final ButtonStyle styleRegister = ElevatedButton.styleFrom(primary: Colors.red, textStyle: const TextStyle(fontSize: 20,color:  color),shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.7),
  ) );
  final ButtonStyle styleLogin = ElevatedButton.styleFrom(primary: Colors.blueAccent, textStyle: const TextStyle(fontSize: 20,color:  color),shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.7),
  ) );




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                //padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
                scrollDirection: Axis.vertical,
                child: Column(
                    children: [
                      const Text( "Register",  style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      )),
                      const SizedBox(height: 15),
                      const Text(
                          "Welcome back ! Login with your credentials", style: TextStyle(
                          fontSize: 17.0
                      )),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child:
                        CustTextField(textController: textController, hintText: hintText, hintStyle: hintStyle, labelStyle: labelStyle, fillColor: fillColor, borderSide: borderSide, focusedBorderRadius: focusedBorderRadius, borderRadius: borderRadius),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child:
                        CustTextField(textController: textController, hintText: hintText, hintStyle: hintStyle, labelStyle: labelStyle, fillColor: fillColor, borderSide: borderSide, focusedBorderRadius: focusedBorderRadius, borderRadius: borderRadius),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child:
                        CustTextField(textController: textController, hintText: hintText, hintStyle: hintStyle, labelStyle: labelStyle, fillColor: fillColor, borderSide: borderSide, focusedBorderRadius: focusedBorderRadius, borderRadius: borderRadius),
                      ),

                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: SizedBox(
                            height: 50, //height of button
                            width: MediaQuery
                                .of(context)
                                .size
                                .width, //width of button
                            child: ElevatedButton(
                              child: const Center(
                                child: Text('Register'),
                              ),
                              onPressed: () {
                                setState(() {
                                  // result = codeController.text;
                                });
                              },
                              style: styleRegister,
                            ),
                          ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: SizedBox(
                            height: 50, //height of button
                            width: MediaQuery
                                .of(context)
                                .size
                                .width, //width of button
                            child: ElevatedButton(
                              child: const Center(
                                child: Text('Login'),
                              ),
                              onPressed: () {
                                setState(() {
                                  // result = codeController.text;
                                });
                              },
                              style: styleLogin,
                            ),
                          ),
                          ),
                        ],
                      ),



                    ]
                ),
              ),
            ],

          ),
        )


    );
  }

}
