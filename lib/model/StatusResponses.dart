class SourcesResponses {
  SourcesResponses({
    String? status,
    List<Source>? sources,
  }) {
    _status = status;
    _sources = sources;
  }

  SourcesResponses.fromJson(dynamic json) {
    _status = json['status'];
    if (json['sources'] != null) {
      _sources = [];
      json['sources'].forEach((v) {
        _sources?.add(Source.fromJson(v));
      });
    }
  }
  String? _status;
  List<Source>? _sources;
  SourcesResponses copyWith({
    String? status,
    List<Source>? sources,
  }) =>
      SourcesResponses(
        status: status ?? _status,
        sources: sources ?? _sources,
      );
  String? get status => _status;
  List<Source>? get sources => _sources;


}

class Source {
  Source({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _url = url;
    _category = category;
    _language = language;
    _country = country;
  }

  Source.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _url = json['url'];
    _category = json['category'];
    _language = json['language'];
    _country = json['country'];
  }
  String? _id;
  String? _name;
  String? _description;
  String? _url;
  String? _category;
  String? _language;
  String? _country;
  Source copyWith({
    String? id,
    String? name,
    String? description,
    String? url,
    String? category,
    String? language,
    String? country,
  }) =>
      Source(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        url: url ?? _url,
        category: category ?? _category,
        language: language ?? _language,
        country: country ?? _country,
      );
  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get url => _url;
  String? get category => _category;
  String? get language => _language;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['url'] = _url;
    map['category'] = _category;
    map['language'] = _language;
    map['country'] = _country;
    return map;
  }
}
