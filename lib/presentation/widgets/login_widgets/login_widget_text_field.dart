// ignore_for_file: must_be_immutable

import 'package:driver/providers/provider_user_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class LoginWidgetTextField extends StatefulWidget {
  LoginWidgetTextField({Key? key, required this.hintText, required this.iconData,
    this.password = false, required this.index, required this.isError}) : super(key: key);
  String hintText;
  IconData iconData;
  bool password;
  int index;
  bool isError;
  void isErrorFun(){isError = false;}

  @override
  State<LoginWidgetTextField> createState() => _LoginWidgetTextFieldState();
}

class _LoginWidgetTextFieldState extends State<LoginWidgetTextField> {


  final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.grey, width: 2)
  );

  final OutlineInputBorder _outlineInputBorderError = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.red, width: 2)
  );

  final TextEditingController _controller = TextEditingController();
  bool _isSeen = true;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: widget.password? 68:null,
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                cursorColor: Colors.black,
                controller:  _controller,
                cursorHeight: 30,
                onChanged: (value){
                  Provider.of<ProviderUserDetails>(context, listen: false).changeControllers(
                      controllerText: _controller.text, index: widget.index);
                  setState(() {
                    widget.isErrorFun();
                  });
                },
                obscureText: widget.password && _isSeen,
                style: const TextStyle(fontSize: 25, color: Colors.black),
                decoration: InputDecoration(
                    isDense: true,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(fontSize: 25, color: Colors.black.withOpacity(0.6)),
                    prefixIcon: Icon(widget.iconData, size: 30, color: Theme.of(context).primaryColor),
                    suffix: widget.password? IconButton(onPressed: (){
                      setState(() {
                        _isSeen = !_isSeen;
                      });
                    }, icon: Icon(_isSeen?Icons.visibility:Icons.visibility_off,
                        size: 33, color: Theme.of(context).primaryColor), iconSize: 20):
                    null,
                    disabledBorder: widget.isError?_outlineInputBorderError:_outlineInputBorder,
                    enabledBorder: widget.isError?_outlineInputBorderError:_outlineInputBorder,
                    focusedBorder: widget.isError?_outlineInputBorderError:_outlineInputBorder
                ),
              ),
            ),
          ),
          if(widget.isError)
            const Padding(padding: EdgeInsets.only(left: 20),
              child: Text('This field is required', style: TextStyle( fontSize: 20, color: Colors.red,
                  fontWeight: FontWeight.bold
              )),
            )
        ],
      ),
    );
  }
}
