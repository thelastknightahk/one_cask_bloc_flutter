import 'dart:convert';

import 'package:clevit_flutter_bloc/domain/entities/liquor.dart';

class LiquorModel {
  final String id;
  final String bottleNumber;
  final String name;
  final String brand;
  final int? age;
  final bool isOpened;
  final String? collection;
  final ImageModel? image;
  final DetailsModel? details;
  final TastingNotesModel? tastingNotes;
  final UserNotesModel? userNotes;
  final List<HistoryModel> history;

  LiquorModel({
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

  factory LiquorModel.fromJson(Map<String, dynamic> json) {
    final bottle = json['bottle'] ?? {};
    return LiquorModel(
      id: bottle['id'] ?? '',
      bottleNumber: bottle['bottleNumber'] ?? '',
      name: bottle['name'] ?? '',
      brand: bottle['brand'] ?? '',
      age: bottle['age'],
      isOpened: bottle['isOpened'] ?? false,
      collection: bottle['collection'],
      image:
          bottle['image'] != null ? ImageModel.fromJson(bottle['image']) : null,
      details:
          bottle['details'] != null
              ? DetailsModel.fromJson(bottle['details'])
              : null,
      tastingNotes:
          bottle['tastingNotes'] != null
              ? TastingNotesModel.fromJson(bottle['tastingNotes'])
              : null,
      userNotes:
          bottle['userNotes'] != null
              ? UserNotesModel.fromJson(bottle['userNotes'])
              : null,
      history:
          (bottle['history'] as List? ?? [])
              .map((e) => HistoryModel.fromJson(e))
              .toList(),
    );
  }

  Liquor toEntity() {
    return Liquor(
      id: id,
      bottleNumber: bottleNumber,
      name: name,
      brand: brand,
      age: age,
      isOpened: isOpened,
      collection: collection,
      image:
          image != null ? LiquorImage(url: image!.url, alt: image!.alt) : null,
      details:
          details != null
              ? LiquorDetails(
                distillery: details!.distillery,
                region: details!.region,
                country: details!.country,
                type: details!.type,
                ageStatement: details!.ageStatement,
                filled: details!.filled,
                bottled: details!.bottled,
                caskNumber: details!.caskNumber,
                abv: details!.abv,
                size: details!.size,
                finish: details!.finish,
              )
              : null,
      tastingNotes:
          tastingNotes != null
              ? TastingNotes(
                author: tastingNotes!.author,
                videoUrl: tastingNotes!.videoUrl,
                nose: tastingNotes!.nose.descriptions,
                palate: tastingNotes!.palate.descriptions,
                finish: tastingNotes!.finish.descriptions,
              )
              : null,
      userNotes:
          userNotes != null
              ? TastingNotes(
                author: null,
                videoUrl: null,
                nose: userNotes!.nose.descriptions,
                palate: userNotes!.palate.descriptions,
                finish: userNotes!.finish.descriptions,
              )
              : null,
      history:
          history
              .map(
                (e) => LiquorHistory(
                  id: e.id,
                  date: e.date,
                  event: e.event,
                  description: e.description,
                  location: e.location,
                  caskType: e.caskType,
                  caskNumber: e.caskNumber,
                  responsible: e.responsible,
                  notes: e.notes,
                ),
              )
              .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'bottleNumber': bottleNumber,
      'name': name,
      'brand': brand,
      'age': age,
      'isOpened': isOpened ? 1 : 0,
      'collection': collection,
      'imageUrl': image?.url,
      'imageAlt': image?.alt,
      'distillery': details?.distillery,
      'region': details?.region,
      'country': details?.country,
      'type': details?.type,
      'ageStatement': details?.ageStatement,
      'filled': details?.filled,
      'bottled': details?.bottled,
      'caskNumber': details?.caskNumber,
      'abv': details?.abv,
      'size': details?.size,
      'finish': details?.finish,
      'tastingNose': tastingNotes?.nose.descriptions.join('||'),
      'tastingPalate': tastingNotes?.palate.descriptions.join('||'),
      'tastingFinish': tastingNotes?.finish.descriptions.join('||'),
      'userNose': userNotes?.nose.descriptions.join('||'),
      'userPalate': userNotes?.palate.descriptions.join('||'),
      'userFinish': userNotes?.finish.descriptions.join('||'),
      'historyJson': jsonEncode(history),  
      'tastingAuthor': tastingNotes?.author,
      'videoUrl': tastingNotes?.videoUrl,
    };
  }

  factory LiquorModel.fromMap(Map<String, dynamic> map) {
    return LiquorModel(
      id: map['id'],
      bottleNumber: map['bottleNumber'] ?? '',
      name: map['name'] ?? '',
      brand: map['brand'] ?? '',
      age: map['age'],
      isOpened: map['isOpened'] == 1,
      collection: map['collection'],
      image: ImageModel(url: map['imageUrl'], alt: map['imageAlt']),
      details: DetailsModel(
        distillery: map['distillery'],
        region: map['region'],
        country: map['country'],
        type: map['type'],
        ageStatement: map['ageStatement'],
        filled: map['filled'],
        bottled: map['bottled'],
        caskNumber: map['caskNumber'],
        abv: (map['abv'] is num) ? map['abv']?.toDouble() : null,
        size: map['size'],
        finish: map['finish'],
      ),
      tastingNotes: TastingNotesModel(
        author: map['tastingAuthor'] ?? '',
        videoUrl: map['videoUrl'] ?? '',
        nose: NotesModel(
          descriptions: (map['tastingNose'] as String?)?.split('||') ?? [],
        ),
        palate: NotesModel(
          descriptions: (map['tastingPalate'] as String?)?.split('||') ?? [],
        ),
        finish: NotesModel(
          descriptions: (map['tastingFinish'] as String?)?.split('||') ?? [],
        ),
      ),
      userNotes: UserNotesModel(
        nose: NotesModel(
          descriptions: (map['userNose'] as String?)?.split('||') ?? [],
        ),
        palate: NotesModel(
          descriptions: (map['userPalate'] as String?)?.split('||') ?? [],
        ),
        finish: NotesModel(
          descriptions: (map['userFinish'] as String?)?.split('||') ?? [],
        ),
      ),
      history:
          (jsonDecode(map['historyJson']) as List<dynamic>)
              .map((e) => HistoryModel.fromJson(e))
              .toList(),
    );
  }
}

class ImageModel {
  final String? url;
  final String? alt;

  ImageModel({this.url, this.alt});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(url: json['url'], alt: json['alt']);
  }
}

class DetailsModel {
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

