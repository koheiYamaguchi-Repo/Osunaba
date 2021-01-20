import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'login_form.dart';
import 'auth_model.dart';
import 'home.dart';

//import 'login.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _LoginCheck(),
        builder: (BuildContext context, Widget child) {
          return FlutterEasyLoading(child: child);
        },
      ),
    );
  }
}

class _LoginCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool _loggedIn = context.watch<AuthModel>().loggedIn;
    return _loggedIn ? HomeScreen() : LoginForm();
  }
}

// Future<void> _logout() async {
//   await context.read<AuthModel>().logout();
// }
