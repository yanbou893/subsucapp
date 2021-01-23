import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/configs/const_text.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';
import 'package:provider/provider.dart';

import 'subsuc_screen.dart';
import 'subsuc_edit_screen.dart';

class SubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstText.appTitle,
      // ダークモード対応
      theme: ThemeData(
          brightness: Brightness.dark
      ),
      initialRoute: SubsucListScreen.id,
      routes: {
        SubsucListScreen.id: (context) => SubsucListScreen(),
        SubsucEditScreen.id: (context) => SubsucEditScreen(),
      },
    );
  }
}