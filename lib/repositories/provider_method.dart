import 'dart:async';
import 'dart:core';
import 'package:subsucapp/repositories/subsuc_provider.dart';
import 'package:subsucapp/repositories/db_provider.dart';

class TodoBloc {

  getSubsucs() async {
    await DBProvider.db.getAllSubsuc();
  }

  TodoBloc() {
    getSubsucs();
  }

  create(Subsuc subsuc) {
    subsuc.assignUUID();
    DBProvider.db.createSubsuc(subsuc);
    getSubsucs();
  }

  update(Subsuc subsuc) {
    DBProvider.db.updateSubsuc(subsuc);
    getSubsucs();
  }

  delete(String id) {
    DBProvider.db.deleteSubsuc(id);
    getSubsucs();
  }
}