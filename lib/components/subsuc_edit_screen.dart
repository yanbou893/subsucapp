import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/components/subsuc_edit/subsuc_amount_field.dart';
import 'package:subsucapp/components/subsuc_edit/subsuc_name_field.dart';
import 'package:subsucapp/repositories/subsuc_list_model.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';

class SubsucEditScreen extends StatelessWidget {
  static String id = 'subsuc_edit_screen';
  final Subsuc editSubsuc;
  SubsucEditScreen({Key key, this.editSubsuc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<SubsucListModel>(
      builder: (context, viewModel, _) {
        return WillPopScope(
          onWillPop: () async {
            viewModel.clear();
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(_isEdit() ? 'Save Task' : 'Add Task'),
            ),
            body: ListView(
              children: <Widget>[
                // _buildInputField(
                //   context,
                //   title: 'Name',
                //   textEditingController: viewModel.nameController,
                //   errorText:
                //   viewModel.validateName ? viewModel.strValidateName : null,
                //   didChanged: (_) {
                //     viewModel.updateValidateName();
                //   },
                // ),
                // _buildInputField(
                //   context,
                //   title: 'Amount',
                //   textEditingController: viewModel.amountController,
                //   didChanged: (_) {
                //     viewModel.updateValidateName();
                //   },
                // ),
                SubsucNameField(
                  context,
                  title: 'Name',
                  textEditingController: viewModel.nameController,
                  errorText:
                  viewModel.validateName ? viewModel.strValidateName : null,
                  didChanged: (_) {
                    viewModel.updateValidateName();
                  },
                ),
                SubsucAmountField(
                  context,
                  title: 'Amount',
                  textEditingController: viewModel.amountController,
                  didChanged: (value) {
                    viewModel.updateValidateAmount(value);
                  },
                ),

                _buildAddButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isEdit() {
    return editSubsuc != null;
  }

  void tapAddButton(BuildContext context) {
    final viewModel = Provider.of<SubsucListModel>(context, listen: false);
    viewModel.setValidateName(true);
    if (viewModel.validateSubsucName()) {
      _isEdit() ? viewModel.updateSubsuc(editSubsuc) : viewModel.addSubsuc();
      Navigator.of(context).pop();
    }
  }

  // Widget _buildInputField(BuildContext context,
  //     {String title,
  //       TextEditingController textEditingController,
  //       String errorText,
  //       Function(String) didChanged}) {
  //   return Padding(
  //     padding: const EdgeInsets.all(20),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Text(
  //           title,
  //           style: Theme.of(context).textTheme.subtitle,
  //         ),
  //         TextField(
  //           controller: textEditingController,
  //           decoration: InputDecoration(errorText: errorText),
  //           onChanged: (value) {
  //             didChanged(value);
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildAddButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: RaisedButton(
        onPressed: () => tapAddButton(context),
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            _isEdit() ? 'Save' : 'Add',
            style:
            Theme.of(context).textTheme.title.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
