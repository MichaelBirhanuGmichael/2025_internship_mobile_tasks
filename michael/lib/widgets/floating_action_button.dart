import 'package:flutter/material.dart';
import '../screens/add_update_screen.dart';  // Import your screen
import '../utils/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Navigate to AddUpdateScreen when clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddUpdateProductPage()),
        );
      },
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.add, size: 32, color: Colors.white),
    );
  }
}
