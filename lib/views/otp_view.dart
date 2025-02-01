import 'package:ecommerce/viewmodels/otp_viewm_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OtpView extends StatelessWidget {
  final String verificationid;
  OtpView({super.key, required this.verificationid});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewmModel>.reactive(
        viewModelBuilder: () => OtpViewmModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Enter your 4-digit code',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: viewModel.otpController,
                    keyboardType: TextInputType.phone,
                    maxLength: 6,
                    decoration: InputDecoration(
                      labelText: 'Code',
                      hintText: '- - - -',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      counterText: '',
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 250),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            // Resend the code (if needed)
                          },
                          child: Text(
                            'Resend Code',
                            style: TextStyle(
                                color: Color(0xFF00CA44), fontSize: 18),
                          )),
                      GestureDetector(
                        onTap: () async {
                          try {
                            String smsCode = viewModel.otpController.text;

                            // Check if OTP code is valid
                            if (smsCode.length == 6) {
                              PhoneAuthCredential credential =
                                  PhoneAuthProvider.credential(
                                verificationId: verificationid,
                                smsCode: smsCode,
                              );

                              // Sign in with the credential
                              await FirebaseAuth.instance
                                  .signInWithCredential(credential)
                                  .then((userCredential) {
                                // Handle successful sign-in
                                print("OTP Verified Successfully");
                                // Navigate to the next screen
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/home', // Replace with your next screen
                                );
                              }).catchError((error) {
                                // Handle error in sign-in
                                print("Error during verification: $error");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("OTP Verification Failed!"),
                                  ),
                                );
                              });
                            } else {
                              print("Invalid OTP");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Invalid OTP. Please try again."),
                                ),
                              );
                            }
                          } catch (ex) {
                            print("Error during verification: $ex");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Error during OTP verification."),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFF00CA44), shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
