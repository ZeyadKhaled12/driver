
import 'package:flutter/material.dart';

import '../widgets/forget_password_widgets/logo_driver.dart';
import '../widgets/forget_password_widgets/radio_list_driver.dart';
import '../widgets/forget_password_widgets/text_button_driver.dart';
import '../widgets/forget_password_widgets/text_driver.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {


  int val = 0;
  setSelectedRadio(int value){
    setState(() {
      if(value==1){
        val=1;
      }
      else if(value==2)
      {
        val=2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child:
        SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoDriver(),
              Container(
                padding: EdgeInsets.only(bottom: 5),
                margin: EdgeInsets.only(right: 80, left: 80),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 5.0,
                    ),)
                ),
                child: Center(
                  child:TextDriver(
                    text: 'Forget Password?',
                    colorText:Color(0xFFFFFFFF) ,
                    sizeText: 30,
                  ),
                ),
              ),
              SizedBox(height: 1.0,),
              Container(
                margin: EdgeInsets.only(right: 80, left: 80),
                child: Center(
                  child: TextDriver(
                    text:'Don\'t worry! We will help you \n     recover your password.' ,
                    sizeText: 19,
                    colorText: Color(0xFFFFFFFF),
                  ),
                ),
              ),

              SizedBox(height: 40.0,),
              RadioListDriver(
                subText:'Get a password reset link via \n a****@gmail.com' ,
                sizeText: 20,
                titleText:'Send to your mail' ,
                icon:Icons.email ,
                onChanged:(int number)
                {
                  setSelectedRadio(number);
                },
              ),
              SizedBox(height: 30.0,),
              RadioListDriver(
                subText: 'Get a security code via SMS to \n +2011*****90',
                sizeText: 18,
                titleText:'Send to your phone number' ,
                icon:Icons.phone ,
                onChanged: (int number)
                {
                  setSelectedRadio(number);
                },
              ),
              SizedBox(height: 60.0,),
              TextButtonDriver(
                sizeText: 20,
                colorText: Color(0xFFFFFFFF) ,
                text: 'Need help?' ,
                onPressed: (){},
              ),
              SizedBox(height: 5.0,),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextDriver(
                  text:'Please send any feedback or bug reports to' ,
                  sizeText:20 ,
                  colorText:Color(0xFFFFFFFF),
                ),

              ),
              SizedBox(height: 5.0,),
              TextButtonDriver(
                text: 'compant@domain.com',
                sizeText: 20,
                colorText: Colors.black,
                onPressed: (){} ,
              ),
            ],
          ),

        ),
      ),
    );
  }
}