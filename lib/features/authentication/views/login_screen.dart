import 'package:day15/constants/gaps.dart';
import 'package:day15/constants/sizes.dart';
import 'package:day15/features/authentication/view_models/login_view_model.dart';
import 'package:day15/features/authentication/views/sign_up_screen.dart';
import 'package:day15/features/settings/view_models/theme_mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String routeUrl = "/login";
  static String routeName = "login";

  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onLoginTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ref.read(loginProvider.notifier).login(
              _formData["email"]!,
              _formData["password"]!,
              context,
            );
      }
    }
  }

  void _onCreateAccountTap() {
    context.pushNamed(SignUpScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeModeProvider).darkMode;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Color(0xFFF4F6F5),
        appBar: AppBar(
          backgroundColor: Color(0xFFF4F6F5),
          title: Text(
            "English (US)",
            style: TextStyle(
              fontSize: Sizes.size16,
              color: Colors.grey.shade600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size14,
            vertical: Sizes.size20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.all(Sizes.size10),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.circular(Sizes.size20),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/thread.svg',
                    width: size.width * 0.18,
                    height: size.width * 0.18,
                    colorFilter: ColorFilter.mode(
                      isDarkMode ? Colors.black : Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Mobile number or email",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Plase write your mobile number or email";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _formData['email'] = newValue;
                    }
                  },
                ),
                Gaps.v10,
                TextFormField(
                  obscureText: true,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Plase write your password";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _formData['password'] = newValue;
                    }
                  },
                ),
                Gaps.v10,
                GestureDetector(
                  onTap: _onLoginTap,
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: AnimatedContainer(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        color: ref.watch(loginProvider).isLoading
                            ? isDarkMode
                                ? Colors.grey.shade800
                                : Colors.grey.shade300
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(Sizes.size5),
                      ),
                      duration: Duration(milliseconds: 300),
                      child: Center(
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Gaps.v16,
                Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: size.height * 0.11,
          color: Color(0xFFF4F6F5),
          child: Column(
            children: [
              GestureDetector(
                onTap: _onCreateAccountTap,
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.size8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(Sizes.size5),
                    ),
                    child: Center(
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.v10,
              FractionallySizedBox(
                widthFactor: 1.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.meta,
                      size: Sizes.size14,
                      color: Colors.black54,
                    ),
                    Gaps.h5,
                    Text(
                      "Meta",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
