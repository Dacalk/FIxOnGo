import 'package:flutter/material.dart';
import '../theme_provider.dart';
import '../services/gemini_service.dart';
import 'package:intl/intl.dart';

class ChatMessage {
    final String text;
    final String time;
    final String isUser;
    final String? imagePath;
}

const ChatMessage({
    required this.text,
    required this.time,
    required this.isUser,
    this.imagePath,
})

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late GeminiService _geminiService;
  bool _isLoading = false;

  
  final List<ChatMessage> _messages = [
    ChatMessage(
      text:
          "Hi there. I'm your FixOnGo AI Assistant. How can I help you today?",
      time: DateFormat('hh:mm a').format(DateTime.now()),
      isUser: false,
    ),
  ];

}

@override
  Widget build(BuildContext context) {
    final dark = isDarkMode(context);
    final bgColor = dark ? AppColors.darkBackground : Colors.white;
    final appBarBg = dark ? AppColors.darkBackground : Colors.white;

    return Scaffold(
        darkBackgroundColor: bgColor,
        appBar: AppBar()
            );
  }