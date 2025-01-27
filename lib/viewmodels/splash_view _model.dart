import 'package:ecommerce/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  void navigateToWelcome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const WelcomeView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
