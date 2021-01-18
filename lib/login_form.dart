import 'package:exp_market/auth_model.dart';
import 'package:exp_market/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'auth_model.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
      ),
      body: _buildSocialLogin(context),
    );
  }
}

Center _buildSocialLogin(BuildContext context) {
  return Center(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
          horizontal: 50,
        ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SignInButton(
            Buttons.Apple,
            onPressed: () async {
              await _login(context);
              print('click');
            },
          ),
          SignInButton(
            Buttons.Google,
            onPressed: () {
              print('click');
            },
          ),
          SignInButton(
            Buttons.Twitter,
            onPressed: () {
              print('click');
            },
          ),
          SignInButton(
            Buttons.Facebook,
            onPressed: () {
              print('click');
            },
          )
        ],
      ),
    ),
  ),
  );
}

Future<void> _login(BuildContext context) async {
  EasyLoading.show(status: 'Loading...');
  if (await context.read<AuthModel>().login()) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => MyApp()),
      (_) => false,
    );
  }
  EasyLoading.dismiss();
}
