import 'package:flutter/material.dart';
import '../../features/product/presentation/screens/home_screen.dart';
import '../../features/product/presentation/screens/add_update_screen.dart';
import '../../features/product/presentation/screens/details_screen.dart';
import '../../features/product/presentation/screens/search_page.dart';

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
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            imageUrl: args['imageUrl'],
            category: args['category'],
            title: args['title'],
            rating: args['rating'],
            price: args['price'],
            description: args['description'],
            sizes: args['sizes'],
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
