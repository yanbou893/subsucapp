import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/repositories/subsuc_list_model.dart';

class SubsucSortView extends StatelessWidget {

  final double size;
  final double height;

  const SubsucSortView(
      {Key key,
        @required this.size,
        @required this.height,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SubsucListModel>(builder: (context, subsucModel, _){
      return Container(
        decoration: BoxDecoration(color: Colors.black),
        width: size,
        height: height,
        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Text(
          '¥ ',
          textAlign: TextAlign.center,
          style: TextStyle(height: 1, fontSize: 45,fontWeight: FontWeight.bold,color: Colors.white),

        ),
      );

    });
  }
}