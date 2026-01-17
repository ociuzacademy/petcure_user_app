import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petcure_user_app/core/typedefs/text_field_validator.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';

class CardNumberField extends StatelessWidget {
  final TextEditingController controller;
  final TextFieldValidator validator;

  const CardNumberField({
    super.key,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return NormalTextField(
      textEditingController: controller,
      validatorFunction: validator,
      labelText: 'Card Number',
      hintText: 'XXXX XXXX XXXX XXXX',
      textInputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        _CardNumberInputFormatter(),
      ],
    );
  }
}

class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonSpaceLength = i + 1;
      if (nonSpaceLength % 4 == 0 && nonSpaceLength != text.length) {
        buffer.write(
          ' ',
        ); // Add double spaces if you want more width, but one is standard
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
