import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
//title,startDate,endDate,fee,return,sellerInformation,postingPeriod,AboutProducts

class Listing extends StatefulWidget {
  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
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
                  ),
                FormBuilderDateRangePicker(
                  name: "募集期間",
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  format: DateFormat.yMMMd(),
                  decoration: InputDecoration(
                    labelText: 'Date Range',
                    helperText: 'Helper text',
                    hintText: 'Hint text',
                  ),
                ),
                FormBuilderTextField(
                  name: "fee",
                  decoration: InputDecoration(labelText: '報酬金額'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),
                ),
              ],
            ),
          ),
        ))
    );
  }
}
