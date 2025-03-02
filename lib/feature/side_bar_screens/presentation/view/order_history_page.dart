import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/widgets/inbox_widget.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List orders = [
      {
        'service': 'سفر',
        'fromTo': 'من كفر الشيخ الى الاسكندرية',
        'time': '5:00',
        'day': 'اكتوبر 15',
      },
      {
        'service': 'سفر',
        'fromTo': 'من كفر الشيخ الى الاسكندرية',
        'time': '5:00',
        'day': 'اكتوبر 15',
      },
      {
        'service': 'سفر',
        'fromTo': 'من كفر الشيخ الى الاسكندرية',
        'time': '5:00',
        'day': 'اكتوبر 17',
      },
      {
        'service': 'سفر',
        'fromTo': 'من كفر الشيخ الى الاسكندرية',
        'time': '5:00',
        'day': 'اكتوبر 17',
      },
    ];
    return Scaffold(backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(title: StringManager.ordesRecord,ispop: true,),
      body: Container(
        padding:
            EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * 0.1),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, i) {
            bool ok = false;
            if (i == 0 || orders[i]['day'] != orders[i - 1]['day']) ok = true;
            return InboxWidget(
                service: orders[i]['service'],
                fromTo: orders[i]['fromTo'],
                time: orders[i]['time'],
                day: orders[i]['day'],
                visible: ok);
          },
        ),
      ),
    );
  }
}
