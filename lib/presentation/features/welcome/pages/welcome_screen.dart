import 'package:auto_route/auto_route.dart';
import 'package:clevit_flutter_bloc/core/routers/app_routers.gr.dart';
import 'package:clevit_flutter_bloc/core/theme/app_fonts.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/core/utils/image_assets.dart';
import 'package:clevit_flutter_bloc/presentation/widgets/one_cask_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.backgroundImageOne),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 34),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(color: AppTheme.primary),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(24),
                    Text(
                      "Welcome!",
                      style: context.appFonts.body(
                        fontWeight: CustomFontWeight.medium,
                        fontSize: FontSize.s32,
                        color: AppTheme.secondary,
                      ),
                    ),
                    Gap(8),
                    Text(
                      "Text text text",
                      style: context.appFonts.body(
                        fontWeight: CustomFontWeight.regular,
                        fontSize: FontSize.s16,
                        color: AppTheme.secondary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: OneCaskButtonWidget(
                        content: 'Scan bottle',
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Have an account?",
                            style: context.appFonts.body(
                              fontWeight: CustomFontWeight.regular,
                              fontSize: FontSize.s16,
                              color: AppTheme.greyColor,
                            ),
                          ),

                          InkWell(
                            onTap: (){
                              context.pushRoute(LoginRoute());
                            },
                            child: Text(
                              "Sign in first",
                              style: context.appFonts.body(
                                fontWeight: CustomFontWeight.medium,
                                fontSize: FontSize.s16,
                                color: AppTheme.accent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
