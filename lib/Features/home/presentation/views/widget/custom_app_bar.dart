import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        //horizontal: 24,
        vertical: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/Logo.png',
            height: 18,
          ),
          IconButton(
            icon: Image.asset(
              'assets/images/search.png',
              fit: BoxFit.fill,
              height: 23,
              width: 23,
            ),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
