class CompanyApi {
  List<Companies> companies;

  CompanyApi({this.companies});

  CompanyApi.fromJson(Map<String, dynamic> json) {
    if (json['companies'] != null) {
      companies = new List<Companies>();
      json['companies'].forEach((v) {
        companies.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.companies != null) {
      data['companies'] = this.companies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Companies {
  int id;
  String logo;
  int categoryId;
  String name;
  String discription;
  int branchsCount;

  Companies(
      {this.id,
        this.logo,
        this.categoryId,
        this.name,
        this.discription,
        this.branchsCount});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    categoryId = json['categoryId'];
    name = json['name'];
    discription = json['discription'];
    branchsCount = json['branchsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['categoryId'] = this.categoryId;
    data['name'] = this.name;
    data['discription'] = this.discription;
    data['branchsCount'] = this.branchsCount;
    return data;
  }
}