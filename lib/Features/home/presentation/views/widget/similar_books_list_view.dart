import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/widget/custom_error_widget.dart';
import 'package:bookly_app/Core/widget/custom_loading_indicator.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.175,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 23,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(
                          AppRouter.kBookDetailView,
                          extra: state.books[index]);
                    },
                    child: CustomBookItem(
                      imageUrl:
                          state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                    ),
                  ),
                );
              },
              itemCount: state.books.length,
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMeesage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
