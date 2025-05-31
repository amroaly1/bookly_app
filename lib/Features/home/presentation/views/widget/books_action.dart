import 'package:bookly_app/Core/utils/functions/launch_url.dart';
import 'package:bookly_app/Core/utils/style.dart';
import 'package:bookly_app/Core/widget/custom_button.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: Text(
                'Free',
                style: Style.textStyle18.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              backgroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, book.volumeInfo?.previewLink);
              },
              text: Text(
                getText(book),
                style: Style.textStyle16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo?.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'preview';
    }
  }
}
