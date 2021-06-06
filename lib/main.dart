import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:osunaba/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      home: Authentication(),
      builder: (BuildContext context, Widget? child) {
        return FlutterEasyLoading(child: child);
      },
    );
  }
}

class Authentication extends HookWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        return Home();
      } else {
        return Login();
      }
    });
  }
}
