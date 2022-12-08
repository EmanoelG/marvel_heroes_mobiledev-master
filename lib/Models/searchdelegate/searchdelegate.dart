import 'package:flutter/material.dart';

import '../../Comics/Controll/ComicsControl.dart';
import '../../Home/HomeController.dart';

class CustomoSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Spider',
    'Captain',
    'Hulk',
    'Iron Man',
    'black Widow'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var heroes in searchTerms) {
      if (heroes.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(heroes);
      }
      ;
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Column(
          children: [
            IconButton(

              color: Color.fromARGB(255, 11, 11, 11),
              onPressed: () => {
                homeC.getPersonByName(query.toString()),
                print(' CLicou  ' + query.toString()),
                //  comicsC.getComics(perso.id),
                // push(
                //     context,
                //     PageDetalhes(
                //       id: perso.id,
                //     )),
              },
              icon: const Icon(Icons.abc),
              
              // child: Text(
              //   result,
              //   style: const TextStyle(
              //       color: Color.fromARGB(237, 243, 243, 243),
              //       fontWeight: FontWeight.bold,
              //       fontSize: 16),
              // ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var heroes in searchTerms) {
      if (heroes.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(heroes);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
