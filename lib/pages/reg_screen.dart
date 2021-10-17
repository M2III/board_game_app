import 'package:board_game_app/pages/auth_screen.dart';
import 'package:board_game_app/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_validator/the_validator.dart';


class RegScreen extends StatelessWidget {
  RegScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // GlobalKey<FormState> _key=GlobalKey();


    const Color color = Color.fromRGBO(255, 255, 255, 1.0);

    final ButtonStyle styleRegister = ElevatedButton.styleFrom(primary: Colors.red, textStyle: const TextStyle(fontSize: 20,color:  color),shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.7),
    ) );
    final ButtonStyle styleLogin = ElevatedButton.styleFrom(primary: Colors.blueAccent, textStyle: const TextStyle(fontSize: 20,color:  color),shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.7),
    ) );

    bool _obscureText = true;


    return Scaffold(
      backgroundColor: Colors.grey,
      body:Center(
        child: Form(
          key: _formKey,
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
                              "Welcome !", style: TextStyle(
                              fontSize: 17.0
                          )),
                          const SizedBox(height: 40),
                          SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child:
                              TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 20), // add padding to adjust text
                                    isDense: true,
                                    hintText: "Email",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                                      child: Icon(Icons.email),
                                    ),
                                  ),
                                  validator: FieldValidator.email(),

                              )
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child:
                              TextFormField(
                                  controller: _passwordController,
                                  autofocus: false,
                                  obscureText: _obscureText,
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 20), // add padding to adjust text
                                      isDense: true,
                                      hintText: "Password",
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                                        child: Icon( IconData(0xe3ae, fontFamily: 'MaterialIcons')),
                                      ),
                                    ),
                                    validator: FieldValidator.password(
                                        minLength: 8,
                                        shouldContainNumber: true,
                                        shouldContainCapitalLetter: true,
                                        shouldContainSmallLetter: true,
                                        shouldContainSpecialChars: true,
                                        errorMessage: "Password must match the required format",
                                        onNumberNotPresent: () { return "Password must contain number"; },
                                        onSpecialCharsNotPresent: () { return "Password must contain special characters"; },
                                        onCapitalLetterNotPresent: () { return "Password must contain capital letters"; }
                                    ),
                              )
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child:
                              // To validate confirm password field
                              TextFormField(
                                controller: _confirmPasswordController,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 20), // add padding to adjust text
                                  isDense: true,
                                  hintText: "Confirm Password",
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                                    child: Icon( IconData(0xe3ae, fontFamily: 'MaterialIcons')),
                                  ),
                                ),
                                validator: FieldValidator.equalTo(_passwordController, message: "Password Mismatch"),
                                autofocus: false,
                                obscureText: _obscureText,
                              )
                          ),
                          const SizedBox(height: 20),
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
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                            email: _emailController.text, password: _passwordController.text);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context)=>const HomeScreen(),));
                                      }
                                    }
                                    ,style: styleRegister,
                                    child: const Text("Register")),
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
                                    Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context)=> const AuthScreen()),);
                                  },
                                  style: styleLogin,
                                ),
                              ),
                              ),
                            ],
                          ),
                        ]
                    )
                )]

          ),
        )
      )

    );
  }
}
