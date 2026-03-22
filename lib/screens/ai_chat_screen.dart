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
  void initState() {
    super.initState();
    _geminiService = GeminiService();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty || _isLoading) return;

    final userMessage = ChatMessage(
      text: text,
      time: DateFormat('hh:mm a').format(DateTime.now()),
      isUser: true,
    );

    setState(() {
      _messages.add(userMessage);
      _isLoading = true;
    });

    _messageController.clear();
    _scrollToBottom();

    try {
      final aiResponse = await _geminiService.sendMessage(text);

      setState(() {
        _messages.add(
          ChatMessage(
            text: aiResponse,
            time: DateFormat('hh:mm a').format(DateTime.now()),
            isUser: false,
          ),
        );
        _isLoading = false;
      });
      _scrollToBottom();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

@override
  Widget build(BuildContext context) {
    final dark = isDarkMode(context);
    final bgColor = dark ? AppColors.darkBackground : Colors.white;
    final appBarBg = dark ? AppColors.darkBackground : Colors.white;

    return Scaffold(
        darkBackgroundColor: bgColor,
        appBar: AppBar(backgroundColor: appBarBg,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: dark ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            // Bot avatar
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.smart_toy, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Roadside AI Assistant',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: dark ? Colors.white : Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Online',
                      style: TextStyle(
                        fontSize: 12,
                        color: dark ? Colors.green[300] : Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: dark ? Colors.white : Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],),
            );
  }