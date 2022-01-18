import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()  onPressed;

  const CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const SizedBox(
            width: double.infinity,
            child:  Center(
                child: Text(
              'Ingrese',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ))),
        style: TextButton.styleFrom(
            // padding: EdgeInsets.symmetric(vertical: 15),
            elevation: 3,
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: onPressed);
  }
}
