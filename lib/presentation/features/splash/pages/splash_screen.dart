import 'package:auto_route/auto_route.dart';
import 'package:clevit_flutter_bloc/core/routers/app_routers.gr.dart';
import 'package:clevit_flutter_bloc/core/utils/image_assets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (mounted) {
        context.replaceRoute(WelcomeRoute());
      }
    });
  }

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
        child: Image.asset(ImageAssets.appLogo),
      ),
    );
  }
}
