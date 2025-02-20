import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils.dart';

class DatePickerTextField extends StatefulWidget {
  final String title;

  const DatePickerTextField({Key? key, required this.title,}) : super(key: key);

  @override
  _DatePickerTextFieldState createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);

      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date of birth",
          style: TextStyle(color: Colors.white),
        ),
        TextFormField(
          controller: _dateController,
          style: TextStyle(color: AppColors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.redpink,
            hintText: widget.title,
            hintStyle: TextStyle(
              fontSize: 16,
              color: AppColors.black.withOpacity(0.45),
              fontWeight: FontWeight.w500,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 36),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          readOnly: true,
          onTap: () => _selectDate(context),
        ),
      ],
    );
  }
}
