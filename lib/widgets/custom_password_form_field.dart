import 'package:flutter/material.dart';
import 'package:office_doc_tracing/constants.dart';

class CustomPasswordFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(dynamic value) validator;

  const CustomPasswordFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  State<CustomPasswordFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomPasswordFormField> {
  bool _show_text = false;
  var _icon;

  @override
  void initState() {
    _icon = _show_text ? Icons.remove_red_eye : Icons.remove_red_eye_outlined;
    super.initState();
  }

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
      obscureText: !_show_text,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: GestureDetector(
          onTap: showHideText,
          child: Icon(
            _icon,
            color: grey5261,
          ),
        ),
        hintStyle: light16greyA5A5A5,
        border: _outlineInputBorder,
        enabledBorder: _outlineInputBorder,
        focusedBorder: _outlineInputBorder,
      ),
    );
  }

  showHideText() {
    setState(() {
      _show_text = !_show_text;
      _icon = _show_text ? Icons.remove_red_eye : Icons.remove_red_eye_outlined;
    });
  }
}
