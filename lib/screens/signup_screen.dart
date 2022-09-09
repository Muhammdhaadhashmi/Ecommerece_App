import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/changescreen.dart';
import '../widgets/mybutton.dart';
import '../widgets/mytextformfield.dart';
import '../widgets/passwordtextformfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(p);
final TextEditingController email = TextEditingController();
final TextEditingController userName = TextEditingController();
final TextEditingController phoneNumber = TextEditingController();
final TextEditingController password = TextEditingController();
final TextEditingController address = TextEditingController();
bool isMale = true;
bool isLoading = false;
bool obscureText = true;
late UserCredential authResult;

class _SignUpScreenState extends State<SignUpScreen> {

  void submit() async {
    try {
      setState(() {
        isLoading = true;
      });
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      print(authResult);
    } on PlatformException catch (e) {
      String? message = "Please Check Your Internet Connection ";
      if (e.message != null) {
        message = e.message;
      }
      scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
        content: Text(message.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
        content: Text(e.toString()),
        duration: Duration(milliseconds: 600),
        backgroundColor: Theme.of(context).primaryColor,
      ));
      print(e);
    }
   await FirebaseFirestore.instance.collection("User").doc(authResult.user?.uid).set({
      "UserName": userName.text,
      "UserId": authResult.user?.uid,
      "UserEmail": email.text,
      "UserAddress": address.text,
      "UserGender": isMale == true ? "Male" : "Female",
      "UserNumber": phoneNumber.text,
    });
    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
    setState(() {
      isLoading = false;
    });
  }

  void validation() async {
    if (userName.text.isEmpty &&
        email.text.isEmpty &&
        password.text.isEmpty &&
        phoneNumber.text.isEmpty &&
        address.text.isEmpty) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("All Fields Are Empty"),
        ),
      );
    } else if (userName.text.length < 10) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Name Must Be 6 "),
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
        ),
      );
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
    } else if (phoneNumber.text.length < 11 || phoneNumber.text.length > 11) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Phone Number Must Be 11 "),
        ),
      );
    } else if (address.text.isEmpty) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text("Address Is Empty "),
        ),
      );
    }
    else {
      submit();
    }
  }

  Widget _buildAllTextFormField() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          MyTextFormField(
            name: "UserName",
            controller: userName,
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
            controller: password,
            name: "Password",
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
          GestureDetector(
            onTap: () {
              setState(() {
                isMale = !isMale;
              });
            },
            child: Container(
              height: 60,
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      isMale == true ? "Male" : "Female",
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MyTextFormField(
            name: "Phone Number",
            controller: phoneNumber,
          ),
          SizedBox(
            height: 10,
          ),
          MyTextFormField(
            name: "Address",
            controller: address,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          SizedBox(
            height: 10,
          ),
          isLoading == false
              ? MyButton(
            name: "SignUp",
            onPressed: () {
              validation();
            },
          )
              : Center(
            child: CircularProgressIndicator(),
          ),
          ChangeScreen(
            name: "Login",
            WhichAccount: "Already Have  An Account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      body: ListView(
          children: [
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              child: _buildBottomPart(),
            ),
          ],
        ),
      );
  }
}
