import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/Features/splash/presentation/view_models/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailView = '/bookDetailView';
  static const kSearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
          child: BookDetailsView(book: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
