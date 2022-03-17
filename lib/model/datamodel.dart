class DataModel {
  int? id;
  String? name;
  String? description;
  int? pack;
  int? position;
  var filesize;
  int? installs;
  int? likes;
  int? comments;
  int? priority;
  String? supportVersion;
  int? price;
  int? timestamp;
  int? nsfw;

  DataModel(
      {this.id,
      this.name,
      this.description,
      this.pack,
      this.position,
      this.filesize,
      this.installs,
      this.likes,
      this.comments,
      this.priority,
      this.supportVersion,
      this.price,
      this.timestamp,
      this.nsfw});

  DataModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pack = json['pack'];
    position = json['position'];
    filesize = json['filesize'];
    installs = json['installs'];
    likes = json['likes'];
    comments = json['comments'];
    priority = json['priority'];
    supportVersion = json['support_version'];
    price = json['price'];
    timestamp = json['timestamp'];
    nsfw = json['nsfw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['pack'] = pack;
    data['position'] = position;
    data['filesize'] = filesize;
    data['installs'] = installs;
    data['likes'] = likes;
    data['comments'] = comments;
    data['priority'] = priority;
    data['support_version'] = supportVersion;
    data['price'] = price;
    data['timestamp'] = timestamp;
    data['nsfw'] = nsfw;
    return data;
  }
}


