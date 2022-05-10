import 'package:f_random_number/main.dart';
import 'package:f_random_number/randomize_page.dart';
import 'package:f_random_number/range_selector_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';

class RangeSelectorPage extends ConsumerWidget {
  RangeSelectorPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Range')),
      body: SafeArea(
        child: RangeSelectorForm(
          formKey: formKey,
          onMaxSaved: (val) =>
              ref.read(randomizerProvider.notifier).setMax(val),
          onMinSaved: (val) =>
              ref.read(randomizerProvider.notifier).setMin(val),
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
