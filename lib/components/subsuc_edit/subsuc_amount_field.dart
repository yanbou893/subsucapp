import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/repositories/subsuc_list_model.dart';

class SubsucAmountField extends StatelessWidget {

  final String title;
  final TextEditingController textEditingController;

  const SubsucAmountField(BuildContext context,
      {Key key,
        @required this.title,
        @required this.textEditingController,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle,
          ),
          TextField(
            controller: textEditingController,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}