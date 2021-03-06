import 'package:flutter/material.dart';

// import 'package:flappy_search_bar/flappy_search_bar.dart';

class Home extends StatelessWidget {
  final controller = PageController(
    initialPage: 1,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          //検索ボックスの配置
          //フィルター、ソートボタンの配置
        child: PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            //カードの金型
              //
          ],
        ),
      ),
    );
  }
}

//取得、表示用のクラスを呼び出し
//データの数だけ生成
// class Contents extends StatefulWidgetBuilder{
//   @override
//   //上下にスワイプされた時の動作を検知して次のデータをロード
// }