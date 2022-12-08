import 'Items.dart';

class Series {
  late int available;
  late String collectionURI;
  late List<Items> items;

  Series(
      {required this.available,
      required this.collectionURI,
      required this.items});

  Series.fromJson(Map<String, dynamic> json) {
    available = json['available'] ?? 0;
    collectionURI = json['collectionURI']?? '';
    if (json['items'] != null) {
      List<Items> items = [];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['collectionURI'] = this.collectionURI;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
