class MessageOrderApi{
  String type;
  int order;

  MessageOrderApi({this.type, this.order});

  MessageOrderApi.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['order'] = this.order;
    return data;
  }
}