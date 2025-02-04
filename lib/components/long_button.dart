import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String title;
  // final IconData icon;
  final Image image;
  // final onTap? onTap;
  const LongButton({
    super.key,
    required this.title,
    // required this.icon,
    required this.image,
    // required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xFF212A3E),
        borderRadius: BorderRadius.circular(12), // Added border radius
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            height: 24,
            width: 24,
            child: Image(image: image.image),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
