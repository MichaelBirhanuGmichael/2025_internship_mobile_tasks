import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My status'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _StatusItem(name: 'Adli'),
                _StatusItem(name: 'Marina'),
                _StatusItem(name: 'Dean'),
                _StatusItem(name: 'Max'),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView(
              children: const [
                _ChatItem(
                  name: 'Alex Linderson',
                  time: '2 min ago',
                  message: 'How are you today?',
                  unreadCount: 3,
                ),
                _ChatItem(
                  name: 'Team Align',
                  time: '2 min ago',
                  message: 'Don\'t miss to attend the meeting.',
                  unreadCount: 4,
                ),
                _ChatItem(
                  name: 'John Abraham',
                  time: '2 min ago',
                  message: 'Hey! Can you join the meeting?',
                ),
                _ChatItem(
                  name: 'Sabila Sayma',
                  time: '2 min ago',
                  message: 'How are you today?',
                ),
                _ChatItem(
                  name: 'John Borino',
                  time: '2 min ago',
                  message: 'Have a good day 😊',
                ),
                _ChatItem(
                  name: 'Angel Dayna',
                  time: '2 min ago',
                  message: 'How are you today?',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final String name;

  const _StatusItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Text(
                name.substring(0, 1),
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(name),
        ],
      ),
    );
  }
}

class _ChatItem extends StatelessWidget {
  final String name;
  final String time;
  final String message;
  final int? unreadCount;

  const _ChatItem({
    required this.name,
    required this.time,
    required this.message,
    this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Text(
          name.substring(0, 1),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      title: Row(
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              message,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          if (unreadCount != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ],
      ),
      onTap: () {
        context.go('/chat/${Uri.encodeComponent(name)}');
      },
    );
  }
}
