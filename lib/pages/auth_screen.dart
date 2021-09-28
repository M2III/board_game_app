import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  GlobalKey<FormState> _key=GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                      TextFormField(
                        controller: _emailController,
                        validator:(value){
                          if(value==null || value.isEmpty){
                            return "ERREUR";
                          }
                          return null;
                        }
                      ),
                      TextFormField(
                        controller: _passwordController,
                      ),
                      ElevatedButton(onPressed: () async {
                        /*FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email:_emailController.text,
                          password: _passwordController.text
                        ).then((value)=>null);*/
                        var test = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _emailController.text, password: _passwordController.text);
                        setState(() {
                          //ne sert à rien
                          print(test.user!.email);
                        });
                      }, child: Text("Valider"))

            ],

          ),
        )
        ]
            )
        )

    );
  }
}
