import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

import 'package:petcure_user_app/core/models/api_models/pet_category_model.dart';
import 'package:petcure_user_app/modules/home_module/utils/pet_products_helper.dart';
import 'package:petcure_user_app/modules/home_module/widgets/product_card.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/list_item_loading_widget.dart';
import 'package:petcure_user_app/widgets/loaders/custom_loading_widget.dart';

class PetProductsWidget extends StatefulWidget {
  const PetProductsWidget({super.key});

  @override
  State<PetProductsWidget> createState() => _PetProductsWidgetState();
}

class _PetProductsWidgetState extends State<PetProductsWidget> {
  // late List<Product> products;
  late final PetProductsHelper _petProductsHelper;

  final ValueNotifier<int?> _selectedCategoryId = ValueNotifier<int?>(null);
  final ValueNotifier<List<PetCategoryModel>> _categories =
      ValueNotifier<List<PetCategoryModel>>([]);

  @override
  void initState() {
    super.initState();
    _petProductsHelper = PetProductsHelper(context: context);
    _categories.value = [const PetCategoryModel(id: 0, petcategory: 'All')];
    _selectedCategoryId.value = 0;
    _petProductsHelper.petCategoriesInit();
    _petProductsHelper.petProductsInit();
  }

  @override
  void dispose() {
    super.dispose();
    _selectedCategoryId.dispose();
    _categories.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PetCategoryCubit, PetCategoryState>(
        listener: (context, state) {
          switch (state) {
            case PetCategoriesSuccess(:final petCategories):
              debugPrint('Pet categories fetched');
              // FIX: Create a new list with All + fetched categories
              final List<PetCategoryModel> newCategories = [
                const PetCategoryModel(id: 0, petcategory: 'All'),
                ...petCategories,
              ];
              _categories.value = newCategories;
              break;
            default:
          }
        },
        child: Row(
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Categories',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ValueListenableBuilder<List<PetCategoryModel>>(
                    valueListenable: _categories,
                    builder: (context, categories, child) {
                      return ValueListenableBuilder(
                        valueListenable: _selectedCategoryId,
                        builder: (context, selectedCategoryId, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: categories.map((category) {
                              return ListTile(
                                title: Text(
                                  category.petcategory,
                                  style: Theme.of(context).textTheme.labelMedium
                                      ?.copyWith(
                                        fontWeight:
                                            category.id == selectedCategoryId
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        color: category.id == selectedCategoryId
                                            ? Colors.deepPurple
                                            : Colors.black,
                                      ),
                                ),
                                selected: category.id == selectedCategoryId,
                                selectedTileColor: Colors.blue[50],
                                onTap: () {
                                  _selectedCategoryId.value = category.id;
                                },
                              );
                            }).toList(),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            // Main content with products list - Use Expanded to provide constraints
            Expanded(
              child: BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  switch (state) {
                    case ProductInitial _:
                    case ProductLoading _:
                      return const ListItemLoadingWidget(
                        itemCount: 5,
                        useSliver: false,
                      );
                    case ProductError(:final errorMessage):
                      return ValueListenableBuilder(
                        valueListenable: _selectedCategoryId,
                        builder: (context, selectedCategoryId, child) {
                          return CustomErrorWidget(
                            onRetry: () => _petProductsHelper.petProductsInit(),
                            errorMessage: errorMessage,
                            title: 'Products Error',
                          );
                        },
                      );
                    case ProductListSuccess(:final products):
                      return ValueListenableBuilder(
                        valueListenable: _selectedCategoryId,
                        builder: (context, selectedCategoryId, child) {
                          // Filter products based on selected category
                          final filteredProducts = selectedCategoryId == 0
                              ? products
                              : products
                                    .where(
                                      (product) =>
                                          product.petcategory ==
                                          selectedCategoryId,
                                    )
                                    .toList();

                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: _categories,
                                  builder: (context, categories, child) {
                                    final categoryName =
                                        selectedCategoryId != null &&
                                            categories.isNotEmpty &&
                                            selectedCategoryId <
                                                categories.length
                                        ? categories[selectedCategoryId]
                                              .petcategory
                                        : 'All';

                                    return Text(
                                      '$categoryName Products (${filteredProducts.length})',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 16),

                                // Check if no products are available
                                if (filteredProducts.isEmpty)
                                  Expanded(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.inventory_2_outlined,
                                            size: 80,
                                            color: Colors.grey[400],
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            'No Products Available',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Check back later for new products',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                else
                                  // ListView for products
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
                          );
                        },
                      );
                    default:
                      return const CustomLoadingWidget();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
