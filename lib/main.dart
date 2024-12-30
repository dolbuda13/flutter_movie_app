import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/datasources/movie_data_source.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository_impl.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';
import 'package:flutter_movie_app/presentation/pages/home_page.dart';
import 'package:flutter_movie_app/presentation/viewmodels/home_view_model.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  final dataSource = MovieDataSourceImpl();
  final repository = MovieRepositoryImpl(dataSource);
  final viewModel = HomeViewModel(repository);

  runApp(MyApp(viewModel: viewModel));
}

class MyApp extends StatelessWidget {
  final HomeViewModel viewModel;

  const MyApp({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(viewModel: viewModel),
    );
  }
}
