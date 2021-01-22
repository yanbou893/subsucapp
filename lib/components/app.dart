import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/configs/const_text.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';
import 'package:provider/provider.dart';

import 'subsuc_list/subsuc_list_view.dart';
import 'subsuc_edit/subsuc_edit_view.dart';

class SubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstText.appTitle,
      // ダークモード対応
      theme: ThemeData(
          brightness: Brightness.dark
      ),
      initialRoute: SubsucListView.id,
      routes: {
        SubsucListView.id: (context) => SubsucListView(),
        SubsucEditView.id: (context) => SubsucEditView(),
      },
    );
  }
}