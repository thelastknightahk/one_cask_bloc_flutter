import 'package:clevit_flutter_bloc/core/theme/app_fonts.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class OneCaskButtonWidget extends StatelessWidget {
  final String content;
  final Color? backgroundColor;
  final Function() onTap;
  final double? width;
    final Widget? leftIcon;
  const OneCaskButtonWidget({super.key, required this.content, required this.onTap, this.backgroundColor, this.width, this.leftIcon });

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: onTap,
      child: Container(
         width: width ?? MediaQuery.of(context).size.width,
         decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.accent, 
          borderRadius: BorderRadius.circular(8)
         ),
         child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 20),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              leftIcon?? SizedBox(),
               Text(content, style: context.appFonts.body(fontWeight: CustomFontWeight.bold, fontSize: FontSize.s16, color: AppTheme.blackColor ) ),
             ],
           ),
         ),
      ),
    );
  }
}