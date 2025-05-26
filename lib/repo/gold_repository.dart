import 'package:gold_app/models/gold_price.dart';
import 'package:gold_app/service/gold_api_service.dart';

class GoldRepository {
  final GoldApiService goldApiService;

  GoldRepository(this.goldApiService);

  Future<GoldPrice> getGoldPrices() async {
    final data = await goldApiService.fetchGoldPrices();
    return GoldPrice.fromJson(data);
  }
}