import 'package:ecommereceapp/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/changescreen.dart';
import '../widgets/mybutton.dart';
import '../widgets/mytextformfield.dart';
import '../widgets/passwordtextformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
bool obscureText = true;
bool isLoading = false;



class _LoginScreenState extends State<LoginScreen> {

  void submit(context) async {
    try {
      setState(() {
        isLoading = true;
      });
      UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email.text, password: password.text);
      print(result);
    } on PlatformException catch (e) {
      String? message = "Please Check Your Internet Connection ";
      if (e.message != null) {
        message = e.message;
      }
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(message.toString()),
          duration: Duration(milliseconds: 800),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Duration(milliseconds: 800),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  void validation() async {
    if (email.text.isEmpty && password.text.isEmpty) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Both Fields Are Empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Please Try Valid Email"),
        // ),
      ));
    } else if (password.text.isEmpty) {
        scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else if (password.text.length < 8) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Password  Is Too Short"),
        ),
      );
    }
    else {
      submit(context);
    }
  }

  Widget _buildAllPart() {
    return Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                MyTextFormField(
                  name: "Email",
                  controller: email,
                ),
                SizedBox(
                  height: 10,
                ),
                PasswordTextFormField(
                  obscureText: obscureText,
                  name: "Password",
                  controller: password,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                isLoading == false
                    ? MyButton(
                  onPressed: () {
                    validation();
                  },
                  name: "Login",
                )
                    : Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 10,
                ),
                ChangeScreen(
                    name: "SignUp",
                    WhichAccount: "Don't Have An Account!",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (ctx) => SignUpScreen(),
                      //   ),
                      // );
                    },
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAllPart(),
            ],
          ),
        ),
      ),
    );
  }
}
