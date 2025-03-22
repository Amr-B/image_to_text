// ignore_for_file: unused_field
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class GeminiService {
  final String _baseURL =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent";
  final String _apiKey = "AIzaSyBEtqotKItiBUtr_FQutVs34svH1K73EzY";

  Future<String> analyzeImage(File image) async {
    // Prepare image
    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);

    final response = await http.post(
      Uri.parse("$_baseURL?key=$_apiKey"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "inlineData": {"mimeType": "image/jpeg", "data": base64Image}
              },
              {
                "text":
                    "Describe this image in detail, in arabic and english languages both."
              }
            ]
          }
        ]
      }),
    );

    // Check response status
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["candidates"]?[0]["content"]["parts"]?[0]["text"] ??
          "No description received.";
    }

    throw Exception("Failed to analyze image: ${response.body}");
  }
}
