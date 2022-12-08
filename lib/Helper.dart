import 'dart:convert';

import 'package:crypto/crypto.dart';

class Helper {
  static String publicApiKey = "5f0c11ac92a4ef0b7e6349bb173f7ba0";
  static String privateApiKey = "1807d8f9492f74af06a5b1329440ce45aaf80932";
}

var url = "http://gateway.marvel.com/v1/public/";
var timeStamp = DateTime.now();
var hash;

String gerarUrl({String assunto = "characters", String adicional = ""}) {
  gerarHash();
  String urlFinal =
      "$url$assunto?apikey=${Helper.publicApiKey}&hash=$hash&ts=${timeStamp.toIso8601String()}$adicional";
  // print('URL FORMADA' + urlFinal);
  return urlFinal;
}

String gerarUrlByName({String assunto = "characters", String adicional = ""}) {
  gerarHash();
  String urlFinal =
      "$url$assunto&apikey=${Helper.publicApiKey}&hash=$hash&ts=${timeStamp.toIso8601String()}$adicional";
  // print('URL FORMADA' + urlFinal);
  return urlFinal;
}

gerarHash() {
  hash = generateMd5(
      timeStamp.toIso8601String() + Helper.privateApiKey + Helper.publicApiKey);
  print(hash);
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
