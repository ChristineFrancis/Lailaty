import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';

class DateviewModel with ChangeNotifier {
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  String get formattedDate {
    if (_selectedDate == null) return StringManager.select;
    final day = _selectedDate!.day.toString().padLeft(2, '0');
    final month = _selectedDate!.month.toString().padLeft(2, '0');
    final year = _selectedDate!.year.toString();

    return '$day/$month/$year';
  }

  Future<void> pickDate(BuildContext context,
      {bool allowFutureDates = false}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: allowFutureDates ? DateTime(2100) : DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorManager.grey1,
              onPrimary: Colors.black,
              onSurface: ColorManager.blackColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      notifyListeners();
    }
  }

  bool validateDate() {
    return selectedDate != null;
  }
}
