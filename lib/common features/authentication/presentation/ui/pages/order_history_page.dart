import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_appbar.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/Drawer/inbox_widget.dart';

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
    return Scaffold(
      appBar: CustomAppbar(title: 'سجل الطلبات'),
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
