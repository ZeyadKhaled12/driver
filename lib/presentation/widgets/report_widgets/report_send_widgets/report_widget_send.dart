
// ignore_for_file: must_be_immutable, deprecated_member_use


import 'package:driver/functions/report_fun.dart';
import 'package:driver/presentation/widgets/report_widgets/report_send_widgets/report_widget_send_text_field.dart';
import 'package:flutter/material.dart';




class ReportWidgetSend extends StatefulWidget {
 const ReportWidgetSend({Key? key}) : super(key: key);


  @override
  State<ReportWidgetSend> createState() => _ReportWidgetSendState();
}

class _ReportWidgetSendState extends State<ReportWidgetSend> {

  final TextEditingController _textEditingController = TextEditingController();
  final ReportFun _reportFun = ReportFun();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {





    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      content:  SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            const Text('You can write any notes if you want', style: TextStyle(fontSize: 20,
                color: Colors.black, fontWeight: FontWeight.bold)),
            const Padding(padding: EdgeInsets.only(bottom: 20)),

            ReportWidgetSendTextField(controller: _textEditingController,),

            const Padding(padding: EdgeInsets.only(bottom: 10)),
            _isLoading?
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ):
            FlatButton(onPressed: () async{
              setState(() {_isLoading = !_isLoading;});
              await _reportFun.sendReportFun(notes: _textEditingController.text);
               Navigator.pop(context);
              setState(() {_isLoading = !_isLoading;});
            }, child: Text('Report', style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 20)))
          ],
        ),
      ),
    );
  }
}
