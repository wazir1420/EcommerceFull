import 'package:ecommerce/viewmodels/splash_view%20_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (viewModel) {
          viewModel.navigateToWelcome(context);
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png'),
                    SizedBox(height: 20),
                    Text(
                      'DESHI MART',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Color(0xFF00CA44),
          );
        });
  }
}
