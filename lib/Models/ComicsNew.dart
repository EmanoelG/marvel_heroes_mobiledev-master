import 'Creators.dart';
import 'Events.dart';
import 'Series.dart';
import 'Stories.dart';
import 'Thumbnail.dart';

class ComicsNew {
  late int id;
  late int digitalId;
  late String title;
  late int issueNumber;
  late String variantDescription;
  late String description;
  late String modified;
  late String isbn;
  late String upc;
  late String diamondCode;
  late String ean;
  late String issn;
  late String format;
  late int pageCount;
  late List<String> textObjects;
  late String resourceURI;
  late List<String> urls;
  late Series series;
  late List<Null> variants;
  late List<Null> collections;
  late List<Null> collectedIssues;
  late List<String> dates;
  late List<String> prices;
  late Thumbnail thumbnail;
  late List<Null> images;
  late Creators creators;
  late Map<String, dynamic> characters;

  late Events events;

  ComicsNew(
      {required this.id,
      required this.digitalId,
      required this.title,
      required this.issueNumber,
      required this.variantDescription,
      required this.description,
      required this.modified,
      required this.isbn,
      required this.upc,
      required this.diamondCode,
      required this.ean,
      required this.issn,
      required this.format,
      required this.pageCount,
      required this.textObjects,
      required this.resourceURI,
      required this.urls,
      required this.series,
      required this.variants,
      required this.collections,
      required this.collectedIssues,
      required this.dates,
      required this.prices,
      required this.thumbnail,
      required this.images,
      required this.creators,
      required this.characters,
      required this.events});

  ComicsNew.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'];
    variantDescription = json['variantDescription'] ?? "Sem descrição ";
    description = json['description'] ?? "Sem descrição ";
    modified = json['modified'];
    isbn = json['isbn'];
    upc = json['upc'];
    diamondCode = json['diamondCode'];
    ean = json['ean'];
    issn = json['issn'];
    format = json['format'];
    pageCount = json['pageCount'];
    resourceURI = json['resourceURI'];
    series = (json['series'] != null ? Series.fromJson(json['series']) : null)!;
    thumbnail = (json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null)!;

    creators = (json['creators'] != null
        ? Creators.fromJson(json['creators'])
        : null)!;
    characters = json['characters'] ?? null;

    description = description.replaceAll("<p>", "");
    description = description.replaceAll("</p>", "");
    description = description.replaceAll("<br>", "");
    description = description.replaceAll("</br>", "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['digitalId'] = this.digitalId;
    data['title'] = this.title;
    data['issueNumber'] = this.issueNumber;
    data['variantDescription'] = this.variantDescription;
    data['description'] = this.description;
    data['modified'] = this.modified;
    data['isbn'] = this.isbn;
    data['upc'] = this.upc;
    data['diamondCode'] = this.diamondCode;
    data['ean'] = this.ean;
    data['issn'] = this.issn;
    data['format'] = this.format;
    data['pageCount'] = this.pageCount;

    data['resourceURI'] = this.resourceURI;

    if (this.series != null) {
      data['series'] = this.series.toJson();
    }

    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail.toJson();
    }

    if (this.creators != null) {
      data['creators'] = this.creators.toJson();
    }
    if (this.characters != null) {
      data['characters'] = this.characters;
    }

    if (this.events != null) {
      data['events'] = this.events.toJson();
    }
    return data;
  }
}
