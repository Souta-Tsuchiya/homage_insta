import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homage_insta/generated/l10n.dart';
import 'package:homage_insta/util/const.dart';

import '../common_components/button_with_icon.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).appTitle, style: TextStyle(fontFamily: TitleFont, fontSize: 28.0),),
              SizedBox(height: 12.0,),
              ButtonWithIcon(
                icon: FontAwesomeIcons.signInAlt,
                label: S.of(context).signIn,

                onPressed: () => _signIn(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _signIn(BuildContext context) {

  }
}
