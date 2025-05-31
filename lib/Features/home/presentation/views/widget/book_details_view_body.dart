import 'package:bookly_app/Core/utils/style.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/book_rateing.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/books_action.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/custom_app_bar_book_details.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/custom_book_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widget/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBarBookDetails(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.18 + 30),
                child: CustomBookItem(
                  imageUrl: book.volumeInfo?.imageLinks?.thumbnail ??
                      'https://img.freepik.com/free-photo/decorative-reading-concept_23-2147690510.jpg?t=st=1723056773~exp=1723060373~hmac=22e6944f4a9e1bfe5f0de4a311ebd0d3c535bdfa6ea703687d84275125ff8cad&w=996',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                book.volumeInfo?.title ?? 'No title',
                textAlign: TextAlign.center,
                style: Style.textStyle30,
              ),
              const SizedBox(
                height: 6,
              ),
              Opacity(
                opacity: 0.7,
                child: Text(
                  book.volumeInfo?.authors?[0] ?? 'No author',
                  textAlign: TextAlign.center,
                  style: Style.textStyle18.copyWith(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              BookRating(
                mainAxisAlignment: MainAxisAlignment.center,
                rating: book.volumeInfo!.averageRating ?? 0,
                count: book.volumeInfo!.ratingsCount ?? 0,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: BooksAction(
                  book: book,
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: Style.textStyle16.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const SimilarBooksListView(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
