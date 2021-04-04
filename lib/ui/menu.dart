import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final _selectItemProvider = StateProvider<dynamic>((ref) => 0);

class MyCustomMenu extends HookWidget {
  List<DropdownMenuItem<int>> _items = List.empty(growable: true);
  final _selectItem = useProvider(_selectItemProvider);

  MyCustomMenu(itemLength) {
    this.setItems(itemLength);
    this._selectItem.state = _items[0].value!;
  }

  void setItems(int itemLength) {
    for (int i = 0; i < itemLength; i++) {
      _items
        ..add(DropdownMenuItem(
          child: Text(
            '$i',
            style: TextStyle(fontSize: 40.0),
          ),
          value: i + 1,
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _items,
      value: _selectItem.state,
      onChanged: (value) => {_selectItem.state = value},
    );
  }
}
