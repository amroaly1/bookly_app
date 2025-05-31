import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const Padding(
          padding: EdgeInsets.only(
            top: 20,
            right: 30,
            left: 15,
          ),
          // child: BestSellerListViewItem(),
        ),
        childCount: 10,
      ),
    );
  }
}
