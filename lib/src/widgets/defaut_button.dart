import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final void Function()? onTap;
  final String buttonText;
  const DefaultButton({
    Key? key,
    this.onTap,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(_buttonBorderRadius),
          ),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

const double _buttonBorderRadius = 7.5;
