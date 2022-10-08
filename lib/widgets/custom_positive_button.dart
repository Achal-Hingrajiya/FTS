import 'package:flutter/material.dart';
import 'package:office_doc_tracing/constants.dart';

class CustomPositiveButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomPositiveButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<CustomPositiveButton> createState() => _CustomPositiveButtonState();
}

class _CustomPositiveButtonState extends State<CustomPositiveButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: grey5261,
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 48,
        ),
        shape: const RoundedRectangleBorder(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: semiBold20black,
          ),
          widget.isLoading
              ? Container(
                  height: 20,
                  width: 20,
                  margin: const EdgeInsets.only(left: 20,),
                  child: CircularProgressIndicator(
                    color: black,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
