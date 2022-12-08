import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_heroes_yt/Comics/Controll/ComicsControl.dart';
import 'package:marvel_heroes_yt/Models/ComicsNew.dart';

import 'package:marvel_heroes_yt/Models/Personagem.dart';

import '../utils/loadingpersonagem.dart';

class PageDetalhes extends StatelessWidget {
  int id;
  PageDetalhes({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Container(
        child: StreamBuilder<List<ComicsNew>>(
          stream: comicsC.outComics,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingPersonagem();
            } else if (!snapshot.hasData) {
              return Text("Sem dados");
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ComicsNew perso = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        Card(
                          color: Color.fromARGB(255, 0, 0, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Image.network(
                                    "${perso.thumbnail.path}.${perso.thumbnail.extension}",
                                    width: 350,
                                  ),
                                ),
                                Text(
                                  perso.description,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            perso.description,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
