import 'package:flutter/material.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/widgets/drop_down_list.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/Text%20form%20fields/custom_text_form_field_name.dart';

class TestPage extends StatelessWidget {
  final TextEditingController commentsController = TextEditingController();
  TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<String> moneyForTime = [
      '1 ساعة مقابل 300 EGP',
      '2 ساعة مقابل 300 EGP',
      '3 ساعة مقابل 300 EGP',
      '4 ساعة مقابل 300 EGP',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Center(
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: CustomTextFormFieldName(
                hintText: 'التعليقات',
                controller: commentsController,
                hintTextColor: Colors.black,
                fontSizeText: 20,
                isArabic: true,
                isReadonly: false,
                textAlign: TextAlign.start)),
      ),
    );
  }
}
