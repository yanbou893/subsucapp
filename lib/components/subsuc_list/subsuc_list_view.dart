import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///C:/Users/893ya/AndroidStudioProjects/subsucapp/lib/components/subsuc_edit_screen.dart';
import 'package:subsucapp/components/subsuc_list/subsuc_item.dart';
import 'package:subsucapp/repositories/subsuc_list_model.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';

class SubsucListView extends StatelessWidget {

  final Size size;
  final double height;

  const SubsucListView(
      {Key key,
        @required this.size,
        @required this.height,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SubsucListModel>(builder: (context, subsucModel, _){

      // if (subsucModel.subsucs.isEmpty) {
      //   return _emptyView();
      // }
      return Container(
          decoration: BoxDecoration(color: Colors.black),
          width: size.width,
          height: height,
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          // child:Provider<SubsucListModel>.value(
            // value: ,
          child:  ListView.separated(
              itemCount: subsucModel.subsucs.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
            var item = subsucModel.subsucs[index];
            return Card(
              // Dismissible(
              // key: Key(item.id),
            //   onDismissed: (direction) {
            //       subsucModel.deleteSubsuc(item.id);
            //     },
            //     // else {
            //     //   subsucModel.toggleDone(index, true);
            //     // }
            //   background: _buildDismissibleBackgroundContainer(false),
            //   secondaryBackground: _buildDismissibleBackgroundContainer(true),
              child: SubsucItem(
                item: item,
                onTap: () {

                  subsucModel.nameController.text = item.name;
                  subsucModel.amountController.text = (item.amount).toString();
                  subsucModel.startDateController.text = (item.startDate).toString().substring(0,10);
                  subsucModel.billingTextController.text = (item.billingtext).toString();
                  subsucModel.billingPeriodController.text = (item.billingPeriod).toString();
                  _moveToEditView(context, item);

                  // Navigator.of(context).push<dynamic>(
                  //   MaterialPageRoute<dynamic>(builder: (context) {
                  //     var subsucs = subsucModel.subsucs[index];
                  //     subsucModel.nameController.text = item.name;
                  //     // subsucModel.memoController.text = task.memo;
                  //     return SubsucEditScreen(editSubsuc: item);
                  //   }
                  //   ),
                  // );
                },
                // toggleDone: (value) {
                //   subsucModel.toggleDone(index, value);
                // },
              ),);
            // );
          },
          // separatorBuilder: (_, __) => Divider(),)
      )
          // )
      );
    });

  }

  Container _buildDismissibleBackgroundContainer(bool isSecond) {
    return Container(
      color: isSecond ? Colors.red : Colors.green,
      alignment: isSecond ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          isSecond ? 'Delete' : 'Done',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Widget _emptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("You don't have a task!!!"),
          SizedBox(height: 16),
          Text(
            'Complete!!!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }


  _moveToEditView(BuildContext context,  Subsuc item) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubsucEditScreen(editSubsuc: item))
  );
}