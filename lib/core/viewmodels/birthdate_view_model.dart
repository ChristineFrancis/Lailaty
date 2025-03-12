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

    return '$year/$month/$day';
  }

  Future<void> pickDate(BuildContext context,
      {bool allowFutureDates = false}) async {
    final DateTime now = DateTime.now();
    final DateTime lastDate = DateTime(now.year - 18, now.month, now.day);

    final DateTime initialDate =
        _selectedDate == null || _selectedDate!.isAfter(lastDate)
            ? lastDate
            : _selectedDate!;
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate, //_selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: allowFutureDates ? DateTime(2100) : lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorManager.grey2,
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
