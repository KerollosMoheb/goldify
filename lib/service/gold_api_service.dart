import 'package:dio/dio.dart';

class GoldApiService {
  final Dio _dio;

  GoldApiService(this._dio);

  Future<Map<String, dynamic>> fetchGoldPrices() async {
    final response = await _dio.get(
      'https://www.goldapi.io/api/XAU/EGP',
      options: Options(
        headers: {
          'x-access-token': 'goldapi-4cpa5ssmb51eszq-io',
          'Content-Type': 'application/json',
        },
      ),
    );
    return response.data;
  }
}
