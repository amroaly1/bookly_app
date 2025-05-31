import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/utils/style.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';

import 'package:bookly_app/Features/home/presentation/views/widget/book_rateing.dart';
import 'package:bookly_app/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailView, extra: book);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7 / 4,
              // child: Image.asset(
              //   AssetData.testimage,
              //   fit: BoxFit.fill,
              // ),
              child: CachedNetworkImage(
                imageUrl: book.volumeInfo!.imageLinks?.thumbnail ??
                    'https://img.freepik.com/free-photo/decorative-reading-concept_23-2147690510.jpg?t=st=1723056773~exp=1723060373~hmac=22e6944f4a9e1bfe5f0de4a311ebd0d3c535bdfa6ea703687d84275125ff8cad&w=996',
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      book.volumeInfo!.title!,
                      style: Style.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    book.volumeInfo!.authors![0],
                    style: Style.textStyle14,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Style.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BookRating(
                        rating: book.volumeInfo!.averageRating ?? 0,
                        count: book.volumeInfo!.ratingsCount ?? 0,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
