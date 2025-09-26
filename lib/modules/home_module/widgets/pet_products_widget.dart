import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/product.dart';
import 'package:petcure_user_app/core/helpers/fake_data.dart';
import 'package:petcure_user_app/modules/home_module/widgets/product_card.dart';

class PetProductsWidget extends StatefulWidget {
  const PetProductsWidget({super.key});

  @override
  State<PetProductsWidget> createState() => _PetProductsWidgetState();
}

class _PetProductsWidgetState extends State<PetProductsWidget> {
  late List<Product> products;

  String selectedCategory = 'All';
  final List<String> categories = [
    'All',
    'Animal',
    'Bird',
    'Reptile',
    'Amphibian',
  ];

  @override
  void initState() {
    super.initState();
    products = FakeData.generateFakeProducts();
  }

  @override
  Widget build(BuildContext context) {
    // Filter products based on selected category
    final filteredProducts = selectedCategory == 'All'
        ? products
        : products
              .where((product) => product.petCategory == selectedCategory)
              .toList();

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar - Fixed width
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border(right: BorderSide(color: Colors.grey[300]!)),
            ),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Categories',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const SizedBox(height: 20),
                ...categories.map((category) {
                  return ListTile(
                    title: Text(
                      category,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: category == selectedCategory
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: category == selectedCategory
                            ? Colors.blue
                            : Colors.black,
                      ),
                    ),
                    selected: category == selectedCategory,
                    selectedTileColor: Colors.blue[50],
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  );
                }),
              ],
            ),
          ),
          // Main content with products list
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$selectedCategory Products (${filteredProducts.length})',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // ListView instead of GridView
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
