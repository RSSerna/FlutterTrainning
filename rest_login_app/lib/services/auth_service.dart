import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseURL = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyCRUwMIP30kTMTrS4FmX7dqc_FjA7rXrAI';

  final storage = FlutterSecureStorage();

  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {'email': email, 'password': password, 'returnSecureToken':true};

    final url =
        Uri.https(_baseURL, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      // return decodedResp['idToken'];
      await storage.write(key: 'key', value: decodedResp['idToken']);
      return null;
    }
    return decodedResp['error']['message'];
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {'email': email, 'password': password, 'returnSecureToken':true};

    final url = Uri.https(
        _baseURL, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      // return decodedResp['idToken'];
      await storage.write(key: 'key', value: decodedResp['idToken']);
      return null;
    }
    return decodedResp['error']['message'];
  }

  Future logout() async{
    await storage.delete(key: 'key');
  }

  Future<String> readToken() async
  {
    return await storage.read(key: 'key') ?? '';
  }
}
