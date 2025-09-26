import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/appointment_history_module/view/appointment_history_page.dart';
import 'package:petcure_user_app/modules/cart_module/view/cart_page.dart';
import 'package:petcure_user_app/modules/home_module/utils/home_page_helper.dart';
import 'package:petcure_user_app/modules/home_module/widgets/doctor_booking_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pet_products_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pets_list_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/user_profile_widget.dart';
import 'package:petcure_user_app/modules/orders_list_module/view/orders_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static route() => MaterialPageRoute(builder: (context) => HomePage());
}

class _HomePageState extends State<HomePage> {
  late final HomePageHelper _homePageHelper;

  @override
  void initState() {
    super.initState();
    _homePageHelper = HomePageHelper(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetCure', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: PetsListWidget(),
            item: ItemConfig(icon: Icon(Icons.pets), title: "Pets"),
          ),
          PersistentTabConfig(
            screen: DoctorBookingWidget(),
            item: ItemConfig(
              icon: Icon(Icons.local_hospital),
              title: "Hospital",
            ),
          ),
          PersistentTabConfig(
            screen: PetProductsWidget(),
            item: ItemConfig(icon: Icon(Icons.store), title: "Store"),
          ),
          PersistentTabConfig(
            screen: UserProfileWidget(logout: _homePageHelper.showLogoutDialog),
            item: ItemConfig(icon: Icon(Icons.person), title: "Profile"),
          ),
        ],
        navBarBuilder: (navBarConfig) =>
            Style2BottomNavBar(navBarConfig: navBarConfig),
      ),
      drawer: Drawer(
        backgroundColor: AppPalette.secondColor,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppPalette.firstColor),
              child: Text(
                'PetCure',
                style: TextStyle(
                  color: AppPalette.secondColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.history, color: AppPalette.firstColor),
              title: const Text(
                'Booking History',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                pushWithoutNavBar(context, AppointmentHistoryPage.route());
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart, color: AppPalette.firstColor),
              title: const Text(
                'Shopping Cart',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                pushWithoutNavBar(context, CartPage.route());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.format_list_bulleted,
                color: AppPalette.firstColor,
              ),
              title: const Text(
                'Orders History',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                pushWithoutNavBar(context, OrdersListPage.route());
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: AppPalette.firstColor),
              title: const Text(
                'Log out',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: _homePageHelper.showLogoutDialog,
            ),
          ],
        ),
      ),
    );
  }
}
