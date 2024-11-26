/*import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_text_form_field_with_prefix.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/logo_with_laylaty.dart';
import 'package:lailaty/core/resources/asset_manager.dart';

class CounterClick0 extends StatefulWidget {
  final Function(String, bool) onValidationSuccess; // Callback function

  const CounterClick0({super.key, required this.onValidationSuccess});

  @override
  State<CounterClick0> createState() => _CounterClick0State();
}

class _CounterClick0State extends State<CounterClick0> {
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _mobileNumberValidatorController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  /// Validates and triggers the callback with the validation result
  bool validateAndReturnCNT1() {
    if (_formKey.currentState!.validate() &&
        _mobileNumberController.text == _mobileNumberValidatorController.text) {
      widget.onValidationSuccess(_mobileNumberController.text, true);
      return true;
    } else {
      widget.onValidationSuccess("", false);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    //!
    // return Form(
    //   key: _formKey,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       // SVG Icons
    //       LogoWithLaylaty(),
    //       const SizedBox(height: 20),
    //       CustomTextWidget(text: 'تسجيل الدخول', fontSize: 36),
    //       const SizedBox(height: 40),
    //       CustomTextWidget(text: 'ادخل رقمك', fontSize: 28),
    //       const SizedBox(height: 20),
    //       CustomTextWidget(text: "ادخل رقم الهاتف الفعال كمحفظة مالية", fontSize: 18),
    //       const SizedBox(height: 20),
    //       CustomTextFormFieldWithPrefix(controller: _mobileNumberController, prefixText: "+ 20 ", hintText: "| 9123456789"),
    //       const SizedBox(height: 20),
    //       CustomTextWidget(text: "ادخل رقم الهاتف مرة اخرى للتأكيد", fontSize: 18),
    //       const SizedBox(height: 20),
    //       CustomTextFormFieldWithPrefix(controller: _mobileNumberValidatorController, prefixText: "+ 20 ", hintText: "| 9123456789"),

    //     ],
    //   ),
    // );
  }
}

/*
CounterClick0(
                      onValidationSuccess: (String text, bool isValid) {
                        if (isValid) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Valid Input: $text")),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Invalid Input")),
                          );
                        }
                      },
                    ),
                    */*/