import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomForm extends StatefulWidget {
  final String? hintText;
  final bool onscureText;

  const CustomForm({
    super.key,
    required this.hintText,
    this.onscureText = false,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.withOpacity(0.1)),
      child: TextFormField(
        obscureText: widget.onscureText,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
            hintText: widget.hintText,
            labelText: widget.hintText,
            border: InputBorder.none),
      ),
    );
  }
}
