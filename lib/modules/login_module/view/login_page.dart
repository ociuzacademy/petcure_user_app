import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/bloc/auth/auth_bloc.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/home_module/view/home_page.dart';
import 'package:petcure_user_app/modules/login_module/utils/login_helper.dart';
import 'package:petcure_user_app/modules/register_module/view/register_page.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
}

class _LoginPageState extends State<LoginPage> {
  late final LoginHelper _loginHelper;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginHelper = LoginHelper(
      context: context,
      formKey: _formKey,
      emailController: _emailController,
      passwordController: _passwordController,
    );
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _emailController.dispose();
    _passwordController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppPalette.firstColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state) {
            case AuthLoading _:
              OverlayLoader.show(context, message: 'Logging in...');
              break;
            case LoginSuccess(:final response):
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(context, message: response.message);
              Navigator.pushAndRemoveUntil(
                context,
                HomePage.route(),
                (_) => false,
              );
              break;
            case AuthError(:final errorMessage):
              OverlayLoader.hide();
              CustomSnackBar.showError(context, message: errorMessage);
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section with Gradient
              Container(
                height: screenSize.height * 0.35,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppPalette.firstColor, AppPalette.darkFirstColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white24,
                      backgroundImage: AssetImage('assets/icons/icon.png'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Log in to your account',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // Form Section in a "Card"
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                constraints: BoxConstraints(
                  minHeight: screenSize.height * 0.65,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10),
                      NormalTextField(
                        textEditingController: _emailController,
                        validatorFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(value);
                          if (!emailValid) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        textFieldIcon: const Icon(Icons.email_outlined),
                        textInputType: TextInputType.emailAddress,
                        focusNode: _emailFocusNode,
                        nextFocusNode: _passwordFocusNode,
                      ),
                      const SizedBox(height: 24),
                      NormalTextField(
                        textEditingController: _passwordController,
                        validatorFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value.length < 3) {
                            return 'Password must be at least 3 characters';
                          }
                          return null;
                        },
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        textFieldIcon: const Icon(Icons.password_outlined),
                        textInputType: TextInputType.visiblePassword,
                        isPassword: true,
                        focusNode: _passwordFocusNode,
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Forgot password logic
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppPalette.greyColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        buttonWidth: double.infinity,
                        backgroundColor: AppPalette.firstColor,
                        textColor: Colors.white,
                        labelText: 'Login',
                        onClick: _loginHelper.login,
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppPalette.black87Color,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              RegisterPage.route(),
                            ),
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppPalette.firstColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
