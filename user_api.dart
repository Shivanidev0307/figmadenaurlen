import 'package:http/http.dart' as http;

Future<void> registerUser(String name, String username) async {
  final url = Uri.parse('mongodb://localhost:27017'); 

  final response = await http.post(
    url,
    body: {
      'name': name,
      'username': username,
    },
  );

  if (response.statusCode == 200) {
    // User registration successful
    print('User registered successfully');
  } else {
    // Handle errors
    print('User registration failed. Error: ${response.body}');
  }
}
