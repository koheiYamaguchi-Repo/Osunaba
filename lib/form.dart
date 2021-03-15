//フォーム部分だけこちらに書く
//Firestoreへの接続はlistingで

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//riverpod、material使って作成
//入力項目
//タイトル、説明、画像、募集人数,所在地,プロダクトのタイプ,いつまで完成させたいか
//任意項目
//youtubeURL(任意),githubURL(任意),使用言語

final keyProvider = Provider(
  (ref)=>GlobalKey<FormState>()
);

class MyCustomForm extends HookWidget{
  @override
  Widget build(BuildContext context){
    final _formKey = useProvider(keyProvider);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value){
              if(value!.isEmpty){
                return '入力必須項目です';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
