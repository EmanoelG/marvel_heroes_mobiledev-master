import 'Comics.dart';
import 'Creators.dart';
import 'Events.dart';
import 'OriginalIssue.dart';
import 'Personagem.dart';
import 'Series.dart';
import 'Thumbnail.dart';

class Stories {
  late int id;
  late String title;
  late String description;
  late String resourceURI;
  late String type;
  late String modified;
  late Thumbnail thumbnail;
  late Creators creators;
  late Personagem personagem;
  late Series series;
  late Comics comics;
  late Events events;
  late OriginalIssue originalIssue;

  Stories(
      {required this.id,
      required this.title,
      required this.description,
      required this.resourceURI,
      required this.type,
      required this.modified,
      required this.thumbnail,
      required this.creators,
      required this.personagem,
      required this.series,
      required this.comics,
      required this.events,
      required this.originalIssue});

  Stories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    type = json['type'];
    modified = json['modified'];
    thumbnail = (json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null)!;
    creators = (json['creators'] != null
        ? new Creators.fromJson(json['creators'])
        : null)!;
    personagem = (json['personagem'] != null
        ? new Personagem.fromJson(json['personagem'])
        : null)!;
    series =
        (json['series'] != null ? new Series.fromJson(json['series']) : null)!;
    comics =
        (json['comics'] != null ? new Comics.fromJson(json['comics']) : null)!;
    events =
        (json['events'] != null ? new Events.fromJson(json['events']) : null)!;
    originalIssue = (json['originalIssue'] != null
        ? new OriginalIssue.fromJson(json['originalIssue'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['resourceURI'] = this.resourceURI;
    data['type'] = this.type;
    data['modified'] = this.modified;
    data['thumbnail'] = this.thumbnail;
    if (this.creators != null) {
      data['creators'] = this.creators.toJson();
    }
    if (this.personagem != null) {
      data['personagem'] = this.personagem.toJson();
    }
    if (this.series != null) {
      data['series'] = this.series.toJson();
    }
    if (this.comics != null) {
      data['comics'] = this.comics.toJson();
    }
    if (this.events != null) {
      data['events'] = this.events.toJson();
    }
    if (this.originalIssue != null) {
      data['originalIssue'] = this.originalIssue.toJson();
    }
    return data;
  }
}
