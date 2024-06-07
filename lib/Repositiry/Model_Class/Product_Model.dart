
class SalesProductModel {
  List<Data>? data;
  bool? success;
  List<String>? messages;

  SalesProductModel({this.data, this.success, this.messages});

  SalesProductModel.fromJson(Map<String, dynamic> json) {
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["messages"] is List) {
      messages = json["messages"] == null ? null : List<String>.from(json["messages"]);
    }
  }

  static List<SalesProductModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => SalesProductModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["success"] = success;
    if(messages != null) {
      _data["messages"] = messages;
    }
    return _data;
  }

  SalesProductModel copyWith({
    List<Data>? data,
    bool? success,
    List<String>? messages,
  }) => SalesProductModel(
    data: data ?? this.data,
    success: success ?? this.success,
    messages: messages ?? this.messages,
  );
}

class Data {
  int? id;
  int? productId;
  int? unit;
  int? qty;
  String? price;
  String? minimumPrice;
  List<Units>? units;

  Data({this.id, this.productId, this.unit, this.qty, this.price, this.minimumPrice, this.units});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["product_id"] is num) {
      productId = (json["product_id"] as num).toInt();
    }
    if(json["unit"] is num) {
      unit = (json["unit"] as num).toInt();
    }
    if(json["qty"] is num) {
      qty = (json["qty"] as num).toInt();
    }
    if(json["price"] is String) {
      price = json["price"];
    }
    if(json["minimum_price"] is String) {
      minimumPrice = json["minimum_price"];
    }
    if(json["units"] is List) {
      units = json["units"] == null ? null : (json["units"] as List).map((e) => Units.fromJson(e)).toList();
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["product_id"] = productId;
    _data["unit"] = unit;
    _data["qty"] = qty;
    _data["price"] = price;
    _data["minimum_price"] = minimumPrice;
    if(units != null) {
      _data["units"] = units?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  Data copyWith({
    int? id,
    int? productId,
    int? unit,
    int? qty,
    String? price,
    String? minimumPrice,
    List<Units>? units,
  }) => Data(
    id: id ?? this.id,
    productId: productId ?? this.productId,
    unit: unit ?? this.unit,
    qty: qty ?? this.qty,
    price: price ?? this.price,
    minimumPrice: minimumPrice ?? this.minimumPrice,
    units: units ?? this.units,
  );
}

class Units {
  int? id;
  String? name;

  Units({this.id, this.name});

  Units.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  static List<Units> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Units.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }

  Units copyWith({
    int? id,
    String? name,
  }) => Units(
    id: id ?? this.id,
    name: name ?? this.name,
  );
}