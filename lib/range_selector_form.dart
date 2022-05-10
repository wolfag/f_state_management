import 'package:flutter/material.dart';

typedef ValueSetter = void Function(int val);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required this.formKey,
    required this.onMinSaved,
    required this.onMaxSaved,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final ValueSetter onMinSaved;
  final ValueSetter onMaxSaved;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TextField(
              label: 'Mininum',
              onSaved: onMinSaved,
            ),
            const SizedBox(height: 12),
            _TextField(
              label: 'Maxinum',
              onSaved: onMaxSaved,
            ),
          ],
        ),
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    Key? key,
    required this.label,
    required this.onSaved,
  }) : super(key: key);

  final String label;
  final ValueSetter onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      onSaved: (val) {
        onSaved(int.parse(val ?? ''));
      },
      validator: (val) {
        if (val == null || int.tryParse(val) == null) {
          return 'Must be an integer';
        }
        return null;
      },
    );
  }
}
