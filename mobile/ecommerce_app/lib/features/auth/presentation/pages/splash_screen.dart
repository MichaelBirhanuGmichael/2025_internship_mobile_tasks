import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> 
    with SingleTickerProviderStateMixin {  // Add this mixin
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    
    // Configure animation curve
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    
    // Start the animation
    _controller.forward();
    
    // Start navigation timer
    _navigateToNext();
  }

  @override
  void dispose() {
    _controller.dispose();  // Don't forget to dispose the controller
    super.dispose();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.go('/auth');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(  // Wrap your content with FadeTransition
        opacity: _animation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ECOM',
                style: TextStyle(
                  fontFamily: 'YourFontFamily',
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: Colors.black,
                ),
              ),
              Text(
                'ECOMMERCE APP',
                style: TextStyle(
                  fontFamily: 'YourFontFamily',
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}