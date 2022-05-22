class Motive {
  Motive({
    String? uuid,
    String? category,
    int? order,
    String? icon,
    String? local,
    String? title,
    String? subtitle,
    int? red,
    int? green,
    int? blue,
  }) {
    _uuid = uuid;
    _category = category;
    _order = order;
    _icon = icon;
    _local = local;
    _title = title;
    _subtitle = subtitle;
    _red = red;
    _green = green;
    _blue = blue;
  }

  Motive.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _category = json['category'];
    _order = json['order'];
    _icon = json['icon'];
    _local = json['local'];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _red = json['red'];
    _green = json['green'];
    _blue = json['blue'];
  }

  String? _uuid;
  String? _category;
  int? _order;
  String? _icon;
  String? _local;
  String? _title;
  String? _subtitle;
  int? _red;
  int? _green;
  int? _blue;

  Motive copyWith({
    String? uuid,
    String? category,
    int? order,
    String? icon,
    String? local,
    String? title,
    String? subtitle,
    int? red,
    int? green,
    int? blue,
  }) =>
      Motive(
        uuid: uuid ?? _uuid,
        category: category ?? _category,
        order: order ?? _order,
        icon: icon ?? _icon,
        local: local ?? _local,
        title: title ?? _title,
        subtitle: subtitle ?? _subtitle,
        red: red ?? _red,
        green: green ?? _green,
        blue: blue ?? _blue,
      );

  String? get uuid => _uuid;
  String? get category => _category;
  int? get order => _order;
  String? get icon => _icon;
  String? get local => _local;
  String? get title => _title;
  String? get subtitle => _subtitle;
  int? get red => _red;
  int? get green => _green;
  int? get blue => _blue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['category'] = _category;
    map['order'] = _order;
    map['icon'] = _icon;
    map['local'] = _local;
    map['title'] = _title;
    map['subtitle'] = _subtitle;
    map['red'] = _red;
    map['green'] = _green;
    map['blue'] = _blue;
    return map;
  }
}
