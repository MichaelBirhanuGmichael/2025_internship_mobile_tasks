import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/routes.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Navigate to AddUpdateScreen when clicked
        Navigator.pushNamed(context, AppRoutes.addUpdateProduct);

      },
      backgroundColor: AppColors.primary,
      child: const Icon(Icons.add, size: 32, color: Colors.white),
    );
  }
}
