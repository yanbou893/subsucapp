import 'dart:async';
import 'dart:collection';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';
import 'package:subsucapp/repositories/db_provider.dart';
import 'package:uuid/uuid.dart';

class SubsucListModel extends ChangeNotifier {
  // List<Subsuc> get todoStream => _subsucController.;
  String get editingName => nameController.text;
  String get editingAmount => amountController.text;
  String get editingStartDate => startDateController.text;
  String get editingBillingText => billingTextController.text;
  String get editingBillingPeriod => billingPeriodController.text;

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController billingTextController = TextEditingController();
  TextEditingController billingPeriodController = TextEditingController();
  // final _subsucController = LisController<List<Subsuc>>();

  String _strValidateName = '';
  String get strValidateName => _strValidateName;
  int _intValidateAmount = 0;
  int get intValidateAmount => _intValidateAmount;
  bool _validateName = false;
  bool get validateName => _validateName;
  String _billingtext = 'Month';
  String get billingtext => _billingtext;

  List<Subsuc> _subsucs = [];
  List<Subsuc> get subsucs {
    return _subsucs;
  }
  getSubsucs() async {
    _subsucs = await DBProvider.db.getAllSubsuc();
  }

  SubsucListModel() {
    getSubsucs();
  }

  bool validateSubsucName() {
    if (editingName.isEmpty) {
      _strValidateName = 'Please input something.';
      notifyListeners();
      return false;
    } else {
      _strValidateName = '';
      _validateName = false;
      return true;
    }
  }

  void setValidateName(bool value) {
    _validateName = value;
  }

  void updateValidateName() {
    if (validateName) {
      validateSubsucName();
      notifyListeners();
    }
  }

  void updateValidateBillingText(value) {
      billingTextController.text = value;
      switch(value){
      case 'Monthly':
        billingPeriodController.text = '1';
        break;
      case 'Yearly':
        billingPeriodController.text = '12';
        break;
      case 'Own':
        break;

    }
      notifyListeners();
  }


  void addSubsuc() {
    final newTask = Subsuc(
        id: Uuid().v4(),
        name: nameController.text,
        amount: int.parse(amountController.text),
        billingPeriod: int.parse(billingPeriodController.text),
        billingtext: billingTextController.text,
        startDate: DateTime.parse(startDateController.text).toLocal(),
        pay: ""
      // createdAt: DateTime.now(),
      // updatedAt: DateTime.now(),
    );
    DBProvider.db.createSubsuc(newTask);
    clear();
  }

  void updateSubsuc(Subsuc updateTask) {

    updateTask.id = updateTask.id;
    updateTask.name = nameController.text;
    updateTask.amount = int.parse(amountController.text, onError: (source) => 0);
    updateTask.billingtext = billingTextController.text;
    updateTask.billingPeriod = int.parse(billingPeriodController.text);
    updateTask.startDate = DateTime.parse(startDateController.text +" 00:00:00Z");
    // updateTask.updatedAt = DateTime.now();
    DBProvider.db.updateSubsuc(updateTask);
    clear();
  }

  void deleteSubsuc(String id) {
    DBProvider.db.deleteSubsuc(id);
    notifyListeners();
  }

  void clear() {
    nameController.clear();
    amountController.clear();
    _validateName = false;
    notifyListeners();
  }

  // getSubsucs() async {
  //   await DBProvider.db.getAllSubsuc();
  // }
  //
  // TodoBloc() {
  //   getSubsucs();
  // }
  //
  // create(Subsuc subsuc) {
  //   subsuc.assignUUID();
  //   DBProvider.db.createSubsuc(subsuc);
  //   getSubsucs();
  // }
  //
  // update(Subsuc subsuc) {
  //   DBProvider.db.updateSubsuc(subsuc);
  //   getSubsucs();
  // }
  //
  // delete(String id) {
  //   DBProvider.db.deleteSubsuc(id);
  //   getSubsucs();
  // }
  //
  // void deleteItem(int index) {}
}