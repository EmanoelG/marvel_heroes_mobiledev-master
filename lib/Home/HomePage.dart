import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_heroes_yt/Models/Comics.dart';
import 'package:marvel_heroes_yt/Page/PageDetalhes.dart';
import 'package:marvel_heroes_yt/utils/nav.dart';
import '../Comics/Controll/ComicsControl.dart';
import '../Models/ComicsNew.dart';
import '../Models/Personagem.dart';
import '../Models/searchdelegate/searchdelegate.dart';
import '../utils/loadingpersonagem.dart';
import 'HomeController.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Size _tela;
  late TabController tabController;
  var descriptionHeroes = '';
  List<Personagem> listPerson = [];
  List<Personagem> listPersonFavoritos = [];
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tela = MediaQuery.of(context).size;

    List<Widget> paginas = [
      _personagens(context, _tela),
      Container(
        color: Colors.green,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Heroes Marvel'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomoSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: paginas,
      ),
      bottomNavigationBar:
          TabBar(controller: tabController, tabs: const <Widget>[
        Tab(
          icon: Icon(
            Icons.home,
            color: Colors.black,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.description,
            color: Colors.black,
          ),
        ),
      ]),
    );
  }

  Widget _personagens(BuildContext context, tela) {
    return Container(
      color: Color.fromARGB(255, 12, 12, 12),
      height: tela.height * .9,
      child: listViewHeroes(),
    );
  }

  listViewHeroes() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: StreamBuilder<List<Personagem>>(
            stream: homeC.outPerson,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingPersonagem();
              } else if (!snapshot.hasData) {
                return Text("Sem dados");
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Personagem perso = snapshot.data![index];

                  return Card(
                    color: Color.fromARGB(255, 250, 250, 250),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                              child: Image.network(
                            "${perso.thumbnail.path}.${perso.thumbnail.extension}",
                            width: 350,
                          )),
                          Text(
                            perso.name,
                            maxLines: 1,
                            style: TextStyle(fontSize: 25),
                          ),
                          ButtonBarTheme(
                            data: ButtonBarTheme.of(context),
                            child: ButtonBar(
                              alignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                TextButton(
                                  // color: Color.fromARGB(255, 2, 2, 2),
                                  onPressed: () => {
                                    comicsC.getComics(perso.id),
                                    push(
                                        context,
                                        PageDetalhes(
                                          id: perso.id,
                                        )),
                                  },
                                  child: const Text(
                                    'Detalhes ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(236, 10, 10, 10),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    listPersonFavoritos.add(perso);
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}
