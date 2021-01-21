import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/configs/const_text.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';
import 'package:provider/provider.dart';

import 'subsuc_list/subsuc_list_view.dart';

class SubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstText.appTitle,
      // ダークモード対応
      darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
      home: ChangeNotifierProvider(
          create: (context) => Subsuc(),
          child: SubsucListView()
      ),
    );
  }
}