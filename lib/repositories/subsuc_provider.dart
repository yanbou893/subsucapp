import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Subsuc with ChangeNotifier {
  var count = 0;

  final List<Tab> tabs = <Tab>[
    // Tab(
    //   text: ConstText.appTitle,
    // ),
    Tab(
      text: "Monthly",
    ),
    Tab(
      text: "Yearly",
    )
  ];
  TabController _tabController;
  void incrementCounter() {
    count++;
    notifyListeners();
  }
}