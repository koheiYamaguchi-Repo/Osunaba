import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';


//title,startDate,endDate,fee,reward,sellerInformation,postingPeriod,AboutProducts

class Listing extends StatefulWidget {
  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            FormBuilderTextField(
              name: "title",
              decoration: InputDecoration(labelText: 'タスク名'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
              maxLines: null,
            ),
            FormBuilderDateRangePicker(
              name: "duration",
              firstDate: DateTime.now(),
              lastDate: DateTime(2030),
              format: DateFormat.yMMMd(),
              decoration: InputDecoration(
                labelText: '募集対象期間',
                helperText: 'Helper text',
                hintText: 'Hint text',
              ),
            ),
            FormBuilderTextField(
              name: "fee",
              decoration: InputDecoration(labelText: '出品金額'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
            ),
            FormBuilderSwitch(
              name: "benefits",
              title: Text("特典の有無"),
              initialValue: false,
            ),
            FormBuilderTextField(
              name: "detail",
              decoration: InputDecoration(labelText: '仕事内容詳細'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            ElevatedButton(
              child: Text('出品する'),
              onPressed: () async {
                if (_formKey.currentState.saveAndValidate()) {
                  await products.add({
                    'title': _formKey.currentState.value['title'],
                    'duration': _formKey.currentState.value['duration'],
                    'fee': _formKey.currentState.value['fee'],
                    'benefits': _formKey.currentState.value['benefits'],
                    'detail': _formKey.currentState.value['detail'],
                  });
                  _formKey.currentState.reset();
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SuccessPage()));
              },
            )
          ],
        ),
      ),
    )));
  }
}

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("出品完了"),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                Navigator.pop(context);
                },
              child: Text("続いて出品する"),
              ),
              // todo ホームタブに戻るボタンの制作
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.of(
              //       context,
              //       rootNavigator: true
              //       ).pushNamed('');
              //   },
              //   child: Text("一覧画面に戻る"),
              // ),
            ],
          ),
        )
        
      ),
    );
  }
}
