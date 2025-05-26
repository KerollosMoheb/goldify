import 'package:bloc/bloc.dart';
import 'package:gold_app/models/gold_price.dart';
import 'package:gold_app/repo/gold_repository.dart';
import 'package:meta/meta.dart';

part 'gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GoldRepository repository;

  GoldCubit(this.repository) : super(GoldInitial());

  Future<void> fetchGoldPrices() async {
    emit(GoldLoading());
    try {
      final prices = await repository.getGoldPrices();
      emit(GoldSuccess(prices));
    } catch (e) {
      emit(GoldError('فشل في جلب البيانات'));
    }
  }
}
