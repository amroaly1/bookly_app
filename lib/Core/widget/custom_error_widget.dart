import 'package:bookly_app/Core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMeesage});
  final String errMeesage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Text(
          errMeesage,
          textAlign: TextAlign.center,
          style: Style.textStyle18,
        ),
      ),
    );
  }
}
