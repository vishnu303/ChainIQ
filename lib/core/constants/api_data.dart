import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey = dotenv.env['API_KEY'] ?? '';
String coindeskApiKey = dotenv.env['API_KEY_COINDESK'] ?? '';
