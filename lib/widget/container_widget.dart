import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const ContainerWidget({
    super.key,
    this.controller,
    this.isPasswordField = false,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
  });

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 233, 232, 232).withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 184, 183, 183),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: widget.isPasswordField
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText
                        ? const Color.fromARGB(255, 36, 36, 36)
                        : const Color.fromARGB(255, 85, 85, 85),
                  ),
                )
              : null,
          border: InputBorder.none,
        ),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField ? _obscureText : false,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.validator,
      ),
    );
  }
}
