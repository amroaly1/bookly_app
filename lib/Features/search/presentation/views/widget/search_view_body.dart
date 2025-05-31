import 'package:bookly_app/Core/utils/style.dart';
import 'package:bookly_app/Features/search/presentation/views/widget/custom_serach_text_field.dart';
import 'package:bookly_app/Features/search/presentation/views/widget/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomSearchTextField(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: Text(
              'Search Result',
              style: Style.textStyle18,
            ),
          ),
          const SearchResultListView(),
        ],
      ),
    );
  }
}
