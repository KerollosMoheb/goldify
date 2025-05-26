part of 'gold_cubit.dart';

@immutable
sealed class GoldState {}

final class GoldInitial extends GoldState {}

class GoldLoading extends GoldState {}

class GoldSuccess extends GoldState {
  final GoldPrice goldPrice;

  GoldSuccess(this.goldPrice);
}

class GoldError extends GoldState {
  final String message;

  GoldError(this.message);
}
