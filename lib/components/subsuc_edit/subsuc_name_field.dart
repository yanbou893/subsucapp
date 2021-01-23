import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/repositories/subsuc_list_model.dart';

class SubsucNameField extends StatelessWidget {

  final String title;
  final TextEditingController textEditingController;
  final String errorText;
  final Function(String) didChanged;

  const SubsucNameField(BuildContext context,
      {Key key,
        @required this.title,
        @required this.textEditingController,
        @required this.errorText,
        @required this.didChanged,
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
            decoration: InputDecoration(errorText: errorText),
            onChanged: (value) {
              didChanged(value);
            },
          ),
        ],
      ),
    );
  }
}