import 'package:ecommerce/viewmodels/welcome_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var we = MediaQuery.of(context).size.width;
    return ViewModelBuilder<WelcomeViewModel>.reactive(
        viewModelBuilder: () => WelcomeViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: he * 0.07,
                        ),
                        Image.asset('assets/images/logo2.png'),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'DESHI',
                                style: TextStyle(
                                    color: Color(0xFF00CA44),
                                    fontSize: 25,
                                    fontFamily: 'PoppinsBold'),
                              ),
                              TextSpan(
                                text: ' MART',
                                style: TextStyle(
                                    color: Color(0xFFF6921E),
                                    fontSize: 25,
                                    fontFamily: 'PoppinsBold'),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Desh Ka Market',
                          style: TextStyle(color: Color(0xFF868686)),
                        ),
                        SizedBox(
                          height: he * 0.03,
                        ),
                        customRow(
                            'assets/images/leaf.png', 'Organic Groceries'),
                        Text(
                            '....................................................................................'),
                        SizedBox(
                          height: 5,
                        ),
                        customRow('assets/images/chicken.png',
                            'Whole foods and vegetable'),
                        Text(
                            '....................................................................................'),
                        SizedBox(
                          height: 5,
                        ),
                        customRow('assets/images/van.png', 'Fast Delivery'),
                        Text(
                            '....................................................................................'),
                        SizedBox(
                          height: 5,
                        ),
                        customRow(
                            'assets/images/bag.png', 'East Refund and Return'),
                        Text(
                            '....................................................................................'),
                        SizedBox(
                          height: 5,
                        ),
                        customRow('assets/images/secure.png', 'Secure and Safe')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              width: we * 1,
              height: he * 0.32,
              decoration: BoxDecoration(
                  color: Color(0xFF00CA44),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Welcome to our Store',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'PoppinsBold'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Get your grocery in as fast as',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'PoppinsMedium'),
                    ),
                    Text(
                      'one hours',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'PoppinsMedium'),
                    ),
                    SizedBox(
                      height: he * 0.1,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: we * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            'Proceed',
                            style: TextStyle(
                                color: Color(0xFF00CA44),
                                fontSize: 20,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

Widget customRow(String image, String name) {
  return Row(
    spacing: 30,
    children: [
      Image.asset(image),
      Text(
        name,
        style: TextStyle(color: Color(0xFF868686), fontSize: 17),
      )
    ],
  );
}
