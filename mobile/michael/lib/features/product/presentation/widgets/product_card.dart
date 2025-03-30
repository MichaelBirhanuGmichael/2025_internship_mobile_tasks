import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/routes.dart';

class ProductCard extends StatelessWidget {
  final VoidCallback? onTap;

  const ProductCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.productDetails,
          arguments: {
            'imageUrl': 'assets/images/product_image.png',
            'category': "Men’s shoe",
            'title': "Derby Leather Shoes",
            'rating': 4.0,
            'price': 120.0,
            'description': 
              "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, "
              "where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature "
              "provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes "
              "are typically made of high-quality leather, known for its durability and elegance, making them suitable "
              "for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes "
              "are a staple in any well-rounded wardrobe.",
            'sizes': [40, 41, 42, 43, 44],
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/product_image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Derby Leather Shoes",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Men’s shoe",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const Text(
                    "\$120",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.ratingStar, size: 16),
                  const Text(
                    " (4.0)",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
