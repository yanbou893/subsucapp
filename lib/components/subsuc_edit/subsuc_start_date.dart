import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/repositories/subsuc_list_model.dart';

class SubsucStartDate extends StatelessWidget {

  // final DateFormat _format = DateFormat("yyyy-MM-dd");
  final String title;
  final TextEditingController textEditingController;

  const SubsucStartDate(BuildContext context,
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
          DateTimeField(
              // initialValue: textEditingController.text != null ?
              // DateTime.parse((textEditingController.text).substring(0,10)) : DateTime.now(),
              controller: textEditingController,
            format: DateFormat("yyyy-MM-dd"),
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
              if (date != null) {
                return date;
              } else {
                return currentValue;
              }
            }
          ),
        ],
      ),
    );
  }
}