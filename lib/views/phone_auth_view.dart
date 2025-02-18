import 'package:ecommerce/viewmodels/phone_auth_viewmodel.dart';
import 'package:ecommerce/views/login_view.dart';
import 'package:ecommerce/views/otp_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PhoneAuthView extends StatelessWidget {
  const PhoneAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    return ViewModelBuilder<PhoneAuthViewmodel>.reactive(
        viewModelBuilder: () => PhoneAuthViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/phoneui.png'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get your groceries\nwith nectar',
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: he * 0.03,
                        ),
                        TextFormField(
                          controller: viewModel.phoneController,
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/Pakistan.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              hintText: "+923000000000",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              border: InputBorder.none),
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            String phoneNumber =
                                viewModel.phoneController.text.toString();

                            if (phoneNumber.isEmpty ||
                                phoneNumber.length < 10) {
                              debugPrint("Please enter a valid phone number.");
                              return;
                            }

                            await FirebaseAuth.instance.verifyPhoneNumber(
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {
                                debugPrint(
                                    "Verification completed: $credential");
                              },
                              verificationFailed: (FirebaseAuthException ex) {
                                debugPrint(
                                    "Verification failed: ${ex.message}");
                                debugPrint("Error code: ${ex.code}");
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Verification failed: ${ex.message}"),
                                ));
                              },
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                debugPrint(
                                    "Verification ID sent: $verificationId");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpView(
                                      verificationid: verificationId,
                                    ),
                                  ),
                                );
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationID) {},
                              phoneNumber: phoneNumber,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            side: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 30.0),
                          ),
                          child: Center(
                            child: Text(
                              'Get Otp',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('or connect with social media'),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Color(0xFF5383EC),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset('assets/images/email.png'),
                                SizedBox(
                                  width: 40,
                                ),
                                Text(
                                  'Continue with Email',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFF4A66AC),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Image.asset('assets/images/facebook.png'),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                'Continue with Facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.white,
          );
        });
  }
}
