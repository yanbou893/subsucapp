
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';
import 'package:subsucapp/repositories/provider_method.dart';

class SubsucEditView extends StatelessWidget {
  static String id = 'subsuc_screen';

  final DateFormat _format = DateFormat("yyyy-MM-dd");

  final TodoBloc todoBloc;
  final Subsuc todo;
  final Subsuc _newTodo = Subsuc.newTodo();
  // final List<String> _billing = ['Monthly','Yearly',"自分で設定する"];
  // final data = Billdamount();

  TodoEditView({Key key, @required Subsuc}){
    // Dartでは参照渡しが行われるため、todoをそのまま編集してしまうと、
    // 更新せずにリスト画面に戻ったときも値が更新されてしまうため、
    // 新しいインスタンスを作る
    _newTodo.id = Subsuc.id;
    _newTodo.name = Subsuc.name;
    _newTodo.amount = Subsuc.amount;
    _newTodo.billingPeriod = Subsuc.billingPeriod;
    _newTodo.startDate = Subsuc.startDate;
    _newTodo.billingtext = Subsuc.billingtext;
    _newTodo.textinput = Subsuc.textinput;
  }

  @override
  Widget build(BuildContext context) {
    // final Billdamount data = Provider.of<Billdamount>(context);

    return Scaffold(
        appBar: AppBar(title: Text("")),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              _titleTextFormField(),
              _noteTextFormField(),
              // Container(
              //   child:Row(
              //    children:<Widget>[
              _billdRadioButton1(),
              _billdRadioButton2(),
              _billdRadioButton3(),
              //    ],
              //   ),
              // ),
              _billdtextFormField(),
              _dueDateTimeFormField(),
              _confirmButton(context)
            ],
          ),
        )
    );
  }

  Widget _titleTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "Name"),
    initialValue: _newTodo.name,
    onChanged: _setTitle,
  );

  void _setTitle(String title) {
    _newTodo.name = title;
  }

  Widget _noteTextFormField() => TextFormField(
    decoration: InputDecoration(labelText: "amount"),
    keyboardType: TextInputType.number,
    initialValue: _newTodo.amount.toString(),
    maxLines: 1,
    onChanged: _setNote,
  );

  void _setNote(String amount) {
    _newTodo.amount = int.parse(amount);
  }


  Widget _billdRadioButton1() => RadioListTile(
    activeColor: Colors.blue,
    title:  Text('Monthly'),
    value: 'Monthly',
    groupValue: _newTodo.billingtext,
    onChanged: _setBilling,
  );


  Widget _billdRadioButton2() => RadioListTile(
    activeColor: Colors.blue,
    title:  Text('Yearly'),
    value: 'Yearly',
    groupValue: _newTodo.billingtext,
    onChanged: _setBilling,
  );


  Widget _billdRadioButton3() => RadioListTile(
    activeColor: Colors.blue,
    title:  Text('自分で設定する'),
    value: '自分で設定する',
    groupValue: _newTodo.billingtext,
    onChanged: _setBilling,
  );


  Widget _billdtextFormField() => TextFormField(
    enabled: _newTodo.textinput,
    decoration: InputDecoration(labelText: "billingPeriod"),
    keyboardType: TextInputType.number,
    initialValue: _newTodo.billingPeriod.toString(),
    maxLines: 1,
    onChanged: _setBilling,
  );


  void _setBilling(String billing) {
    int billingdata;
    switch(billing){
      case 'Monthly':
        billingdata = 1;
        break;
      case 'Yearly':
        billingdata = 12;
        break;
      case '自分で設定する':
        billingdata = 1;
        _newTodo.textinput = true;
        break;

    }
    _newTodo.billingtext = billing;
    _newTodo.billingPeriod = billingdata;
  }





  // ↓ https://pub.dev/packages/datetime_picker_formfield のサンプルから引用
  Widget _dueDateTimeFormField() => DateTimeField(
      format: _format,
      decoration: InputDecoration(labelText: "start"),
      initialValue: _newTodo.startDate ?? DateTime.now(),
      onChanged: _setDueDate,
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
        if (date != null) {
          // final time = await showTimePicker(
          //   context: context,
          //   initialTime: TimeOfDay.fromDateTime(
          //       currentValue ?? DateTime.now()),
          // );
          return date;
        } else {
          return currentValue;
        }
      }
  );

  void _setDueDate(DateTime dt) {
    _newTodo.startDate = dt;
  }

  Widget _confirmButton(BuildContext context) => RaisedButton.icon(
    icon: Icon(
      Icons.tag_faces,
      color: Colors.white,
    ),
    label: Text("決定"),
    onPressed: () {
      if (_newTodo.id == null) {
        todoBloc.create(_newTodo);
      } else {
        todoBloc.update(_newTodo);
      }

      Navigator.of(context).pop();
    },
    shape: StadiumBorder(),
    color: Colors.green,
    textColor: Colors.white,
  );
}
