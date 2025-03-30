import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/product_card.dart';
import '../widgets/floating_action_button.dart';
import '../../../../core/utils/colors.dart';
import 'search_page.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Available Products",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // Custom Search Button matching Figma design
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 44, // Match Figma dimensions
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          8,
                        ), // Adjust corner radius to match Figma
                        border: Border.all(
                          color:
                              Colors.grey.shade300, // Match Figma border color
                          width: 1.5, // Match Figma border thickness
                        ),
                      ),
                      padding: const EdgeInsets.all(10), // Inner padding
                      child: Image.asset(
                        'assets/icons/search.png', // Your custom search icon
                        fit: BoxFit.contain,
                        color: Colors.grey.shade300, // Match Figma icon color
                      ),
                    ),
                  ),
                ],
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
