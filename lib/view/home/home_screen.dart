import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homage_insta/generated/l10n.dart';
import 'package:homage_insta/view/home/pages/activities_page.dart';
import 'package:homage_insta/view/home/pages/feed_page.dart';
import 'package:homage_insta/view/home/pages/post_page.dart';
import 'package:homage_insta/view/home/pages/profile_page.dart';
import 'package:homage_insta/view/home/pages/search_page.dart';
import 'package:homage_insta/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();
    final pages = [
      FeedPage(),
      SearchPage(),
      PostPage(),
      ActivitiesPage(),
      ProfilePage(),
    ];

    return SafeArea(
      child: Selector<LoginViewModel, int>(
        selector: (context, loginViewModel) => loginViewModel.bottomNavigationBarIndex,
        builder: (context, bottomNavigationBarIndex, child) {
          return Scaffold(
            body: pages[loginViewModel.bottomNavigationBarIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: loginViewModel.bottomNavigationBarIndex,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.tealAccent,
              items: [
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.home),
                  label: S.of(context).home,
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.search),
                  label: S.of(context).search,
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.plusCircle),
                  label: S.of(context).add,
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.heart),
                  label: S.of(context).activities,
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.user),
                  label: S.of(context).user,
                ),
              ],
              onTap: (index) => _changeNavigation(context, index),
            ),
          );
        },
      ),
    );
  }

  _changeNavigation(BuildContext context, int index) {
    final loginViewModel = context.read<LoginViewModel>();
    loginViewModel.changeNavigation(index);
  }
}
