class Hotel {
  final String id;
  final String name;

  const Hotel._(this.id, this.name);

  factory Hotel.fromJson(Map json) {
    final id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final name = json['name'];
    return Hotel._(id, name);
  }
}