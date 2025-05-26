import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:gold_app/cubit/gold_cubit/gold_cubit.dart';
import 'package:gold_app/repo/gold_repository.dart';
import 'service/gold_api_service.dart';
import 'screens/gold_screen.dart';

void main() {
  runApp(const GoldifyApp());
}

class GoldifyApp extends StatelessWidget {
  const GoldifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final apiService = GoldApiService(dio);
    final goldRepository = GoldRepository(apiService);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: dio),
        RepositoryProvider.value(value: apiService),
        RepositoryProvider.value(value: goldRepository),
      ],
      child: BlocProvider(
        create: (_) => GoldCubit(goldRepository)..fetchGoldPrices(),
        child: const GoldApp(),
      ),
    );
  }
}

class GoldApp extends StatelessWidget {
  const GoldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أسعار الذهب',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      home: const GoldScreen(),
    );
  }
}
