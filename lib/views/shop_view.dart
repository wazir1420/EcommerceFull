import 'package:ecommerce/viewmodels/shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var we = MediaQuery.of(context).size.width;

    return ViewModelBuilder<ShopViewModel>.reactive(
      viewModelBuilder: () => ShopViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: he * 0.03,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/carrot.png',
                                width: 40,
                                height: 40,
                              ),
                              SizedBox(
                                width: we * 0.18,
                              ),
                              Icon(
                                Icons.location_on,
                                size: 30,
                              ),
                              Text(
                                'Dhaka, Banasree',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(height: he * 0.03),
                          TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              suffixIcon: Icon(
                                Icons.search,
                                color: Color(0xFF53B175),
                                size: 30,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Search Store',
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: he * 0.02),
                          Stack(
                            children: [
                              SizedBox(
                                height: 120,
                                child: PageView(
                                  controller: viewModel.pageController,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset('assets/images/v1.png',
                                          fit: BoxFit.cover, width: we),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset('assets/images/v2.png',
                                          fit: BoxFit.cover, width: we),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset('assets/images/v3.png',
                                          fit: BoxFit.cover, width: we),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: we * 0.35,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildIndicator(viewModel, 0),
                                    _buildIndicator(viewModel, 1),
                                    _buildIndicator(viewModel, 2),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: he * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Exclusive Offer',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'See all',
                                style: TextStyle(
                                    color: Color(
                                      0xFF53B175,
                                    ),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(height: he * 0.02),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          spacing: 10,
                          children: [
                            customContainer(context,
                                image: 'assets/images/banana.png',
                                name: 'Organic Bananas',
                                pcs: '7pcs, priceg',
                                price: '4.99'),
                            customContainer(context,
                                image: 'assets/images/strawbery.png',
                                name: 'Red Apple',
                                pcs: '1kg, priceg',
                                price: '4.99'),
                            customContainer(context,
                                image: 'assets/images/apple.png',
                                name: 'Strawberry',
                                pcs: '1kg, priceg',
                                price: '5.99'),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: he * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Best Selling',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                                color: Color(
                                  0xFF53B175,
                                ),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: he * 0.02,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          spacing: 10,
                          children: [
                            customContainer(context,
                                image: 'assets/images/pepper.png',
                                name: 'Bell Pepper Red',
                                pcs: '1kg, priceg',
                                price: '4.99'),
                            customContainer(context,
                                image: 'assets/images/ginger.png',
                                name: 'Ginger',
                                pcs: '1kg, priceg',
                                price: '4.99'),
                            customContainer(context,
                                image: 'assets/images/tomato.png',
                                name: 'Tomatoes',
                                pcs: '1kg, priceg',
                                price: '5.99'),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: he * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Groceries',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                                color: Color(
                                  0xFF53B175,
                                ),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: he * 0.02,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          spacing: 10,
                          children: [
                            customContainers(context,
                                image: 'assets/images/pulses.png',
                                name: 'Pulses',
                                color: Color.fromARGB(255, 242, 210, 177)),
                            customContainers(context,
                                image: 'assets/images/rig.png',
                                name: 'Riges',
                                color: Color.fromARGB(255, 132, 198, 156))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: he * 0.02,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          spacing: 10,
                          children: [
                            customContainer(context,
                                image: 'assets/images/beef.png',
                                name: 'Beef Bone',
                                pcs: '1kg, priceg',
                                price: '4.99'),
                            customContainer(context,
                                image: 'assets/images/chiken.png',
                                name: 'Broiler Chicken',
                                pcs: '1kg, priceg',
                                price: '4.99'),
                            customContainer(context,
                                image: 'assets/images/mutton.png',
                                name: 'Mutton Boneless',
                                pcs: '1kg, priceg',
                                price: '5.99'),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ]),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: viewModel.selectedIndex,
            onTap: viewModel.onBottomNavTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shop_outlined,
                ),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.image_search_outlined,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_outline,
                ),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: 'Account',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFF53B175),
            unselectedItemColor: Colors.black,
            selectedIconTheme: IconThemeData(
              color: Color(0xFF53B175),
              size: 30,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.black,
              size: 30,
            ),
          ),
        );
      },
    );
  }

  Widget _buildIndicator(ShopViewModel viewModel, int index) {
    bool isActive = viewModel.currentPage == index;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: isActive ? 25 : 10,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF53B175) : Colors.grey,
        borderRadius: BorderRadius.circular(isActive ? 5 : 50),
      ),
    );
  }
}

Widget customContainer(BuildContext context,
    {required String image,
    required String name,
    required String pcs,
    required String price}) {
  var he = MediaQuery.of(context).size.height;
  var we = MediaQuery.of(context).size.width;
  return Container(
    height: he * 0.3,
    width: we * 0.45,
    decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: we * 0.3,
                height: he * 0.1,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(pcs),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ $price',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(
                    0xFF53B175,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget customContainers(BuildContext context,
    {required String image, required String name, required Color color}) {
  var we = MediaQuery.of(context).size.width;
  return Container(
    height: 90,
    width: we * 0.65,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    child: Row(
      children: [
        SizedBox(
          width: we * 0.04,
        ),
        Image.asset(
          image,
          height: 100,
          width: 100,
        ),
        SizedBox(
          width: we * 0.03,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
