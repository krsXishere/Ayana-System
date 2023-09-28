import 'package:ayana_system_admin/pages/mobile/signin_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AyanaSystemAdmin());
}

class AyanaSystemAdmin extends StatefulWidget {
  const AyanaSystemAdmin({super.key});

  @override
  State<AyanaSystemAdmin> createState() => _AyanaSystemAdminState();
}

class _AyanaSystemAdminState extends State<AyanaSystemAdmin> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   appBarTheme: AppBarTheme(
      //     iconTheme: IconThemeData(color: black),
      //     color: Colors.deepPurpleAccent,
      //     foregroundColor: Colors.black,
      //     systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarColor: primaryGreen,
      //       statusBarIconBrightness: Brightness.dark,
      //     statusBarBrightness: Brightness.light,
      //     ),
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}
