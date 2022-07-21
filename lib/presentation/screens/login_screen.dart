import 'package:driver/functions/auth_fun.dart';
import 'package:driver/presentation/screens/forget_password_screen.dart';


import 'package:driver/providers/provider_user_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/general_widgets/general_widget_alert_dialog.dart';
import '../widgets/general_widgets/general_widget_circular.dart';
import '../widgets/login_widgets/login_widget_button.dart';
import '../widgets/login_widgets/login_widget_logo.dart';
import '../widgets/login_widgets/login_widget_text_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final List _hints = ['Email', 'Password'];
  final List _logos = [Icons.email, Icons.lock];
  final List<bool> _listErrors = [false, false];
  final AuthFun _authFun = AuthFun();
  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(child: AppBar(),
            preferredSize: const Size.fromHeight(0)),
        backgroundColor: Colors.white,
        body:
        Stack(
          children: <Widget>[
            SingleChildScrollView(
                child: Container(
                  color: Theme
                      .of(context)
                      .primaryColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const LoginWidgetLogo(),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: double.infinity,
                          //height: 250,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Colors.white,
                            //  border: Border.all(width: 3, color: Colors.grey)
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                LoginWidgetTextField(hintText: _hints[0],
                                    iconData: _logos[0],
                                    index: 0,
                                    isError: _listErrors[0]),
                                LoginWidgetTextField(hintText: _hints[1],
                                    iconData: _logos[1],
                                    isError: _listErrors[1],
                                    password: true,
                                    index: 1),
                                const Padding(padding: EdgeInsets.only(
                                    top: 10)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: <Widget>[
                                        InkWell(child: const Text(
                                            'Forgot your Password',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20)),
                                          onTap: () async{
                                            await
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>
                                              const ForgetPasswordScreen()),
                                            );
                                          }),
                                      ]),
                                ),
                                LoginWidgetButton(function: () async {
                                  setState(() {
                                    _listErrors[0] = Provider
                                        .of<ProviderUserDetails>(
                                        context, listen: false)
                                        .listTextEditingFields[0].isEmpty;
                                    _listErrors[1] = Provider
                                        .of<ProviderUserDetails>(
                                        context, listen: false)
                                        .listTextEditingFields[1].isEmpty;
                                  });
                                  if (!_listErrors.contains(true)) {
                                    setState(() {
                                      _isLoading = !_isLoading;
                                    });
                                    await _authFun.loginFun(email: Provider
                                        .of<ProviderUserDetails>(
                                        context, listen: false)
                                        .listTextEditingFields[0], password:
                                    Provider
                                        .of<ProviderUserDetails>(
                                        context, listen: false)
                                        .listTextEditingFields[1], ctx: context)
                                        .then((value) {
                                      if (value != null) {
                                        showDialog(context: context,
                                            builder: (context) {
                                              return GeneralWidgetAlertDialog(
                                                  text: value);
                                            });
                                      }
                                    }
                                    );
                                    setState(() {
                                      _isLoading = !_isLoading;
                                    });
                                  }
                                })
                              ]),
                        ),
                      )

                    ],
                  ),
                )

            ),
            if(_isLoading)
              Container(
                  color: Colors.white.withOpacity(0.69),
                  child: Center(
                    child: GeneralWidgetCircular(color: Theme
                        .of(context)
                        .primaryColor),
                  ))
          ],
        )
    );
  }
}
