import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homage_insta/generated/l10n.dart';
import 'package:homage_insta/util/const.dart';
import 'package:homage_insta/view/home/home_screen.dart';
import 'package:homage_insta/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

import '../common_components/button_with_icon.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Selector<LoginViewModel, bool>(
            selector: (context, loginViewModel) => loginViewModel.isLoading,
            builder: (context, isLoading, child) {
              return isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).appTitle,
                          style: TextStyle(fontFamily: TitleFont, fontSize: 28.0),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Selector<LoginViewModel, bool>(
                          selector: (context, loginViewModel) => loginViewModel.isSuccess,
                          builder: (context, isSuccess, child) {
                            return ButtonWithIcon(
                              icon: FontAwesomeIcons.signInAlt,
                              label: S.of(context).signIn,
                              onPressed: () => _signIn(context, isSuccess),
                            );
                          },
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }

  _signIn(BuildContext context, bool isSuccess) async {
    final loginViewModel = context.read<LoginViewModel>();
    await loginViewModel.signIn();

    if (!isSuccess) {
      Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          msg: S.of(context).signInFailed);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
}
