import 'package:ayana_system_admin/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'navbar_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Center(
                  child: FlutterLogo(
                    size: 100,
                    textColor: primaryGreen,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Ayana System Admin",
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 20,
                    color: secondaryGreen,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  style: primaryTextStyle,
                  cursorColor: secondaryGreen,
                  cursorHeight: 20,
                  cursorWidth: 3,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    filled: false,
                    border: InputBorder.none,
                    hintText: "Masukkan email",
                    hintStyle: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      color: grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: unClickColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: unClickColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: primaryTextStyle,
                  obscureText: isObsecure,
                  cursorColor: secondaryGreen,
                  cursorHeight: 20,
                  cursorWidth: 3,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObsecure = !isObsecure;
                        });
                      },
                      child: Icon(
                        isObsecure ? Icons.visibility_off : Icons.visibility,
                        color: isObsecure ? unClickColor : primaryGreen,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    filled: false,
                    border: InputBorder.none,
                    hintText: "Masukkan password",
                    hintStyle: primaryTextStyle.copyWith(
                      fontWeight: regular,
                      color: grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: unClickColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                        color: unClickColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          child: const NavbarPage(),
                          type: PageTransitionType.rightToLeft,
                        ),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child:
                        // value.isLoading == true
                        //         ? SizedBox(
                        //             height: 20,
                        //             width: 20,
                        //             child: Center(
                        //               child: CircularProgressIndicator(
                        //                 color: white,
                        //                 strokeWidth: 3,
                        //               ),
                        //             ),
                        //           )
                        //         :
                        Text(
                      "Masuk",
                      style: primaryTextStyle.copyWith(
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
