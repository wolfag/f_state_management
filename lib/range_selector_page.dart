import 'package:f_random_number/randomize_page.dart';
import 'package:f_random_number/randomizer_change_notifier.dart';
import 'package:f_random_number/range_selector_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RangeSelectorPage extends StatelessWidget {
  RangeSelectorPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Range')),
      body: SafeArea(
        child: RangeSelectorForm(
          formKey: formKey,
          onMaxSaved: (val) =>
              context.read<RandomizerChangeNotifier>().max = val,
          onMinSaved: (val) =>
              context.read<RandomizerChangeNotifier>().min = val,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RandomizePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
