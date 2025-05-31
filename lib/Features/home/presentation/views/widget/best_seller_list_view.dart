import 'package:bookly_app/Core/widget/custom_error_widget.dart';
import 'package:bookly_app/Core/widget/custom_loading_indicator.dart';
import 'package:bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 30,
                  left: 30,
                ),
                child: BestSellerListViewItem(
                  book: state.books[index],
                ),
              ),
              childCount: state.books.length,
            ),
          );
        } else if (state is NewestBooksFailure) {
          return SliverFillRemaining(
              child: CustomErrorWidget(errMeesage: state.errMessage));
        } else {
          return const SliverFillRemaining(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
