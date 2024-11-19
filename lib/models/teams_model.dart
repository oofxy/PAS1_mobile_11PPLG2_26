import 'package:get/get.dart';

class TeamsModel {
  int? id;
  final String idTeam;
  final String strTeam;
  final String strDescriptionEN;
  final String strCountry;
  final String strBadge;
  final String strLogo;
  final String strStadium;
  var isFavorite = false.obs;

  TeamsModel(
      this.idTeam,
      this.strTeam,
      this.strDescriptionEN,
      this.strCountry,
      this.strBadge,
      this.strLogo,
      this.strStadium, {
        this.id,
        bool isFavorite = false,
      }) {
    this.isFavorite.value = isFavorite;
  }

  // toMap method to convert the object into a map
  Map<String, dynamic> toMap() {
    return {
      'idTeam': idTeam,
      'strTeam': strTeam,
      'strDescriptionEN': strDescriptionEN,
      'strCountry': strCountry,
      'strBadge': strBadge,
      'strLogo': strLogo,
      'strStadium': strStadium,
      'isFavorite': isFavorite.value ? 1 : 0,
    };
  }

  // fromMap factory to create a TeamsModel object from a map
  factory TeamsModel.fromMap(Map<String, dynamic> map) {
    return TeamsModel(
      map['idTeam'],
      map['strTeam'],
      map['strDescriptionEN'],
      map['strCountry'],
      map['strBadge'],
      map['strLogo'],
      map['strStadium'],
      id: map['id'],
      isFavorite: map['isFavorite'] == 1,
    );
  }

  factory TeamsModel.fromJson(Map<String, dynamic> json) => TeamsModel(
    json['idTeam'] as String,
    json['strTeam'] as String,
    json['strDescriptionEN'] as String,
    json['strCountry'] as String,
    json['strBadge'] as String,
    json['strLogo'] as String,
    json['strStadium'] as String,
  );

  Map<String, dynamic> toJson() => {
    'idTeam': idTeam,
    'strTeam': strTeam,
    'strDescriptionEN': strDescriptionEN,
    'strCountry': strCountry,
    'strBadge': strBadge,
    'strLogo': strLogo,
    'strStadium': strStadium,
  };
}
