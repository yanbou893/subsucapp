import 'dart:async';
import 'dart:collection';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';
import 'package:subsucapp/repositories/db_provider.dart';

class SubsucListModel extends ChangeNotifier {
  String get editingName => nameController.text;
  String get editingAmount => amountController.text;

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  String _strValidateName = '';
  String get strValidateName => _strValidateName;
  int _intValidateAmount = 0;
  int get intValidateAmount => _intValidateAmount;
  bool _validateName = false;
  bool get validateName => _validateName;

  List<Subsuc> _subsucs =[];
  UnmodifiableListView<Subsuc> get subsucs {
    return UnmodifiableListView(_subsucs);
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

  void updateValidateAmount(value) {
      Subsuc.newTodo();
      notifyListeners();
  }

  void addSubsuc() {
    final newTask = Subsuc(
      name: nameController.text,
      amount: int.parse(amountController.text),
      // createdAt: DateTime.now(),
      // updatedAt: DateTime.now(),
    );
    _subsucs.add(newTask);
    clear();
  }

  void updateSubsuc(Subsuc updateTask) {
    var updateIndex = _subsucs.indexWhere((task) {
      return task.createdAt == updateTask.createdAt;
    });
    updateTask.name = nameController.text;
    updateTask.amount = int.parse(amountController.text);
    // updateTask.updatedAt = DateTime.now();
    _subsucs[updateIndex] = updateTask;
    clear();
  }

  void deleteSubsuc(int index) {
    _subsucs.removeAt(index);
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