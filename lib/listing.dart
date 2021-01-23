import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flappy_search_bar/flappy_search_bar.dart';

class Listing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBar(),
            ),
        ),
    );
  }
}
