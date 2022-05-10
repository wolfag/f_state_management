import 'package:f_random_number/randomizer_change_notifier.dart';
import 'package:f_random_number/range_selector_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomizerChangeNotifier(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: RangeSelectorPage(),
      ),
    );
  }
}
