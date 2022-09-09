import 'package:ecommereceapp/screens/Detail_screen.dart';
import 'package:flutter/material.dart';
import 'Admin_Panel/admin_home.dart';
void main()async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        snackBarTheme: SnackBarThemeData(
          actionTextColor: Colors.white,
          backgroundColor: Colors.lightBlue,
        ),
        primaryColor: Colors.lightBlue,
      ),
      home: DetailScreen(image: '', name: 'watch', price: 13,),
      // home:StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot) {
      //       if (snapshot.hasData) {
      //         return HomePage();
      //       } else {
      //         return LoginScreen();
      //       }
      //     }
      // ),
    );
  }
}
