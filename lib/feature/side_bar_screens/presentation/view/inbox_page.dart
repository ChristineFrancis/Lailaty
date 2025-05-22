import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/widgets/inbox_widget.dart';

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
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        title: StringManager.inbox,
        ispop: true,
      ),
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
