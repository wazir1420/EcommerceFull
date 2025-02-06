import 'package:ecommerce/viewmodels/product_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var we = MediaQuery.of(context).size.width;
    return ViewModelBuilder<ProductViewModel>.reactive(
        viewModelBuilder: () => ProductViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: he * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Center(
                        child: PageView.builder(
                          controller: viewModel.pageController,
                          onPageChanged: viewModel.onPageChanged,
                          itemCount: viewModel.images.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                child: Image.asset(
                                  viewModel.images[index],
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                        top: 50,
                        left: 20,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        )),
                    Positioned(
                        top: 50,
                        right: 20,
                        child: Image.asset(
                          'assets/images/Vector.png',
                          height: 30,
                        )),
                    Positioned(
                        bottom: 10,
                        left: 160,
                        child: Row(
                          children:
                              List.generate(viewModel.images.length, (index) {
                            bool isSelected = viewModel.currentPage == index;

                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  height: 10,
                                  width: isSelected ? 30 : 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: viewModel.currentPage == index
                                          ? Colors.blue
                                          : Colors.grey),
                                ));
                          }),
                        ))
                  ],
                ),
                SizedBox(
                  height: he * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Organic Bananas',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.favorite_outline,
                            color: Colors.grey,
                            size: 30,
                          )
                        ],
                      ),
                      Text('1kg, Price'),
                      SizedBox(
                        height: he * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    viewModel.decounter();
                                  },
                                  icon: Icon(Icons.remove)),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.grey, width: 1)),
                                child: Center(
                                  child: Text(
                                    viewModel.counter.toString(),
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    viewModel.incounter();
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.green,
                                  ))
                            ],
                          ),
                          Text(
                            '\$ ${viewModel.totalPrice}',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: he * 0.01,
                      ),
                      Text(
                        '____________________________________________________',
                        style: TextStyle(color: Colors.grey.shade300),
                      ),
                      SizedBox(
                        height: he * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Details',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(CupertinoIcons.chevron_down)
                        ],
                      ),
                      Text(
                          'Bananas are a fruit that are a good source of vitamins, minerals, and carbohydrates. They are grown in tropical regions and are a staple food.'),
                      SizedBox(
                        height: he * 0.01,
                      ),
                      Text(
                        '____________________________________________________',
                        style: TextStyle(color: Colors.grey.shade300),
                      ),
                      SizedBox(
                        height: he * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nutritions',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text('100gr'),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: he * 0.01,
                      ),
                      Text(
                        '____________________________________________________',
                        style: TextStyle(color: Colors.grey.shade300),
                      ),
                      SizedBox(
                        height: he * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nutritions',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                              children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: Color(0xFFF3603F),
                            );
                          }))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
