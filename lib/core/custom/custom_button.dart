import 'package:chat_app/core/resources/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  Color? color;
  Color? borderColor;
  Color? textColor;
  double? heigtButton;

  CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.borderColor,
    this.textColor,
    this.heigtButton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize:  Size.fromHeight(heigtButton ??56),
        elevation: 0,
        backgroundColor: color ?? AppConst.kWhite,
        minimumSize: Size(double.infinity, heigtButton ?? 38),
        shape: RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(
                  width: 2.0,
                  color: borderColor!,
                )
              : BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(text,
          style: TextStyle(
            letterSpacing: -0.24,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor ?? AppConst.kWhite,
          )),
    );
  }
}
