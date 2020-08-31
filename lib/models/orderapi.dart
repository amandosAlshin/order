class MessageOrderApi{
  String type;
  String order;
  String user_hash;
  MessageOrderApi({this.type, this.order, this.user_hash});

  MessageOrderApi.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    order = json['order'];
    user_hash = json['user_hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['order'] = this.order;
    data['user_hash'] = this.user_hash;
    return data;
  }
}