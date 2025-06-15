class Liquor {
  final String id;
  final String bottleNumber;
  final String name;
  final String brand;
  final int? age;
  final bool isOpened;
  final String? collection;

  final LiquorImage? image;
  final LiquorDetails? details;
  final TastingNotes? tastingNotes;
  final TastingNotes? userNotes;
  final List<LiquorHistory> history;

  Liquor({
    required this.id,
    required this.bottleNumber,
    required this.name,
    required this.brand,
    this.age,
    required this.isOpened,
    this.collection,
    this.image,
    this.details,
    this.tastingNotes,
    this.userNotes,
    required this.history,
  });
}

class LiquorImage {
  final String? url;
  final String? alt;

  LiquorImage({this.url, this.alt});
}

class LiquorDetails {
  final String? distillery;
  final String? region;
  final String? country;
  final String? type;
  final String? ageStatement;
  final String? filled;
  final String? bottled;
  final String? caskNumber;
  final double? abv;
  final String? size;
  final String? finish;

  LiquorDetails({
    this.distillery,
    this.region,
    this.country,
    this.type,
    this.ageStatement,
    this.filled,
    this.bottled,
    this.caskNumber,
    this.abv,
    this.size,
    this.finish,
  });
}

class TastingNotes {
  final String? author;
  final String? videoUrl;
  final List<String> nose;
  final List<String> palate;
  final List<String> finish;

  TastingNotes({
    this.author,
    this.videoUrl,
    required this.nose,
    required this.palate,
    required this.finish,
  });
}

class LiquorHistory {
  final String id;
  final String date;
  final String event;
  final String? description;
  final String? location;
  final String? caskType;
  final String? caskNumber;
  final String? responsible;
  final String? notes;

  LiquorHistory({
    required this.id,
    required this.date,
    required this.event,
    this.description,
    this.location,
    this.caskType,
    this.caskNumber,
    this.responsible,
    this.notes,
  });
}