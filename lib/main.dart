import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_provider.dart';
import 'chat_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatProvider(),
      child: MaterialApp(
        title: 'FlutterGPT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        home: ChatPage(),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('FlutterGPT')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.messages.length,
              itemBuilder: (context, index) {
                final msg = provider.messages[index];
                return Container(
                  alignment: msg.isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: msg.isUser ? Colors.blue[100] : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Text(msg.text),
                  ),
                );
              },
            ),
          ),
          if (provider.isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final text = _controller.text.trim();
                    if (text.isNotEmpty) {
                      provider.sendMessage(text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