  DetailsModel({
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

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      distillery: json['distillery'],
      region: json['region'],
      country: json['country'],
      type: json['type'],
      ageStatement: json['ageStatement'],
      filled: json['filled'],
      bottled: json['bottled'],
      caskNumber: json['caskNumber'],
      abv: (json['abv'] is num) ? (json['abv'] as num).toDouble() : null,
      size: json['size'],
      finish: json['finish'],
    );
  }
}

class TastingNotesModel {
  final NotesModel nose;
  final NotesModel palate;
  final NotesModel finish;
  final String? author;
  final String? videoUrl;

  TastingNotesModel({
    required this.nose,
    required this.palate,
    required this.finish,
    this.author,
    this.videoUrl,
  });

  factory TastingNotesModel.fromJson(Map<String, dynamic> json) {
    return TastingNotesModel(
      author: json['author'],
      videoUrl: json['videoUrl'],
      nose: NotesModel.fromJson(json['nose']),
      palate: NotesModel.fromJson(json['palate']),
      finish: NotesModel.fromJson(json['finish']),
    );
  }
}

class UserNotesModel {
  final NotesModel nose;
  final NotesModel palate;
  final NotesModel finish;

  UserNotesModel({
    required this.nose,
    required this.palate,
    required this.finish,
  });

  factory UserNotesModel.fromJson(Map<String, dynamic> json) {
    return UserNotesModel(
      nose: NotesModel.fromJson(json['nose']),
      palate: NotesModel.fromJson(json['palate']),
      finish: NotesModel.fromJson(json['finish']),
    );
  }
}

class NotesModel {
  final List<String> descriptions;

  NotesModel({required this.descriptions});

  factory NotesModel.fromJson(Map<String, dynamic> json) {
    return NotesModel(
      descriptions:
          (json['descriptions'] as List<dynamic>? ?? [])
              .map((e) => e.toString())
              .toList(),
    );
  }
}

class HistoryModel {
  final String id;
  final String date;
  final String event;
  final String? description;
  final String? location;
  final String? caskType;
  final String? caskNumber;
  final String? responsible;
  final String? notes;

  HistoryModel({
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'event': event,
      'description': description,
      'location': location,
      'caskType': caskType,
      'caskNumber': caskNumber,
      'responsible': responsible,
      'notes': notes,
    };
  }

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'] ?? '',
      date: json['date'] ?? '',
      event: json['event'] ?? '',
      description: json['description'],
      location: json['location'],
      caskType: json['caskType'],
      caskNumber: json['caskNumber'],
      responsible: json['responsible'],
      notes: json['notes'],
    );
  }
}
