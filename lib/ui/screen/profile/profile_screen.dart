import 'package:flutter/material.dart';
import 'package:test_flutter/ui/screen/profile/profile_body_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ProfilBodyScreen(),
      ),
    );
  }
}
