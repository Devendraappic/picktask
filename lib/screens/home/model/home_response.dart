class HomePageResponse {
  bool? status;
  String? msg;
  Data? data;

  HomePageResponse({this.status, this.msg, this.data});

  HomePageResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? earning;
  String? name;
  List<Topbaner>? topbaner;
  List<Webinar>? webinar;

  Data({this.earning, this.name, this.topbaner, this.webinar});

  Data.fromJson(Map<String, dynamic> json) {
    earning = json['earning'];
    name = json['name'];
    if (json['topbaner'] != null) {
      topbaner = <Topbaner>[];
      json['topbaner'].forEach((v) {
        topbaner!.add(new Topbaner.fromJson(v));
      });
    }
    if (json['webinar'] != null) {
      webinar = <Webinar>[];
      json['webinar'].forEach((v) {
        webinar!.add(new Webinar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['earning'] = this.earning;
    data['name'] = this.name;
    if (this.topbaner != null) {
      data['topbaner'] = this.topbaner!.map((v) => v.toJson()).toList();
    }
    if (this.webinar != null) {
      data['webinar'] = this.webinar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Topbaner {
  int? id;
  String? bannerPic;
  String? link;

  Topbaner({this.id, this.bannerPic, this.link});

  Topbaner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerPic = json['banner_pic'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['banner_pic'] = this.bannerPic;
    data['link'] = this.link;
    return data;
  }
}

class Webinar {
  int? id;
  String? content;
  String? url;
  String? image;
  String? date;
  String? time;
  String? createdAt;
  String? updatedAt;

  Webinar(
      {this.id,
        this.content,
        this.url,
        this.image,
        this.date,
        this.time,
        this.createdAt,
        this.updatedAt});

  Webinar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    url = json['url'];
    image = json['image'];
    date = json['date'];
    time = json['time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['url'] = this.url;
    data['image'] = this.image;
    data['date'] = this.date;
    data['time'] = this.time;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
