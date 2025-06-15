import 'package:auto_route/auto_route.dart';
import 'package:clevit_flutter_bloc/core/routers/app_routers.gr.dart';
import 'package:clevit_flutter_bloc/core/theme/app_fonts.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/auth/auth_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/auth/auth_event.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/auth/auth_state.dart';
import 'package:clevit_flutter_bloc/presentation/widgets/custom_text_field.dart';
import 'package:clevit_flutter_bloc/presentation/widgets/one_cask_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add listeners to rebuild UI when text changes
    _emailTEC.addListener(_onTextChanged);
    _passwordTEC.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    // Clean up controllers and listeners
    _emailTEC.removeListener(_onTextChanged);
    _passwordTEC.removeListener(_onTextChanged);
    _emailTEC.dispose();
    _passwordTEC.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    // Trigger rebuild when text changes
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(60),
            Icon(Icons.arrow_back, color: AppTheme.greyLightColor),
            const Gap(40),
            Text(
              "Sign in",
              style: context.appFonts.body(
                fontWeight: CustomFontWeight.medium,
                fontSize: FontSize.s32,
                color: AppTheme.secondary,
              ),
            ),
            const Gap(20),
            CustomTextField(
              label: "Email",
              hintLabel: "Enter email",
              txtController: _emailTEC,
              inputType: TextInputType.emailAddress,
            ),
            const Gap(16),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                final isVisible = state.isPasswordVisible;

                return CustomTextField(
                  label: "Password",
                  hintLabel: "Enter password",
                  txtController: _passwordTEC,
                  onRightWidgetTab: () {
                    context.read<AuthBloc>().add(TogglePasswordVisibility());
                  },
                  passwordType: isVisible ? false : true,
                  rightIcon: Icon(
                    isVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppTheme.accent,
                  ),
                );
              },
            ),
            const Gap(40),
            OneCaskButtonWidget(
              content: 'Continue',
              backgroundColor: (_emailTEC.text.trim().isNotEmpty &&
                      _passwordTEC.text.trim().isNotEmpty)
                  ? AppTheme.accent
                  : AppTheme.greyColor,
              onTap: (_emailTEC.text.trim().isNotEmpty &&
                      _passwordTEC.text.trim().isNotEmpty)
                  ? () {
                      context.pushRoute(const HomeRoute());
                    }
                  :  (){} , // Disable button when fields are empty
            ),
            const Gap(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Can’t sign in?",
                    style: context.appFonts.body(
                      fontWeight: CustomFontWeight.regular,
                      fontSize: FontSize.s16,
                      color: AppTheme.greyColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Implement password recovery logic
                    },
                    child: Text(
                      "Recover password",
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
          ],
        ),
      ),
    );
  }
}