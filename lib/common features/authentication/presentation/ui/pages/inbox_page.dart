import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_appbar.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/Drawer/inbox_widget.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List inbox = [
      {
        'service': 'ليلتي',
        'fromTo': 'ادعم قضيتك الفلسطينية',
        'time': '5:00',
        'day': 'اكتوبر 15',
      },
      {
        'service': 'ليلتي',
        'fromTo': 'ادعم قضيتك الفلسطينية',
        'time': '5:00',
        'day': 'اكتوبر 15',
      },
      {
        'service': 'ليلتي',
        'fromTo': 'ادعم قضيتك الفلسطينية',
        'time': '5:00',
        'day': 'اكتوبر 17',
      },
      {
        'service': 'ليلتي',
        'fromTo': 'ادعم قضيتك الفلسطينية',
        'time': '5:00',
        'day': 'اكتوبر 17',
      },
    ];

    return Scaffold(
      appBar: CustomAppbar(title: 'الصندوق الوارد'),
      body: Container(
        padding:
            EdgeInsets.symmetric(vertical: 10, horizontal: screenWidth * 0.1),
        child: ListView.builder(
          itemCount: inbox.length,
          itemBuilder: (context, i) {
            bool ok = false;
            if (i == 0 || inbox[i]['day'] != inbox[i - 1]['day']) ok = true;
            return InboxWidget(
                service: inbox[i]['service'],
                fromTo: inbox[i]['fromTo'],
                time: inbox[i]['time'],
                day: inbox[i]['day'],
                visible: ok);
          },
        ),
      ),
    );
  }
}
