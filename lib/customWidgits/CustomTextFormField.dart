import 'package:flutter/material.dart';

import '../utiles/AppColors.dart';
import '../utiles/AppFonts.dart';

//this is the validation fucntion
typedef validation = String? Function(String?);

class Customtextformfield extends StatelessWidget {
  Color borderColor;
  String? prefixIcon;
  Color prefixIconColor;
  String labelText;
  TextStyle labelTextStyle;
  String? suffixIcon;
  bool isSuffixIcon;
  bool isPrefixIcon;
  bool password;
  validation validate;
  TextEditingController? textEditingController;
  int? maxLines;
  GestureTapCallback? suffixIconTap;

  Customtextformfield({
    this.isPrefixIcon = false,
    this.borderColor = AppColors.darkGrey,
    this.prefixIcon,
    this.prefixIconColor = AppColors.darkGrey,
    required this.labelText,
    this.labelTextStyle = AppFonts.medium16GreyScale,
    this.isSuffixIcon = false,
    this.suffixIcon,
    this.password = false,
    required this.validate,
    this.textEditingController,
    this.maxLines,
    this.suffixIconTap
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: textEditingController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: isPrefixIcon
            ? ImageIcon(AssetImage(prefixIcon!), color: prefixIconColor)
            : null,
        label: Text(labelText, style: labelTextStyle),
        suffixIcon: isSuffixIcon
            ? InkWell(
                onTap: suffixIconTap,
                child: ImageIcon(
                  AssetImage(suffixIcon!),
                  color: prefixIconColor,
                ),
              )
            : null,
      ),
      obscureText: password,
      obscuringCharacter: "*",
      validator: validate,
    );
  }
}
