import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/utils/style.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/best_seller_list_view.dart';

import 'package:bookly_app/Features/home/presentation/views/widget/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/feature_list_view.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomAppBar(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: FeatureBookListView(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Text(
              'Newest Books',
              style: Style.textStyle18.copyWith(
                fontSize: 23,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        const BestSellerListView(),
      ],
    );
  }
}
