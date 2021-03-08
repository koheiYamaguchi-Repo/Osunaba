// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';


//FireStoreにポスティングするビジロジ



// class SuccessPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("出品完了"),
//       ),
//       body: Center(
//         child: IntrinsicWidth(
//           child: Column(
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () {
//                 Navigator.pop(context);
//                 },
//               child: Text("続いて出品する"),
//               ),
//               // todo ホームタブに戻るボタンの制作
//               // ElevatedButton(
//               //   onPressed: () {
//               //     Navigator.of(
//               //       context,
//               //       rootNavigator: true
//               //       ).pushNamed('');
//               //   },
//               //   child: Text("一覧画面に戻る"),
//               // ),
//             ],
//           ),
//         )
        
//       ),
//     );
//   }
// }
