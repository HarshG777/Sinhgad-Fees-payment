import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  const MyButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 160,
        decoration: BoxDecoration(
          color: const Color(0xFF212A3E),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF212A3E),
              blurRadius: 15,
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "LOGIN",
            style: TextStyle(
                color: Color.fromARGB(255, 184, 220, 250), fontSize: 20),
          ),
        ),
      ),
    );
  }
}
