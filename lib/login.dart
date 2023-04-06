// ignore: file_names
// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class Api {

  //faltan los otros metodos, solo usaremos el package http.

  static Future httpGet(String path) async {
  }

  static Future HttpGetForm(String path, Map<String, String> data) async {

    var body = jsonEncode(data); //IMPORTANTE: Convertir a JSON

    try {
      var url = Uri.http('localhost:5001','/usuarios/validar'); //Guardamos la url en una variable, usando Uri.http (ajuro jeje)
      var response = await http.post(url, body: body, headers: {  //Hacemos la peticion POST con la url, el body y los headers
        HttpHeaders.contentTypeHeader: "application/json", //IMPORTANTE: Agregar el header con el tipo de contenido (en este caso JSON)
      });                                               //si no se agrega, el servidor no sabe que tipo de contenido se esta enviando
      return response.statusCode; //Retornamos el codigo de respuesta (200 = OK / 400 = Bad Request)
    } catch (e) {
      throw ('Error en el GET');
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
  }

  static Future put(String path, Map<String, dynamic> data) async {
  }

  static Future delete(String path, Map<String, dynamic> data) async {
  }
}
