import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/utils/asset.dart';

import 'package:bookly_app/Features/splash/presentation/view_models/views/widget/slidong_text.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidningAnimation;
  @override
  void initState() {
    super.initState();
    inintSlidingAnimator();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetData.logoimage,
        ),
        const SizedBox(
          height: 10,
        ),
        SlidingText(slidningAnimation: slidningAnimation),
      ],
    );
  }

  void inintSlidingAnimator() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidningAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Get.to(const HomeView(),
        //     transition: Transition.fade, duration: kTranstionDuration);
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
