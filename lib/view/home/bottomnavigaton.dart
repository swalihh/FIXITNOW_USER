import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/view/home/booking.dart';
import 'package:userapp/view/home/home.dart';
import 'package:userapp/view/home/profile/profile.dart';
import 'package:userapp/view/home/saved.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  int currentIndexSelect = 0;
  late final List<Widget> pages;
  @override
  void initState() {
    super.initState();

    pages = [
      const Home(),
      const Bookings(),
      const Saved(),
      const Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndexSelect],
      bottomNavigationBar: Container(
        color: AppColors.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
          child: GNav(
              onTabChange: (newindex) {
                setState(() {
                  currentIndexSelect = newindex;
                });
              },
              //
              backgroundColor: AppColors.backgroundColor,
              color: AppColors.whiteColor,
              activeColor: AppColors.whiteColor,
              tabBackgroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.all(10),
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: ' Home',
                ),
                GButton(
                  icon: Icons.summarize_outlined,
                  text: 'Booking',
                ),
                GButton(
                  icon: Icons.bookmark_border,
                  text: ' Saved',
                ),
                GButton(
                  icon: Icons.person,
                  text: ' Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
