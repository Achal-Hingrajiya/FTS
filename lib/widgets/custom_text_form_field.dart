import 'package:flutter/material.dart';
import 'package:office_doc_tracing/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(dynamic value) validator;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    var _outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: grey5261,
      ),
      borderRadius: BorderRadius.circular(0),
    );
    return TextFormField(
      style: light16greyA5A5A5,
      maxLines: 1,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: light16greyA5A5A5,
        border: _outlineInputBorder,
        enabledBorder: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
      ),
    );
  }
}
