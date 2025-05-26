class GoldPrice {
  final double pricePerGram;
  final double price21;
  final double price18;
  final double coin;
  final double bar100g;

  GoldPrice({
    required this.pricePerGram,
    required this.price21,
    required this.price18,
    required this.coin,
    required this.bar100g,
  });
  factory GoldPrice.fromJson(Map<String, dynamic> json) {
    final pricePerOunce = json['price'];
    final pricePerGram = pricePerOunce / 31.1035;
    return GoldPrice(
      pricePerGram: pricePerGram,
      price21: pricePerGram * 0.875,
      price18: pricePerGram * 0.750,
      coin: pricePerGram * 0.875 * 8,
      bar100g: pricePerGram * 100,
    );
  }
}
