import 'package:ecommerce/viewmodels/login_with_phone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginWithPhoneView extends StatelessWidget {
  const LoginWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginWithPhoneViewmodel>.reactive(
        viewModelBuilder: () => LoginWithPhoneViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold();
        });
  }
}
