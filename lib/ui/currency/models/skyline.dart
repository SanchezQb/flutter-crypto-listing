class Skyline {
  String currency;
  List<String> timestamps;
  List<String> prices;

  Skyline({this.currency, this.timestamps, this.prices});

  Skyline.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    timestamps = json['timestamps'].cast<String>();
    prices = json['prices'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['timestamps'] = this.timestamps;
    data['prices'] = this.prices;
    return data;
  }
}
