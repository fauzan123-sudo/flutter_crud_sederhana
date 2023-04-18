/// userId : 1
/// id : 1
/// title : "quidem molestiae enim"

class Album {
  Album({
      num? userId, 
      num? id, 
      String? title,}){
    _userId = userId;
    _id = id;
    _title = title;
}

  Album.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
  }
  num? _userId;
  num? _id;
  String? _title;
Album copyWith({  num? userId,
  num? id,
  String? title,
}) => Album(  userId: userId ?? _userId,
  id: id ?? _id,
  title: title ?? _title,
);
  num? get userId => _userId;
  num? get id => _id;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    return map;
  }

}