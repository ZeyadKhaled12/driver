
// ignore_for_file: deprecated_member_use

import 'package:driver/presentation/widgets/general_widgets/general_app_bar_widgets/general_widget_app_bar.dart';

import 'package:flutter/material.dart';

import '../widgets/report_widgets/report_send_widgets/report_widget_send.dart';



class ReportSendScreen extends StatefulWidget {
  const ReportSendScreen({Key? key}) : super(key: key);
  static String route = 'ReportScreenRoute';

  @override
  _ReportSendScreenState createState() => _ReportSendScreenState();
}

class _ReportSendScreenState extends State<ReportSendScreen> {

  Widget _image({required String imageUrl}){
    return Expanded(child: Padding(
      padding: const EdgeInsets.all(10),
      child: Image(image: AssetImage(imageUrl)),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return GeneralWidgetAppBar(title: 'Report',
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,

            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ListTile(
                        leading: Icon(Icons.report_problem, color: Colors.black, size: 50),
                        title: Text('Report if you have an accident or damage!', style: TextStyle(
                            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold
                        )),
                      ),
                      Row(
                        children:  [
                          _image(imageUrl: 'assets/images/problem_imgaes/acciedent.png'),
                          _image(imageUrl: 'assets/images/problem_imgaes/damage.png'),
                        ],
                      ),
                      FlatButton(onPressed: (){
                        showDialog(context: context,
                            builder: (context) {
                              return const ReportWidgetSend();
                            });
                      }, child: const Text('Report',
                        style: TextStyle(color: Colors.black, fontSize: 25),))
                    ],
                  ),
                ),
              ),
            )
        ));
  }
}
