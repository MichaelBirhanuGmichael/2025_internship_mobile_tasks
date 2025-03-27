import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/add_update_screen.dart';
import '../screens/details_screen.dart';
import '../screens/search_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String addUpdateProduct = '/add-update';
  static const String productDetails = '/details';
  static const String search = '/search';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case addUpdateProduct:
        return MaterialPageRoute(builder: (_) => const AddUpdateProductPage());
      case productDetails:
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            imageUrl: (settings.arguments as Map<String, dynamic>?)?['imageUrl'],
            category: (settings.arguments as Map<String, dynamic>?)?['category'],
            title: (settings.arguments as Map<String, dynamic>?)?['title'],
            rating: (settings.arguments as Map<String, dynamic>?)?['rating'],
            price: (settings.arguments as Map<String, dynamic>?)?['price'],
            description: (settings.arguments as Map<String, dynamic>?)?['description'],
            sizes: (settings.arguments as Map<String, dynamic>?)?['sizes'],
          ),
        );
      case search:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}
