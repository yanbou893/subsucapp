
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';

import 'db_provider.dart';

class SubsucAmountModel extends ChangeNotifier {


  int _allAmount = 0;
  int get allAmount => _allAmount;

  List<Subsuc> _subsucs =[];
  List<Subsuc> get subsucs {
    return _subsucs;
  }
  getSubsucs() async {
    _subsucs = await DBProvider.db.getAllSubsuc();
  }

  SubsucAmountModel() {
    getSubsucs();
    // for(int i = 0; i < _subsucs.length; i++){
    //   _allAmount += _subsucs[i].amount;
    // }
  }


}