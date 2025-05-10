import 'dart:convert';

import 'package:flutter_for_beginners/qoute/quote.dart';
import 'package:http/http.dart' as http;

Future<List<Quote>> fetchQuote() async {
  final response =
      await http.get(Uri.parse("https://api.api-ninjas.com/v1/quotes") ,


        headers: {
          'X-Api-Key': 'XFmV4v4U1ktQnBpRFCdAVQ==FdCctGF9LNng7h5C'
        },
      );

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);

    return data.map((json) => Quote.fromJson(json)).toList();
  }

  throw Exception("Failed to load data") ;

}
