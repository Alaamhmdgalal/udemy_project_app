import 'package:flutter/material.dart';

Widget defaultButton(
{
  double width = double.infinity,
  double height = 40.0,
  Color background = Colors.blue,
  bool isUpperCase = true,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () => function(),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  final void Function(String?)? onSubmit,
  final void Function(String?)? onChange,
  required final FormFieldValidator<String>? validator,
  bool isPassword = false,
  required String label,
  required IconData prefixIcon,
  IconData? suffixIcon,
  final void Function()? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffixIcon,
          ),
        ),
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );