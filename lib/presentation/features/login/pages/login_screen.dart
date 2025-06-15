import 'package:auto_route/auto_route.dart';
import 'package:clevit_flutter_bloc/core/theme/app_theme.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/auth/auth_bloc.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/auth/auth_event.dart';
import 'package:clevit_flutter_bloc/presentation/bloc/auth/auth_state.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.secondaryPrimaryColor,
      body:  SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Gap(40), 
         Icon(Icons.arrow_back, color: AppTheme.greyLightColor, ),
         BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isVisible = state.isPasswordVisible;
        return GestureDetector(
          onTap: () {
            context.read<AuthBloc>().add(TogglePasswordVisibility());
          },
          child: Center(
            child: Icon(
              isVisible ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ); }, )
        ],)),
    );
  }
}