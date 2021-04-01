//フォーム部分だけこちらに書く
//Firestoreへの接続はlistingで

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

//riverpod、material使って作成
//入力項目
//タイトル、説明、画像、募集人数,所在地,プロダクトのタイプ,いつまで完成させたいか
//任意項目
//youtubeURL(任意),githubURL(任意),使用言語

final keyProvider = Provider((ref) => GlobalKey<FormState>());
final imageProvider = StateProvider<File?>((ref) => null);

class MyCustomForm extends HookWidget {
  final picker = ImagePicker();
  final _image = useProvider(imageProvider);

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image.state = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = useProvider(keyProvider);
    String? _title;
    String? _description;
    String? _pic;
    int? _people;
    String? _place;
    String? _type;
    DateTime? _duration;

    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "タイトル"),
            onSaved: (value) => {_title = value},
            validator: (value) {
              if (value!.isEmpty) {
                return '入力必須項目です';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "説明"),
            onSaved: (value) => {_description = value},
            validator: (value) {
              if (value!.isEmpty) {
                return '入力必須項目です';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "説明画像"),
            onTap:(){
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            validator: (value) {
              if (value!.isEmpty) {
                return '入力必須項目です';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "募集人数"),
            onSaved: (value) => {_people = value},
            validator: (value) {
              if (value!.isEmpty) {
                return '入力必須項目です';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "所在地"),
            onSaved: (value) => {_place = value},
            validator: (value) {
              if (value!.isEmpty) {
                return '入力必須項目です';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "プロダクトのタイプ"),
            onSaved: (value) => {_type = value},
            validator: (value) {
              if (value!.isEmpty) {
                return '入力必須項目です';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "いつまでに完成させたいか"),
            onSaved: (value) => {_duration = value},
            validator: (value) {
              if (value!.isEmpty) {
                return '入力必須項目です';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                //  if (_formKey.currentState!.validate()) {
                //    await products.add({
                //      'title': _formKey.currentState!.value['title'],
                //      'duration': _formKey.currentState!.value['duration'],
                //      'fee': _formKey.currentState.value['fee'],
                //      'benefits': _formKey.currentState.value['benefits'],
                //      'detail': _formKey.currentState.value['detail'],
                //    });
                //    _formKey.currentState.reset();
                //  }
                //  Navigator.push(context,
                //      MaterialPageRoute(builder: (context) => SuccessPage()));
              },
              child: Text('投稿する'),
            ),
          ),
        ],
      ),
    );
  }
}
