
import 'package:driver/presentation/screens/report_get_screen.dart';
import 'package:flutter/material.dart';



class GeneralWidgetAppBarNoti extends StatelessWidget {
  const GeneralWidgetAppBarNoti({Key? key, required this.isNotAccepted}) : super(key: key);
  final bool isNotAccepted;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async{
          await Navigator.pushNamed(context, ReportGetScreen.route);
        },
        icon: Stack(
          alignment: Alignment.bottomRight,
          children: [
            const Icon(Icons.notifications_active,
              color: Colors.black, size: 30),
            if(isNotAccepted)
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 8,
                child: const Center(
                  child: Text('1', style: TextStyle(color: Colors.white,
                      fontSize: 15
                )),
              ),
            )
          ],
        ));
  }
}
