import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  static const apiKey = 'API Key';
  static const endpoint = 'API';

  Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': 'command', // or 'command-nightly' if available
          'prompt': message,
          'max_tokens': 100,
          'temperature': 0.7,
        }),
      );

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data['generations'][0]['text'];
        return reply.trim();
      } else {
        throw Exception("Cohere API Error: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
      return "Error: $e";
    }
  }
}
