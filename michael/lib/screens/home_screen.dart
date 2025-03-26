import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/product_card.dart';
import '../widgets/floating_action_button.dart';
import '../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 20),
              const Text(
                "Available Products",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const ProductCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
