import 'package:ecommerce/viewmodels/otp_viewm_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OtpView extends StatelessWidget {
  final String verificationid;
  const OtpView({super.key, required this.verificationid});

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

                              await FirebaseAuth.instance
                                  .signInWithCredential(credential)
                                  .then((userCredential) {
                                debugPrint("OTP Verified Successfully");

                                Navigator.pushReplacementNamed(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  '/home',
                                );
                              }).catchError((error) {
                                debugPrint("Error during verification: $error");
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("OTP Verification Failed!"),
                                  ),
                                );
                              });
                            } else {
                              debugPrint("Invalid OTP");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Invalid OTP. Please try again."),
                                ),
                              );
                            }
                          } catch (ex) {
                            debugPrint("Error during verification: $ex");
                            // ignore: use_build_context_synchronously
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
