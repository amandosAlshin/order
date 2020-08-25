class BranchsApi {
  List<Branchs> branchs;

  BranchsApi({this.branchs});

  BranchsApi.fromJson(Map<String, dynamic> json) {
    if (json['branchs'] != null) {
      branchs = new List<Branchs>();
      json['branchs'].forEach((v) {
        branchs.add(new Branchs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.branchs != null) {
      data['branchs'] = this.branchs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Branchs {
  int id;
  int companyId;
  String name;
  String adress;
  int state;
  String city;
  String waiting;

  Branchs(
      {this.id, this.companyId, this.name, this.adress, this.state, this.city, this.waiting});

  Branchs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    name = json['name'];
    adress = json['adress'];
    state = json['state'];
    city = json['city'];
    waiting = json['waiting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['name'] = this.name;
    data['adress'] = this.adress;
    data['state'] = this.state;
    data['city'] = this.city;
    data['waiting'] = this.waiting;
    return data;
  }
}