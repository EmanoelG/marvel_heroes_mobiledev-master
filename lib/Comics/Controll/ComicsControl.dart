import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';

import '../../Helper.dart';
import '../../Models/ComicsNew.dart';
import '../../Models/Personagem.dart';
import '../../Models/searchdelegate/CharacterDataWrapper.dart';

class ComicsController extends BlocBase {
  //BLOC PERSONAGEM
  BehaviorSubject<List<ComicsNew>> blocComics = BehaviorSubject();

  Sink<List<ComicsNew>> get inComics => blocComics.sink;
  Stream<List<ComicsNew>> get outComics => blocComics.stream;
  //FIM BLOC PERSONAGEM

  late List<ComicsNew> listaComics;
  late List<Personagem> listaPersonagem;

  ComicsController() : super(null) {
    listaComics = [];
    //   listaPersonagem = [];
  }

  getComics(int idPersonagem) {
    listaComics = [];
    inComics.add(listaComics);

    String urlFinal = gerarUrl(
        assunto: "characters/$idPersonagem/comics",
        adicional:
            "&limit=5"); //"characters/$idPersonagem/comics", adicional: "&limit=25"
    // print('URL FORMADA PARA BUSCA POR ID : ' + urlFinal);
    http.get(Uri.parse(urlFinal)).then((value) {
      if (value.statusCode.toString() == '200') {
        var comicJson = jsonDecode(value.body)["data"]["results"];
        for (var c in comicJson) {
          ComicsNew comic = ComicsNew.fromJson(c);
          listaComics.add(comic);
        }
        inComics.add(listaComics);
      }
    });
  }

  @override
  void dispose() {
    blocComics.close();
  }
}

ComicsController comicsC = ComicsController();
