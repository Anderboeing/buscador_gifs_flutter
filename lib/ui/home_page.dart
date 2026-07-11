import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _search;
  int _offset = 0;

  Future<Map?> _getGifs() async {
    http.Response response;
    print("chegou aqui");

    if (_search == null) {
      response = await http.get(
        Uri.parse(
          "https://api.giphy.com/v1/gifs/trending?api_key=7AuYAhMo1VYJl1MxKLrtS5GM7HcpKS9i&limit=20&offset=0&rating=g&bundle=messaging_non_clips",
        ),
      );
    } else {
      response = await http.get(
        Uri.parse(
          "https://api.giphy.com/v1/gifs/search?api_key=7AuYAhMo1VYJl1MxKLrtS5GM7HcpKS9i&q=$_search&limit=20&offset=$_offset&rating=g&lang=en",
        ),
      );
    }

    if (response.statusCode == 200) {
      return json.decode(response.body); // O 'return' é obrigatório aqui
    } else {
      print("Erro do servidor: ${response.statusCode}");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _getGifs()
        .then((map) {
          print("Sucesso: $map");
        })
        .catchError((error) {
          print(
            "Erro na requisição: $error",
          ); // Se houver erro de rede/API, vai aparecer aqui
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
          "https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif",
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Pesquise aqui",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
