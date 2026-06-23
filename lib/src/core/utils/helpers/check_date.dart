import 'package:flutter/material.dart';
import 'package:uiren/src/core/colors/colors.dart';

bool checkDates(String startDate, String endDate, BuildContext context) {
  final start = DateTime.parse(convertToIsoFormat(startDate));
  final end = DateTime.parse(convertToIsoFormat(endDate));
  if (end.isBefore(start)) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.mainColor,
        content: Text('Дата окончания не может быть раньше даты начала'),
      ),
    );
    return false;
  }
  return true;
}

String convertToIsoFormat(String date) {
  final parts = date.split('-'); 
  return '${parts[2]}-${parts[1]}-${parts[0]}';
}


String convertToDisplayFormat(String date) {
  final parts = date.split('-'); 
  return '${parts[2]}-${parts[1]}-${parts[0]}'; 
}
