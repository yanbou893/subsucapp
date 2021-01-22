import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subsucapp/repositories/subsuc_provider.dart';

import 'components/app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Subsuc(),
      child: SubApp()
    ),
  );
}