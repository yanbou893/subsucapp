import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
class Subsuc {
  String id;
  String name;
  int amount;
  int billingPeriod;
  DateTime startDate;
  String pay;
  String billingtext;
  String sortText;
  DateTime now = new DateTime.now();

  final List<String> billdingTextBox = ['Month','Year','Own'] ;

  // final DateTime createdAt;
  DateTime updatedAt;

  Subsuc(
    {
      this.id,
      this.name,
      this.amount,
      this.billingtext,
      this.billingPeriod,
      this.startDate,
      this.pay,

      // this.createdAt,
      // this.updatedAt
    }
      );


  static List<Tab> tabs = <Tab>[
    Tab(
      text: "Monthly",
    ),
    Tab(
      text: "Yearly",
    )
  ];

  List<Tab> get listTab => tabs;

  // newTodo() {
  //   name = "";
  //   amount = 0;
  //   billingPeriod = 0;
  //   startDate = new DateTime(now.year, now.month, now.day);
  //   subsuc = 0;
  //   billingtext ="Monthly";
  //   textinput = false;
  // }
  //
  // final List<Tab> tabs = <Tab>[
  //   // Tab(
  //   //   text: ConstText.appTitle,
  //   // ),
  //   Tab(
  //     text: "Monthly",
  //   ),
  //   Tab(
  //     text: "Yearly",
  //   )
  // ];
  // TabController _tabController;
  // void incrementCounter() {
  //   count++;
  //   notifyListeners();
  // }
  //
  //
  // assignUUID() {
  //   id = Uuid().v4();
  // }
  //
  // staticでも同じ？
  factory Subsuc.fromMap(Map<String, dynamic> json) => Subsuc(
    id: json["id"],
    name: json["name"],
    amount: json["amount"],
    billingtext: json["billingtext"],
    billingPeriod: json["billingPeriod"],
    // DateTime型は文字列で保存されているため、DateTime型に変換し直す
    startDate: DateTime.parse(json["startDate"]).toLocal(),
    pay: json["pay"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "amount": amount,
    "billingtext": billingtext,
    "billingPeriod": billingPeriod,
    // sqliteではDate型は直接保存できないため、文字列形式で保存する
    "startDate": startDate.toUtc().toIso8601String(),
    "pay": pay,
  };
}