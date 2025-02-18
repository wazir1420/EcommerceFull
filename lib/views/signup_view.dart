import 'package:ecommerce/viewmodels/signup_view_model.dart';
import 'package:ecommerce/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var we = MediaQuery.of(context).size.width;
    return ViewModelBuilder<SignupViewModel>.reactive(
        viewModelBuilder: () => SignupViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: he * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset('assets/images/carrot.png')],
                    ),
                    SizedBox(
                      height: he * 0.1,
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy'),
                    ),
                    SizedBox(
                      height: he * 0.01,
                    ),
                    Text(
                      'Enter your credentials to continue',
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    ),
                    SizedBox(
                      height: he * 0.05,
                    ),
                    Text(
                      'Username',
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    ),
                    SizedBox(
                      height: he * 0.01,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Enter your username'),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: he * 0.03,
                    ),
                    Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    ),
                    SizedBox(
                      height: he * 0.01,
                    ),
                    TextFormField(
                      controller: viewModel.emailController,
                      focusNode: viewModel.emailFocusNode,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter your email address',
                        suffixIcon: Icon(
                          viewModel.isEmailValid ? Icons.check : Icons.cancel,
                          color: viewModel.isEmailValid
                              ? Colors.green
                              : Colors.red,
                          size: 25,
                        ),
                      ),
                      onChanged: (email) {
                        viewModel.validateEmail(email);
                      },
                    ),
                    SizedBox(
                      height: he * 0.03,
                    ),
                    Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    ),
                    SizedBox(
                      height: he * 0.01,
                    ),
                    TextFormField(
                      controller: viewModel.passController,
                      focusNode: viewModel.passFocusNode,
                      obscureText: viewModel.isObscured,
                      decoration: InputDecoration(
                        hintText: '********',
                        suffixIcon: IconButton(
                          icon: Icon(
                            viewModel.isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            viewModel.togglePasswordVisibility();
                          },
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('Forgot Password?')],
                    ),
                    SizedBox(
                      height: he * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.registerUser(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF53B175),
                        minimumSize: Size(we * 1, he * 0.08),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: he * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginView()));
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00CA44)),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            )),
          );
        });
  }
}
