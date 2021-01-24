import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/repositories/subsuc_list_model.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';

class SubsucBillingPeriod extends StatelessWidget {

  final String title;
  final TextEditingController textEditingController;
  final TextEditingController periodEditingController;

  final Function(String) didChanged;

  const SubsucBillingPeriod(BuildContext context,
      {Key key,
        @required this.title,
        @required this.textEditingController,
        @required this.periodEditingController,
        @required this.didChanged,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RadioListTile(
            activeColor: Colors.blue,
            title:  Text('Monthly'),
            value: 'Monthly',
            groupValue: textEditingController.text,
            onChanged: (value) {
              didChanged(value);
            },
          ),
          RadioListTile(
            activeColor: Colors.blue,
            title:  Text('Yearly'),
            value: 'Yearly',
            groupValue: textEditingController.text,
            onChanged: (value) {
              didChanged(value);
            },
          ),
          RadioListTile(
            activeColor: Colors.blue,
            title:  Text('Own'),
            value: 'Own',
            groupValue: textEditingController.text,
            onChanged: (value) {
              didChanged(value);
            },
          ),
          TextField(
            enabled:textEditingController.text == 'Own'? true : false,
            controller: periodEditingController,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}