import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/Features/home/presentation/manager/featureBooks_cubit/feature_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';

import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeatureBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchFeatureBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..featchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: kPrimaryColor,
          brightness: Brightness.dark,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
