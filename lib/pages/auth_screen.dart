import 'package:board_game_app/pages/home_screen.dart';
import 'package:board_game_app/pages/reg_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_validator/the_validator.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    // GlobalKey<FormState> _key=GlobalKey();

    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
            child: Form(
          key: _formKey,
          child: Stack(children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              //padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const Text("Login",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 15),
                  const Text("Welcome back ! Login with your credentials",
                      style: TextStyle(fontSize: 17.0)),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: 20), // add padding to adjust text
                        isDense: true,
                        hintText: "Email",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              top: 15), // add padding to adjust icon
                          child: Icon(Icons.email),
                        ),
                      ),
                      validator: FieldValidator.email(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: <Widget>[
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                                top: 20), // add padding to adjust text
                            isDense: true,
                            hintText: "Password",
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                  top: 15), // add padding to adjust icon
                              child: Icon(IconData(0xe3ae,
                                  fontFamily: 'MaterialIcons')),
                            ),
                          ),
                          onSaved: (value) => _passwordController =
                              value as TextEditingController,
                          obscureText: _obscureText,
                        ),
                        IconButton(
                          padding: const EdgeInsets.only(top: 15),
                          icon: _obscureText
                              ? const Icon(Icons.visibility_off_sharp,
                                  size: 18.0)
                              : const Icon(
                                  Icons.visibility_sharp,
                                  size: 18.0,
                                ),
                          onPressed: () {
                            _toggle();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50, //height of button
                          width: MediaQuery.of(context)
                              .size
                              .width, //width of button
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text);
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ));
                                  } on FirebaseAuthException {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          "There is no user record corresponding to this identifier"),
                                    ));
                                  }
                                }
                              },
                              child: const Text("Login")),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ?  ",
                          style: TextStyle(fontSize: 16.0)),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegScreen(),
                          ));
                        },
                        child: const Text('Signup'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        )));
  }
}
