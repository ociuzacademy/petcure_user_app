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

  static route() => MaterialPageRoute(builder: (context) => LoginPage());
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
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.05,
                vertical: screenSize.height * 0.05,
              ),
              constraints: BoxConstraints(maxWidth: screenSize.width * 0.85),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NormalTextField(
                      textEditingController: _emailController,
                      validatorFunction: (value) {
                        // add email validation
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
                      textFieldIcon: Icon(Icons.email_outlined),
                      textInputType: TextInputType.emailAddress,
                      focusNode: _emailFocusNode,
                      nextFocusNode: _passwordFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
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
                      textFieldIcon: Icon(Icons.password),
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      focusNode: _passwordFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    CustomButton(
                      buttonWidth: double.infinity,
                      backgroundColor: AppPalette.firstColor,
                      textColor: Colors.white,
                      labelText: "Login",
                      onClick: _loginHelper.login,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        InkWell(
          onTap: () => Navigator.pushReplacement(context, RegisterPage.route()),
          child: Text(
            "Create Account",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppPalette.firstColor,
            ),
          ),
        ),
      ],
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }
}
