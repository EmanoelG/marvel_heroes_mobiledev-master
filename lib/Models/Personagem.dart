import 'Comics.dart';
import 'Thumbnail.dart';

class Personagem {
 late int id;
 late String name;
 late String description;
 late String modified;
 late Thumbnail thumbnail;
 late String resourceURI;
 late Comics comics;
 late bool clicked = false;

  Personagem(
      {required this.id,
     required this.name,
    required  this.description,
     required this.modified,
     required this.thumbnail,
     required this.resourceURI,
     required this.comics});

  Personagem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = (json['thumbnail'] != null
        ?  Thumbnail.fromJson(json['thumbnail'])
        : null)!;
    resourceURI = json['resourceURI'];
    comics =
        (json['comics'] != null ?  Comics.fromJson(json['comics']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['modified'] = this.modified;
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }
    data['resourceURI'] = this.resourceURI;
    if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
    return data;
  }
}
