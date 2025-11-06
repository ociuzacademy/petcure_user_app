// register_page.dart
import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/register_module/utils/register_helper.dart';
import 'package:petcure_user_app/modules/register_module/widgets/register_page_content.dart';
import 'package:provider/provider.dart';
import 'package:petcure_user_app/modules/register_module/providers/register_form_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  static route() => MaterialPageRoute(builder: (context) => const RegisterPage());
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterHelper _registerHelper;

  @override
  void initState() {
    super.initState();
    _registerHelper = RegisterHelper(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: RegisterPageContent(onUserRegister: _registerHelper.register),
    );
  }
}
