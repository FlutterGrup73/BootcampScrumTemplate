class Comment {
  Comment({
    String? uuid,
    String? comment,
    String? motive,
    String? local,
    String? url,
  }) {
    _uuid = uuid;
    _comment = comment;
    _motive = motive;
    _local = local;
    _url = url;
  }

  Comment.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _comment = json['comment'];
    _motive = json['motive'];
    _local = json['local'];
    _url = json['url'];
  }
  String? _uuid;
  String? _comment;
  String? _motive;
  String? _local;
  String? _url;
  Comment copyWith({
    String? uuid,
    String? comment,
    String? motive,
    String? local,
    String? url,
  }) =>
      Comment(
        uuid: uuid ?? _uuid,
        comment: comment ?? _comment,
        motive: motive ?? _motive,
        local: local ?? _local,
        url: url ?? _url,
      );
  String? get uuid => _uuid;
  String? get comment => _comment;
  String? get motive => _motive;
  String? get local => _local;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['comment'] = _comment;
    map['motive'] = _motive;
    map['local'] = _local;
    map['url'] = _url;
    return map;
  }
}
