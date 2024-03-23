import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_rxdart/generated/assets.gen.dart';
import 'package:flutter_template_rxdart/routes/router.gr.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((_) => context.router.replace(const ChargingAnimationRoute()));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Assets.images.imageSplash.image(height: 100, width: 100),
      ),
    );
  }
}
