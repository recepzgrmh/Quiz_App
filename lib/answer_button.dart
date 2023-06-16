import 'package:flutter/material.dart';

class ButtonElevated extends StatelessWidget {
  const ButtonElevated({super.key, required this.metin, required this.onTap});

  final String metin;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 93, 91, 209),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(40),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
      child: Text(
        metin,
        textAlign: TextAlign.center,
      ),
    );
  }
}
