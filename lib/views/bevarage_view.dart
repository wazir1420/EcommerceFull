import 'package:ecommerce/viewmodels/beverage_view_model.dart';
import 'package:ecommerce/views/shop_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BevarageView extends StatelessWidget {
  const BevarageView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var we = MediaQuery.of(context).size.width;

    return ViewModelBuilder<BeverageViewModel>.reactive(
      viewModelBuilder: () => BeverageViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: he * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                      const Text(
                        'Beverages',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Image.asset('assets/images/filter.png', width: 20),
                    ],
                  ),
                  SizedBox(height: he * 0.02),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: viewModel.beverages.length,
                      itemBuilder: (context, index) {
                        return customContainer(
                          context,
                          image: viewModel.beverages[index]['image']!,
                          name: viewModel.beverages[index]['name']!,
                          pcs: viewModel.beverages[index]['pcs']!,
                          price: viewModel.beverages[index]['price']!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
