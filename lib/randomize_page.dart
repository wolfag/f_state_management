import 'dart:math';
import 'package:f_random_number/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizePage extends StatelessWidget {
  const RandomizePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomize'),
      ),
      body: Center(
        child: Consumer<RandomizerChangeNotifier>(
          builder: (context, notifier, child) {
            return Text(
              notifier.generatedNumber?.toString() ?? 'Generate a number',
              style: const TextStyle(
                fontSize: 42,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Generate'),
        onPressed: () {
          context.read<RandomizerChangeNotifier>().generateNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
