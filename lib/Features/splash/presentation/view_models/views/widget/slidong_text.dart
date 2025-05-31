import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidningAnimation,
  });

  final Animation<Offset> slidningAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidningAnimation,
      builder: (context, _) => SlideTransition(
        position: slidningAnimation,
        child: const Padding(
          padding: EdgeInsets.only(
            right: 25,
          ),
          child: Text(
            'Read Free books',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
