import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'login_form.dart';
import 'auth_model.dart';
import 'route.dart';

//import 'login.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

final authModelProvider = ChangeNotifierProvider((ref) => AuthModel());

void main() async {
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
      home: _LoginCheck(),
      builder: (BuildContext context, Widget? child) {
        return FlutterEasyLoading(child: child);
      },
    );
  }
}

class _LoginCheck extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final bool _loggedIn = useProvider(authModelProvider).loggedIn;
    return _loggedIn ? HomeScreen() : LoginForm();
  }
}

// Future<void> _logout() async {
//   await context.read<AuthModel>().logout();
// }
