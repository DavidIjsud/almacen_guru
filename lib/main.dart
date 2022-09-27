import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_interview/features/checkout_show/data/data_sources/data_source_checkout_impl.dart';
import 'package:tech_interview/features/checkout_show/data/repository/checkout_repository.dart';
import 'package:tech_interview/features/checkout_show/data/repository/checkout_repository_impl.dart';
import 'package:tech_interview/features/checkout_show/domain/use_cases/fetch_shows_case.dart';
import 'package:tech_interview/features/checkout_show/presentation/shows.dart';

import 'features/checkout_show/presentation/cubit/show/shows_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ShowsCubit(
                fetchShowCase: FetchShowCase(
                    showRepository: CheckoutRepositoryImpl(
                        dataSourceCheckout: DataSourceCheckoutImpl()))),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ShowsPage(),
        ));
  }
}
