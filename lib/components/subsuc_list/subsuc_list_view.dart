import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:simple_todo_app/components/todo_edit/todo_edit_view.dart';
// import 'package:simple_todo_app/configs/const_text.dart';
// import 'package:simple_todo_app/models/todo.dart';
// import 'package:simple_todo_app/repositories/todo_bloc.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';
import 'package:subsucapp/components/subsuc_edit/subsuc_edit_view.dart';
import 'package:subsucapp/configs/const_text.dart';


class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}

class SubsucListView extends StatelessWidget {
  static String id = 'subsuc_screen';
  final List<Tab> _tabs = [
    Tab(text: "SAN CLEMENTE"),
    Tab(text: "SAN CLEMENTE"),
  ];

  @override
  Widget build(BuildContext context) {
    final count = context.select((Subsuc store) => store.count);

    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    var maxHeight = size.height - padding.top - padding.bottom;

    // アプリ描画エリアの縦サイズを取得
    if (Platform.isAndroid) {
      maxHeight = size.height - padding.top - kToolbarHeight;
    } else if (Platform.isIOS) {
      maxHeight = size.height - padding.top - padding.bottom - 22;
    }

    // Resultエリアの縦サイズ
    final heightA = maxHeight * (15 / 100);
    // テンキーエリアの縦サイズ
    final heightB = maxHeight * (10 / 100);
    final widthB = size.width * (70 / 100);
    final heightC = maxHeight * (10 / 100);
    final widthC = size.width * (90 / 100);
    final heightD = maxHeight * (65 / 100);
    final widthD = size.width * (50 / 100);

    return Scaffold(
        backgroundColor: Colors.black,
        drawerEdgeDragWidth: 0, //　ボタンのみでドロワーを開ける様にする(スワイプでドロワーを開けるエリアを0にする）
        endDrawer: SizedBox(width: widthD, child: Drawer()),
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            elevation: 0.0,
            // bottom: TabBar(tabs: _tabs,)
          ),
        body: Container(
          padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                _titleTextFormField(count,size,heightA),
                _sortField(count,widthC,heightC),
                _listField(count,size,heightD),
                _actionButton(context),
              // _noteTextFormField(),
              // // Container(
              // //   child:Row(
              // //    children:<Widget>[
              // _billdRadioButton1(),
              // _billdRadioButton2(),
              // _billdRadioButton3(),
              // //    ],
              // //   ),
              // // ),
              // _billdtextFormField(),
              // _dueDateTimeFormField(),
              // _confirmButton(context)
            ],
          ),
        ),
      // floatingActionButton:Container(
      //   // margin:EdgeInsets.only(bottom: 70.0),
      //   child:FloatingActionButton(
      //     onPressed:(){ _moveToCreateView(context, _bloc); },
      //     child: Icon(Icons.add, size: 40),
      //   ]),
      // ),
    );
  }

  Widget _titleTextFormField(count,size,heightA) => Container(
    decoration: BoxDecoration(color: Colors.black),
    width: size.width,
    height: heightA,
    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
    child: Text(
      '¥ '+"$count",
      textAlign: TextAlign.center,
      style: TextStyle(height: 1, fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),

    ),
  );


  Widget _sortField(count,widthC,heightC) => Container(
    decoration: BoxDecoration(color: Colors.black),
    width: widthC,
    height: heightC,
    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
    child: Text(
      '¥ '+"$count",
      textAlign: TextAlign.center,
      style: TextStyle(height: 1, fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),

    ),
  );


  Widget _listField(count,size,heightD) => Container(
    decoration: BoxDecoration(color: Colors.black),
    width: size.width,
    height: heightD,
    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
    child: Text(
      '¥ '+"$count",
      textAlign: TextAlign.center,
      style: TextStyle(height: 1, fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),

    ),
  );


  Widget _actionButton(context) => Container(
    // margin:EdgeInsets.only(bottom: 70.0),
    child:FloatingActionButton(
      onPressed:(){ _moveToCreateView(context); },
      child: Icon(Icons.add, size: 40),
    ),
  );

  // _moveToCreateView(BuildContext context, TodoBloc bloc) => Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => TodoEditView(todoBloc: bloc, todo: Subsuc.newTodo()))
  // );

  _moveToCreateView(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubsucEditView(Subsuc))
  );
}