import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[300], // Placeholder image
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "July 14, 2023",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  "Hello, Yohannes",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              margin: const EdgeInsets.only(right: 8), // Space between icons
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300, width: 1.2),
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications_outlined, size: 20),
                onPressed: () {},
                padding: EdgeInsets.zero,
                color: const Color.fromARGB(255, 41, 40, 40),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
