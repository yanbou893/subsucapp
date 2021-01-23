import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/repositories/subsuc_amount_model.dart';
import 'package:subsucapp/repositories/subsuc_list_model.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';
import 'package:subsucapp/repositories/subsuc_sort_model.dart';
import 'package:subsucapp/repositories/subsuc_tab_model.dart';

import 'components/app.dart';
import 'components/subsuc_edit_screen.dart';
import 'components/subsuc_screen.dart';
import 'configs/const_text.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SubsucListModel()),
          // ChangeNotifierProvider(create: (context) => SubsucAmountModel()),
          // ChangeNotifierProvider(create: (context) => SubsucSortModel()),
          // ChangeNotifierProvider(create: (context) => SubsucTabModel()),
          Provider(create: (context) => Subsuc()),
        ],
    // ChangeNotifierProvider(
    //   create: (context) => SubsucModel(),
      child: SubApp()
    ),
  );
}

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