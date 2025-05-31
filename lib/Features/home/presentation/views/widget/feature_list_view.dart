import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/widget/custom_error_widget.dart';
import 'package:bookly_app/Core/widget/custom_loading_indicator.dart';
import 'package:bookly_app/Features/home/presentation/manager/featureBooks_cubit/feature_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeatureBookListView extends StatelessWidget {
  const FeatureBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailView,
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
        } else if (state is FeatureBooksFailure) {
          return CustomErrorWidget(errMeesage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
