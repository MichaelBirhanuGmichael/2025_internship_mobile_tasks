import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  final String chatName;
  final bool isGroup;

  const ChatScreen({
    super.key,
    required this.chatName,
    this.isGroup = false,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      sender: 'Annei Ellison',
      text: 'Have a great working week!!',
      time: '09:25 AM',
      isMe: false,
    ),
    ChatMessage(
      sender: 'Annei Ellison',
      text: 'This is my new 3d design',
      time: '09:25 AM',
      isMe: false,
    ),
    ChatMessage(
      text: 'You did your job well',
      time: '09:25 AM',
      isMe: true,
    ),
    ChatMessage(
      sender: 'Annei Ellison',
      text: '00:16',
      time: '09:25 AM',
      isMe: false,
    ),
    ChatMessage(
      text: 'You did your job well',
      time: '09:25 AM',
      isMe: true,
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatName),
            if (widget.isGroup)
              Text(
                '8 members, 5 online',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white70,
                    ),
              ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              reverse: false,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _MessageBubble(
                  message: message,
                  showSender: index == 0 ||
                      _messages[index - 1].sender != message.sender,
                );
              },
            ),
          ),
          _MessageInput(
            controller: _messageController,
            onSend: () {
              if (_messageController.text.trim().isNotEmpty) {
                setState(() {
                  _messages.add(
                    ChatMessage(
                      text: _messageController.text,
                      time: 'Now',
                      isMe: true,
                    ),
                  );
                  _messageController.clear();
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String? sender;
  final String text;
  final String time;
  final bool isMe;

  ChatMessage({
    this.sender,
    required this.text,
    required this.time,
    required this.isMe,
  });
}

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool showSender;

  const _MessageBubble({
    required this.message,
    required this.showSender,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment:
            message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (showSender && !message.isMe && message.sender != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                message.sender!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: message.isMe
                  ? Colors.blue[600]
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.isMe ? Colors.white : Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              message.time,
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[500],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _MessageInput({
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Write your message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
              ),
              onSubmitted: (_) => onSend(),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.blue[600],
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: onSend,
            ),
          ),
        ],
      ),
    );
  }
}