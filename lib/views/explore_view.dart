import 'package:ecommerce/viewmodels/explore_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;

    return ViewModelBuilder<ExploreViewModel>.reactive(
      viewModelBuilder: () => ExploreViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(height: he * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Find Products',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: he * 0.03),
                  TextFormField(
                    controller: viewModel.searchController,
                    onChanged: viewModel.updateSearch,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      prefixIcon: Icon(Icons.search, size: 30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search Store',
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: he * 0.02),
                  Expanded(
                    child: viewModel.categories.isEmpty
                        ? Center(child: Text('No results found'))
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.8,
                            ),
                            itemCount: viewModel.categories.length,
                            itemBuilder: (context, index) {
                              return customContainers(
                                context,
                                image: viewModel.categories[index]['image'],
                                name: viewModel.categories[index]['name'],
                                color: viewModel.categories[index]['color'],
                                colors: viewModel.categories[index]['colors'],
                                width: 2,
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

Widget customContainers(BuildContext context,
    {required String image,
    required String name,
    required Color color,
    required Color colors,
    required double width}) {
  var we = MediaQuery.of(context).size.width;

  return Container(
    height: 200,
    width: we * 0.45,
    decoration: BoxDecoration(
      border: Border.all(width: width, color: color),
      borderRadius: BorderRadius.circular(30),
      color: colors,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 80, width: 80, fit: BoxFit.cover),
        SizedBox(height: 10),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
