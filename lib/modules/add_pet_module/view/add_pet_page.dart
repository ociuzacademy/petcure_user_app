// add_pet_page.dart
import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/add_pet_module/widgets/add_pet_page_content.dart';
import 'package:provider/provider.dart';
import 'package:petcure_user_app/modules/add_pet_module/providers/add_pet_form_provider.dart';

class AddPetPage extends StatefulWidget {
  final bool isLoggedIn;
  final String? userId;
  const AddPetPage({super.key, required this.isLoggedIn, this.userId});

  @override
  State<AddPetPage> createState() => _AddPetPageState();

  static MaterialPageRoute route({required bool isLoggedIn, String? userId}) =>
      MaterialPageRoute(
        builder: (_) => AddPetPage(isLoggedIn: isLoggedIn, userId: userId),
      );
}

class _AddPetPageState extends State<AddPetPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddPetFormProvider(),
      child: AddPetPageContent(
        userId: widget.userId,
        isLoggedIn: widget.isLoggedIn,
      ),
    );
  }
}
