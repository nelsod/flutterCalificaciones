import 'dart:convert';

import 'package:calificaciones/src/models/login_model.dart';
import 'package:calificaciones/src/utils/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show required;

class AuthLogin {
  String _url = 'https://server.developers.ec/cronos.demo/LoginAPI';

  Future<bool> loginVerificar(
      {@required String username,
      @required String password,
      BuildContext context}) async {
    final url = _url + '/login/$username/$password';

    try {
      final resp = await http.get(url);

      final decodedData = jsonDecode(resp.body);

      final isValid = decodedData;

      if (isValid is bool) {
        throw PlatformException(
            code: '500', message: 'Credenciales Incorrectas. Intente Otra Vez');
      } else {
        var listDecoded = [];

        decodedData.forEach((k, v) => listDecoded.add(decodedData));

        final usuario = new Usuarios.fromJsonList(listDecoded);

        return true;
      }
    } on PlatformException catch (error) {
      Dialogs.alert(
        context,
        title: 'Error',
        message: error.message,
      );
      return false;
    }
  }
}
