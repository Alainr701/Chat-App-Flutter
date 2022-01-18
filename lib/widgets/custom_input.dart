import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool? isPassword;

  const CustomInput(
      {Key? key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      required this.keyboardType,
      this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child:  TextField(
        controller: textController,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: placeholder,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
