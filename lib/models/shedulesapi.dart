class ShedulesApi {
  List<Schedules> schedules;
  Schedules today;

  ShedulesApi({this.schedules, this.today});

  ShedulesApi.fromJson(Map<String, dynamic> json) {
    if (json['schedules'] != null) {
      schedules = new List<Schedules>();
      json['schedules'].forEach((v) {
        schedules.add(new Schedules.fromJson(v));
      });
    }
    today =
    json['today'] != null ? new Schedules.fromJson(json['today']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schedules != null) {
      data['schedules'] = this.schedules.map((v) => v.toJson()).toList();
    }
    if (this.today != null) {
      data['today'] = this.today.toJson();
    }
    return data;
  }
}

class Schedules {
  String name;
  String shedule;
  String startTime;
  String endTime;

  Schedules({this.name, this.shedule, this.startTime, this.endTime});

  Schedules.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shedule = json['shedule'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shedule'] = this.shedule;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}