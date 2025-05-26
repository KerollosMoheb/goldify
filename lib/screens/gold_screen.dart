import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold_app/cubit/gold_cubit/gold_cubit.dart';
import 'package:gold_app/widgets/gold_price_card.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أسعار الذهب اليوم'),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<GoldCubit, GoldState>(
        builder: (context, state) {
          if (state is GoldLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GoldSuccess) {
            final gold = state.goldPrice;
            return RefreshIndicator(
              onRefresh: () => context.read<GoldCubit>().fetchGoldPrices(),
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  GoldPriceCard(
                    label: 'عيار 21',
                    price: gold.price21,
                    icon: Icons.star,
                    color: Colors.amber,
                  ),
                  GoldPriceCard(
                    label: 'عيار 18',
                    price: gold.price18,
                    icon: Icons.circle,
                    color: Colors.orange,
                  ),
                  GoldPriceCard(
                    label: 'الجنيه الذهب',
                    price: gold.coin,
                    icon: Icons.monetization_on,
                    color: Colors.deepOrange,
                  ),
                  GoldPriceCard(
                    label: 'سبيكة 100 جرام',
                    price: gold.bar100g,
                    icon: Icons.scale,
                    color: Colors.brown,
                  ),
                ],
              ),
            );
          } else if (state is GoldError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<GoldCubit>().fetchGoldPrices(),
        backgroundColor: Colors.amber[700],
        child: const Icon(Icons.refresh, color: Colors.brown),
      ),
    );
  }
}
