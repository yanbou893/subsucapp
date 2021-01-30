import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/components/subsuc_list/subsuc_amount_view.dart';
import 'package:subsucapp/components/subsuc_list/subsuc_list_view.dart';
import 'package:subsucapp/components/subsuc_list/subsuc_sort_view.dart';
import 'package:subsucapp/repositories/subsuc_list_model.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';
import 'file:///C:/Users/893ya/AndroidStudioProjects/subsucapp/lib/components/subsuc_edit_screen.dart';
import 'package:subsucapp/configs/const_text.dart';

class SubsucListScreen extends StatelessWidget {
  static String id = 'subsuc_screen';
  @override
  Widget build(BuildContext context) {

    final model = Provider.of<SubsucListModel>(context, listen: false);

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

    final List<TabInfo> _tabs = [
      TabInfo("Monthly", SubsucAmountView(size:size,height:heightA)),
      TabInfo("Yearly", SubsucAmountView(size:size,height:heightA)),
    ];
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
        backgroundColor: Colors.black,
        drawerEdgeDragWidth: 0, //　ボタンのみでドロワーを開ける様にする(スワイプでドロワーを開けるエリアを0にする）
        endDrawer: SizedBox(width: widthD, child: Drawer(
          child:Container(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('All Delete'),
                onPressed: () {
                  model.allClear();
                },
              )
            ],
          )
      //     children: <Widget>[
      //   DrawerHeader(
      //   child: Text(
      //     'My App',
      //     style: TextStyle(
      //       fontSize: 24,
      //       color: Colors.white,
      //     ),
      //   ),
      //     decoration: BoxDecoration(
      //       color: Colors.blue,
      //     ),
      //   ),
      // ]
          ))),
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            elevation: 0.0,
            bottom: TabBar(
              isScrollable: true,
              tabs: _tabs.map((TabInfo tab) {
              return Tab(text: tab.label);
              }).toList(),
              ),
        ),
            // bottom: TabBar(tabs: _tabs,)

        body: Container(
          padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                TabBarView(children: _tabs.map((tab) => tab.widget).toList()),
                // _amountField(size,heightA)
                // SubsucAmountView(),
                // SubsucSortView(),
                // SubsucListScreen(),
                // SubsucAmountView(size:size,height:heightA),
                SubsucSortView(size:widthC,height:heightC),
                SubsucListView(size:size,height:heightD),
            ],
          ),
        ),
      floatingActionButton:Container(
        // margin:EdgeInsets.only(bottom: 70.0),
        child:FloatingActionButton(
          onPressed:(){ _moveToCreateView(context); },
          child: Icon(Icons.add, size: 40),
        ),
      ),
        ),
    );
  }

  // void _deleteDB(){
  //   model.allClear();
  // }


  // Widget _amountField(size,height) => Container(
  // decoration: BoxDecoration(color: Colors.black),
  // width: size.width,
  // height: height,
  // padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
  // child: Text(
  // '¥ ',
  // textAlign: TextAlign.center,
  // style: TextStyle(height: 1, fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),
  //
  // ),
  // );
  //
  // Widget _sortField(size,height) => Container(
  //   decoration: BoxDecoration(color: Colors.black),
  //   width: size,
  //   height: height,
  //   padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
  //   child: Text(
  //     '¥ ',
  //     textAlign: TextAlign.center,
  //     style: TextStyle(height: 1, fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),
  //
  //   ),
  // );
  // //
  // Widget _listField(size,height) => Container(
  //   decoration: BoxDecoration(color: Colors.black),
  //   width: size.width,
  //   height: heightD,
  //   padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
  //   child: Text(
  //     '¥ '+"$count",
  //     textAlign: TextAlign.center,
  //     style: TextStyle(height: 1, fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),
  //
  //   ),
  // );


  // Widget _actionButton(context) => Container(
  //   // margin:EdgeInsets.only(bottom: 70.0),
  //   child:FloatingActionButton(
  //     onPressed:(){ _moveToCreateView(context); },
  //     child: Icon(Icons.add, size: 40),
  //   ),
  // );

  // _moveToCreateView(BuildContext context, TodoBloc bloc) => Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => TodoEditView(todoBloc: bloc, todo: Subsuc.newTodo()))
  // );

  Widget _createTab(Tab tab){
    return Center(
      child: Text("10 min Rest Time" , style: TextStyle(
          fontSize: 24.0
      ),),
    );
  }
  _moveToCreateView(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubsucEditScreen())
  );
}
class TabInfo {
  String label;
  Widget widget;
  TabInfo(this.label, this.widget);
}
