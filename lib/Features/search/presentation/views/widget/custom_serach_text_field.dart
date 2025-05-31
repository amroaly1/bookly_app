import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        suffixIcon: Opacity(
          opacity: 0.8,
          child: IconButton(
            icon: Image.asset(
              'assets/images/search.png',
              fit: BoxFit.fill,
              height: 23,
              width: 23,
            ),
            onPressed: onTap,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
