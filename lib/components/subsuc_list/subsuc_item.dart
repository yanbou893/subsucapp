import 'package:flutter/material.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';

class SubsucItem extends StatelessWidget {
  final Subsuc item;
  final VoidCallback onTap;
  final Function(bool) toggleDone;

  const SubsucItem(
      {Key key,
        @required this.onTap,
        @required this.item,
        @required this.toggleDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  // (subsuc.memo.isEmpty)
                  //     ? Container()
                  //     : Column(
                  //   children: <Widget>[
                  //     SizedBox(height: 4),
                  //     Text(
                  //       subsuc.memo,
                  //       maxLines: 3,
                  //       overflow: TextOverflow.ellipsis,
                  //       style: Theme.of(context).textTheme.body1,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            // Checkbox(
            //   value: task.isDone,
            //   onChanged: (value) {
            //     print(value);
            //     toggleDone(value);
            //   },
            //   activeColor: Colors.lightGreen,
            // )
          ],
        ),
      ),
    );
  }
}
