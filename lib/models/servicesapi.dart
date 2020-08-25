class ServicesApi {
  List<Services> services;

  ServicesApi({this.services});

  ServicesApi.fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = new List<Services>();
      json['services'].forEach((v) {
        services.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  int queueId;
  int parentId;
  String workName;

  Services({this.queueId, this.parentId, this.workName});

  Services.fromJson(Map<String, dynamic> json) {
    queueId = json['queueId'];
    parentId = json['parentId'];
    workName = json['workName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['queueId'] = this.queueId;
    data['parentId'] = this.parentId;
    data['workName'] = this.workName;
    return data;
  }
}

