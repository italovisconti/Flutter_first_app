// ignore: file_names
// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';

class Api {
  static final Dio _dio = Dio();

  static void configureDio() {
    ///Base url
    _dio.options.baseUrl = 'localhost:5001';
    _dio.options.headers = {
      HttpHeaders.contentTypeHeader: "application/json",
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(
        path,
      );

      return resp.data;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw ('Error en el GET');
    }
  }

  static Future HttpGetForm(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.get(path, data: data);
      print(resp.statusCode);
      return resp.statusCode;
    } catch (e) {
      throw ('Error en el GET');
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.post(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el POST');
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.put(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el PUT');
    }
  }

  static Future delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el delete');
    }
  }
}
