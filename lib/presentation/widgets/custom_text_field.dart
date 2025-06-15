import 'package:clevit_flutter_bloc/core/theme/app_fonts.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintLabel;
  final TextEditingController txtController;
  final Function()? onRightWidgetTab;
  final TextInputType? inputType;
  final Widget? rightIcon;
  final bool? passwordType;
  const CustomTextField({
    super.key,
    required this.label,
    required this.hintLabel,
    required this.txtController,
    this.onRightWidgetTab,
    this.inputType,
    this.rightIcon, 
    this.passwordType
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.appFonts.body(
            fontWeight: CustomFontWeight.medium,
            fontSize: FontSize.s12,
            color: AppTheme.accent,
          ),
        ),
        TextField(
          controller: txtController ,
          obscureText: passwordType ?? false ,
          keyboardType: inputType,
          cursorColor: AppTheme.greyLightColor,
          
          style: context.appFonts.body(
            fontWeight: CustomFontWeight.medium,
            fontSize: FontSize.s16,
            color: AppTheme.greyLightColor,
          ),
          decoration: InputDecoration(
            
            suffixIcon : rightIcon != null ?  InkWell(
              onTap: onRightWidgetTab,
              child: rightIcon) : SizedBox(),
            hintText: hintLabel,
            hintStyle: TextStyle(color: Color(0xFFB8BDBF)), // Hint text color
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFB8BDBF),
              ), // Inactive border
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFD49A00),
                width: 2.0,
              ), // Active border
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ), // Border for error state
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ), // Border for focused error state
            ),
          ),
        ),
      ],
    );
  }
}
