import 'package:board_game_app/pages/auth_screen.dart';
import 'package:board_game_app/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GlobalKey<FormState> _key=GlobalKey();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _passwordVerifController = TextEditingController();

    const Color color = Color.fromRGBO(255, 255, 255, 1.0);

    final ButtonStyle styleRegister = ElevatedButton.styleFrom(primary: Colors.red, textStyle: const TextStyle(fontSize: 20,color:  color),shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.7),
    ) );
    final ButtonStyle styleLogin = ElevatedButton.styleFrom(primary: Colors.blueAccent, textStyle: const TextStyle(fontSize: 20,color:  color),shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.7),
    ) );

    return Scaffold(
      backgroundColor: Colors.grey,
      body:Center(
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
                      validator:(value){
                        if(value==null || value.isEmpty){
                          return "ERREUR";
                        }
                        return null;
                      }
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
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 20), // add padding to adjust text
                        isDense: true,
                        hintText: "Password",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                          child: Icon(Icons.password),
                        ),
                      ),
                      validator:(value){
                        if(value==null || value.isEmpty){
                          return "ERREUR";
                        }
                        return null;
                      }
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
                      controller: _passwordVerifController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 20), // add padding to adjust text
                          isDense: true,
                          hintText: "Confirm Password",
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(top: 15), // add padding to adjust icon
                            child: Icon(Icons.password),
                          ),
                        ),
                        validator:(value){
                          if(value==null || value.isEmpty){
                            return "ERREUR";
                          }else if(value != _passwordController.text){
                            return "ERREUR";
                          }
                          return null;
                        }
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
                      child: ElevatedButton(onPressed: () async {
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: _emailController.text, password: _passwordController.text);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>const HomeScreen(),));
                      },style: styleRegister,
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
                                MaterialPageRoute(builder: (context)=>const AuthScreen()),);
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

        )
      )

    );
  }
}
