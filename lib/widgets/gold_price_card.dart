import 'package:flutter/material.dart';

class GoldPriceCard extends StatelessWidget {
  final String label;
  final double price;
  final IconData icon;
  final Color color;

  const GoldPriceCard({
    super.key,
    required this.label,
    required this.price,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, size: 32, color: color),
        title: Text(label, style: const TextStyle(fontSize: 18)),
        trailing: Text(
          '${price.toStringAsFixed(2)} EGP',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
