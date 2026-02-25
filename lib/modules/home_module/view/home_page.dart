import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:petcure_user_app/core/bloc/auth/auth_bloc.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/appointment_history_module/view/appointment_history_page.dart';
import 'package:petcure_user_app/modules/cart_module/view/cart_page.dart';
import 'package:petcure_user_app/modules/chat_module/view/chat_page.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/view/feedbacks_and_complaints_page.dart';
import 'package:petcure_user_app/modules/home_module/utils/home_page_helper.dart';
import 'package:petcure_user_app/modules/home_module/widgets/doctor_booking_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pet_products_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pets_list_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/user_profile_widget.dart';
import 'package:petcure_user_app/modules/login_module/view/login_page.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/view/nutrition_planner_page.dart';
import 'package:petcure_user_app/modules/orders_list_module/view/orders_list_page.dart';
import 'package:petcure_user_app/modules/prescriptions_module/view/prescriptions_page.dart';
import 'package:petcure_user_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const HomePage());
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
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state) {
            case AuthLoading _:
              OverlayLoader.show(context, message: 'Logging out...');
              break;
            case LogoutSuccess _:
              OverlayLoader.hide();
              Navigator.pop(context);
              CustomSnackBar.show(
                context,
                message: 'User logged out successfully',
              );
              Navigator.pushAndRemoveUntil(
                context,
                LoginPage.route(),
                (_) => false,
              );
              break;
            case AuthError(:final errorMessage):
              OverlayLoader.hide();
              CustomSnackBar.showError(context, message: errorMessage);
              break;
            default:
              OverlayLoader.hide();
          }
        },
        child: SafeArea(
          child: PersistentTabView(
            tabs: [
              PersistentTabConfig(
                screen: const PetsListWidget(),
                item: ItemConfig(icon: const Icon(Icons.pets), title: 'Pets'),
              ),
              PersistentTabConfig(
                screen: const DoctorBookingWidget(),
                item: ItemConfig(
                  icon: const Icon(Icons.local_hospital),
                  title: 'Doctors',
                ),
              ),
              PersistentTabConfig(
                screen: const PetProductsWidget(),
                item: ItemConfig(icon: const Icon(Icons.store), title: 'Store'),
              ),
              PersistentTabConfig(
                screen: UserProfileWidget(
                  logout: _homePageHelper.showLogoutDialog,
                ),
                item: ItemConfig(
                  icon: const Icon(Icons.person),
                  title: 'Profile',
                ),
              ),
            ],
            navBarBuilder: (navBarConfig) =>
                Style2BottomNavBar(navBarConfig: navBarConfig),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppPalette.secondColor,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
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
              leading: const Icon(Icons.history, color: AppPalette.firstColor),
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
              leading: const Icon(
                Icons.shopping_cart,
                color: AppPalette.firstColor,
              ),
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
              leading: const Icon(
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
              leading: const Icon(Icons.chat, color: AppPalette.firstColor),
              title: const Text(
                'AI Chat',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                pushWithoutNavBar(context, ChatPage.route());
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets, color: AppPalette.firstColor),
              title: const Text(
                'AI Nutrition Planner',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                pushWithoutNavBar(context, NutritionPlannerPage.route());
              },
            ),
            ListTile(
              leading: const Icon(Icons.feedback, color: AppPalette.firstColor),
              title: const Text(
                'Feedbacks & Complaints',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                pushWithoutNavBar(context, FeedbacksAndComplaintsPage.route());
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.medication,
                color: AppPalette.firstColor,
              ),
              title: const Text(
                'Prescription List',
                style: TextStyle(
                  color: AppPalette.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                pushWithoutNavBar(context, PrescriptionsPage.route());
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
