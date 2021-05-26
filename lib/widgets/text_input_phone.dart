import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memstuff/helpers/validator_helper.dart';

class TextInputPhone  extends StatelessWidget {

  final IconData icon;
  final String label;
  final String initialValue;
  final Function(String) onSaved;

  const TextInputPhone({
    Key key,
    this.icon,
    this.label,
    this.initialValue,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      initialValue: initialValue,
      onSaved: onSaved,
      validator: ValidatorHelper.phoneNumberValidator,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
      ),
    );
  }
}