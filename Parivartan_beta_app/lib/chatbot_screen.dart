import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dashboard_screen.dart';
import 'main.dart';

class _ChatbotScreenState extends State<ChatbotScreen> {
  List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();

  // Function to call a basic AI Chatbot API
  Future<String> _getChatbotResponse(String userMessage) async {
    // Replace this URL with the actual API endpoint you're using
    final response = await http.post(
      Uri.parse('https://api.chatbot.com/free-endpoint'), // Use the actual API endpoint here
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer YOUR_API_KEY', // Uncomment if an API key is needed
      },
      body: json.encode({
        'message': userMessage,
      }),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      // Assume the response has a field `responseText`
      return data['responseText'] ?? "Sorry, I don't understand.";
    } else {
      return "Error communicating with AI.";
    }
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({"sender": "user", "text": _controller.text});
      });

      // Get the AI response
      String botResponse = await _getChatbotResponse(_controller.text);

      setState(() {
        messages.add({"sender": "bot", "text": botResponse});
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: messages[index]['sender'] == 'user'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: messages[index]['sender'] == 'user'
                          ? Colors.blueAccent
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      messages[index]['text']!,
                      style: TextStyle(
                        color: messages[index]['sender'] == 'user'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: 'Type a message...'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
