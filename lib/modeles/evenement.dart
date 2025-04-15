class Evenement {
  static const String NOM_COLLECTION_EVENEMENT = "details_evenement";

  String? id;
  String _description;
  String _date;
  String _heureDebut;
  String _heureFin;
  bool estFavori;

  Evenement(this.id, this._description, this._date, this._heureDebut,
      this._heureFin, this.estFavori);

  String get description => _description;
  String get date => _date;
  String get heureDebut => _heureDebut;
  String get heureFin => _heureFin;

  set description(String value) => _description = value;
  set date(String value) => _date = value;
  set heureDebut(String value) => _heureDebut = value;
  set heureFin(String value) => _heureFin = value;

  factory Evenement.fromMap(Map<String, dynamic> data, String id) {
    return Evenement(
      id,
      data['description'] ?? '',
      data['date'] ?? '',
      data['heureDebut'] ?? '',
      data['heureFin'] ?? '',
      data['estFavori'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': _description,
      'date': _date,
      'heureDebut': _heureDebut,
      'heureFin': _heureFin,
      'estFavori': estFavori,
    };
  }
}