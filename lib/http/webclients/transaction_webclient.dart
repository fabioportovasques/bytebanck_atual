import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 2)); //await não executa as proximas linhas

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    //throw Exception();

    if (response.statusCode ==200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }


    throw HttpException(_getMessage(response.statusCode));
    //throw HttpException(_getMessage(500));

  }

  /*se s cdigos de erros 400,401,409 existirem ele faz a verificacao,
  se não mostra o erro generico desconhecdo
  */


  String _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'Unknown error';

  }



  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction ', //quando enviar alguma transferencia nulla
    401 : 'authentication failed ',  //quando errar a senha
    409: 'transaction always exists ' //Quando ocrrer duas transacoes repetidas
  };

}

class HttpException implements Exception {
  final String message;

  HttpException (this.message); //recebo via construtor
}