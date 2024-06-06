
class Mobiz {
  List<Data>? data;
  bool? success;
  List<String>? messages;

  Mobiz({this.data, this.success, this.messages});

  Mobiz.fromJson(Map<String, dynamic> json) {
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

  static List<Mobiz> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Mobiz.fromJson(map)).toList();
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

  Mobiz copyWith({
    List<Data>? data,
    bool? success,
    List<String>? messages,
  }) => Mobiz(
    data: data ?? this.data,
    success: success ?? this.success,
    messages: messages ?? this.messages,
  );
}

class Data {
  int? id;
  String? code;
  String? name;
  String? proImage;
  int? categoryId;
  int? subCategoryId;
  int? brandId;
  int? supplierId;
  int? taxId;
  int? taxPercentage;
  int? taxInclusive;
  int? price;
  int? baseUnitId;
  int? baseUnitQty;
  String? baseUnitDiscount;
  dynamic baseUnitBarcode;
  int? baseUnitOpStock;
  String? secondUnitPrice;
  int? secondUnitId;
  int? secondUnitQty;
  String? secondUnitDiscount;
  dynamic secondUnitBarcode;
  String? secondUnitOpStock;
  String? thirdUnitPrice;
  int? thirdUnitId;
  int? thirdUnitQty;
  String? thirdUnitDiscount;
  dynamic thirdUnitBarcode;
  String? thirdUnitOpStock;
  String? fourthUnitPrice;
  int? fourthUnitId;
  int? fourthUnitQty;
  String? fourthUnitDiscount;
  int? isMultipleUnit;
  String? fourthUnitOpStock;
  dynamic description;
  int? productQty;
  int? storeId;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Data({this.id, this.code, this.name, this.proImage, this.categoryId, this.subCategoryId, this.brandId, this.supplierId, this.taxId, this.taxPercentage, this.taxInclusive, this.price, this.baseUnitId, this.baseUnitQty, this.baseUnitDiscount, this.baseUnitBarcode, this.baseUnitOpStock, this.secondUnitPrice, this.secondUnitId, this.secondUnitQty, this.secondUnitDiscount, this.secondUnitBarcode, this.secondUnitOpStock, this.thirdUnitPrice, this.thirdUnitId, this.thirdUnitQty, this.thirdUnitDiscount, this.thirdUnitBarcode, this.thirdUnitOpStock, this.fourthUnitPrice, this.fourthUnitId, this.fourthUnitQty, this.fourthUnitDiscount, this.isMultipleUnit, this.fourthUnitOpStock, this.description, this.productQty, this.storeId, this.status, this.createdAt, this.updatedAt, this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["code"] is String) {
      code = json["code"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["pro_image"] is String) {
      proImage = json["pro_image"];
    }
    if(json["category_id"] is num) {
      categoryId = (json["category_id"] as num).toInt();
    }
    if(json["sub_category_id"] is num) {
      subCategoryId = (json["sub_category_id"] as num).toInt();
    }
    if(json["brand_id"] is num) {
      brandId = (json["brand_id"] as num).toInt();
    }
    if(json["supplier_id"] is num) {
      supplierId = (json["supplier_id"] as num).toInt();
    }
    if(json["tax_id"] is num) {
      taxId = (json["tax_id"] as num).toInt();
    }
    if(json["tax_percentage"] is num) {
      taxPercentage = (json["tax_percentage"] as num).toInt();
    }
    if(json["tax_inclusive"] is num) {
      taxInclusive = (json["tax_inclusive"] as num).toInt();
    }
    if(json["price"] is num) {
      price = (json["price"] as num).toInt();
    }
    if(json["base_unit_id"] is num) {
      baseUnitId = (json["base_unit_id"] as num).toInt();
    }
    if(json["base_unit_qty"] is num) {
      baseUnitQty = (json["base_unit_qty"] as num).toInt();
    }
    if(json["base_unit_discount"] is String) {
      baseUnitDiscount = json["base_unit_discount"];
    }
    baseUnitBarcode = json["base_unit_barcode"];
    if(json["base_unit_op_stock"] is num) {
      baseUnitOpStock = (json["base_unit_op_stock"] as num).toInt();
    }
    if(json["second_unit_price"] is String) {
      secondUnitPrice = json["second_unit_price"];
    }
    if(json["second_unit_id"] is num) {
      secondUnitId = (json["second_unit_id"] as num).toInt();
    }
    if(json["second_unit_qty"] is num) {
      secondUnitQty = (json["second_unit_qty"] as num).toInt();
    }
    if(json["second_unit_discount"] is String) {
      secondUnitDiscount = json["second_unit_discount"];
    }
    secondUnitBarcode = json["second_unit_barcode"];
    if(json["second_unit_op_stock"] is String) {
      secondUnitOpStock = json["second_unit_op_stock"];
    }
    if(json["third_unit_price"] is String) {
      thirdUnitPrice = json["third_unit_price"];
    }
    if(json["third_unit_id"] is num) {
      thirdUnitId = (json["third_unit_id"] as num).toInt();
    }
    if(json["third_unit_qty"] is num) {
      thirdUnitQty = (json["third_unit_qty"] as num).toInt();
    }
    if(json["third_unit_discount"] is String) {
      thirdUnitDiscount = json["third_unit_discount"];
    }
    thirdUnitBarcode = json["third_unit_barcode"];
    if(json["third_unit_op_stock"] is String) {
      thirdUnitOpStock = json["third_unit_op_stock"];
    }
    if(json["fourth_unit_price"] is String) {
      fourthUnitPrice = json["fourth_unit_price"];
    }
    if(json["fourth_unit_id"] is num) {
      fourthUnitId = (json["fourth_unit_id"] as num).toInt();
    }
    if(json["fourth_unit_qty"] is num) {
      fourthUnitQty = (json["fourth_unit_qty"] as num).toInt();
    }
    if(json["fourth_unit_discount"] is String) {
      fourthUnitDiscount = json["fourth_unit_discount"];
    }
    if(json["is_multiple_unit"] is num) {
      isMultipleUnit = (json["is_multiple_unit"] as num).toInt();
    }
    if(json["fourth_unit_op_stock"] is String) {
      fourthUnitOpStock = json["fourth_unit_op_stock"];
    }
    description = json["description"];
    if(json["product_qty"] is num) {
      productQty = (json["product_qty"] as num).toInt();
    }
    if(json["store_id"] is num) {
      storeId = (json["store_id"] as num).toInt();
    }
    if(json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
    deletedAt = json["deleted_at"];
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["code"] = code;
    _data["name"] = name;
    _data["pro_image"] = proImage;
    _data["category_id"] = categoryId;
    _data["sub_category_id"] = subCategoryId;
    _data["brand_id"] = brandId;
    _data["supplier_id"] = supplierId;
    _data["tax_id"] = taxId;
    _data["tax_percentage"] = taxPercentage;
    _data["tax_inclusive"] = taxInclusive;
    _data["price"] = price;
    _data["base_unit_id"] = baseUnitId;
    _data["base_unit_qty"] = baseUnitQty;
    _data["base_unit_discount"] = baseUnitDiscount;
    _data["base_unit_barcode"] = baseUnitBarcode;
    _data["base_unit_op_stock"] = baseUnitOpStock;
    _data["second_unit_price"] = secondUnitPrice;
    _data["second_unit_id"] = secondUnitId;
    _data["second_unit_qty"] = secondUnitQty;
    _data["second_unit_discount"] = secondUnitDiscount;
    _data["second_unit_barcode"] = secondUnitBarcode;
    _data["second_unit_op_stock"] = secondUnitOpStock;
    _data["third_unit_price"] = thirdUnitPrice;
    _data["third_unit_id"] = thirdUnitId;
    _data["third_unit_qty"] = thirdUnitQty;
    _data["third_unit_discount"] = thirdUnitDiscount;
    _data["third_unit_barcode"] = thirdUnitBarcode;
    _data["third_unit_op_stock"] = thirdUnitOpStock;
    _data["fourth_unit_price"] = fourthUnitPrice;
    _data["fourth_unit_id"] = fourthUnitId;
    _data["fourth_unit_qty"] = fourthUnitQty;
    _data["fourth_unit_discount"] = fourthUnitDiscount;
    _data["is_multiple_unit"] = isMultipleUnit;
    _data["fourth_unit_op_stock"] = fourthUnitOpStock;
    _data["description"] = description;
    _data["product_qty"] = productQty;
    _data["store_id"] = storeId;
    _data["status"] = status;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["deleted_at"] = deletedAt;
    return _data;
  }

  Data copyWith({
    int? id,
    String? code,
    String? name,
    String? proImage,
    int? categoryId,
    int? subCategoryId,
    int? brandId,
    int? supplierId,
    int? taxId,
    int? taxPercentage,
    int? taxInclusive,
    int? price,
    int? baseUnitId,
    int? baseUnitQty,
    String? baseUnitDiscount,
    dynamic baseUnitBarcode,
    int? baseUnitOpStock,
    String? secondUnitPrice,
    int? secondUnitId,
    int? secondUnitQty,
    String? secondUnitDiscount,
    dynamic secondUnitBarcode,
    String? secondUnitOpStock,
    String? thirdUnitPrice,
    int? thirdUnitId,
    int? thirdUnitQty,
    String? thirdUnitDiscount,
    dynamic thirdUnitBarcode,
    String? thirdUnitOpStock,
    String? fourthUnitPrice,
    int? fourthUnitId,
    int? fourthUnitQty,
    String? fourthUnitDiscount,
    int? isMultipleUnit,
    String? fourthUnitOpStock,
    dynamic description,
    int? productQty,
    int? storeId,
    int? status,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) => Data(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    proImage: proImage ?? this.proImage,
    categoryId: categoryId ?? this.categoryId,
    subCategoryId: subCategoryId ?? this.subCategoryId,
    brandId: brandId ?? this.brandId,
    supplierId: supplierId ?? this.supplierId,
    taxId: taxId ?? this.taxId,
    taxPercentage: taxPercentage ?? this.taxPercentage,
    taxInclusive: taxInclusive ?? this.taxInclusive,
    price: price ?? this.price,
    baseUnitId: baseUnitId ?? this.baseUnitId,
    baseUnitQty: baseUnitQty ?? this.baseUnitQty,
    baseUnitDiscount: baseUnitDiscount ?? this.baseUnitDiscount,
    baseUnitBarcode: baseUnitBarcode ?? this.baseUnitBarcode,
    baseUnitOpStock: baseUnitOpStock ?? this.baseUnitOpStock,
    secondUnitPrice: secondUnitPrice ?? this.secondUnitPrice,
    secondUnitId: secondUnitId ?? this.secondUnitId,
    secondUnitQty: secondUnitQty ?? this.secondUnitQty,
    secondUnitDiscount: secondUnitDiscount ?? this.secondUnitDiscount,
    secondUnitBarcode: secondUnitBarcode ?? this.secondUnitBarcode,
    secondUnitOpStock: secondUnitOpStock ?? this.secondUnitOpStock,
    thirdUnitPrice: thirdUnitPrice ?? this.thirdUnitPrice,
    thirdUnitId: thirdUnitId ?? this.thirdUnitId,
    thirdUnitQty: thirdUnitQty ?? this.thirdUnitQty,
    thirdUnitDiscount: thirdUnitDiscount ?? this.thirdUnitDiscount,
    thirdUnitBarcode: thirdUnitBarcode ?? this.thirdUnitBarcode,
    thirdUnitOpStock: thirdUnitOpStock ?? this.thirdUnitOpStock,
    fourthUnitPrice: fourthUnitPrice ?? this.fourthUnitPrice,
    fourthUnitId: fourthUnitId ?? this.fourthUnitId,
    fourthUnitQty: fourthUnitQty ?? this.fourthUnitQty,
    fourthUnitDiscount: fourthUnitDiscount ?? this.fourthUnitDiscount,
    isMultipleUnit: isMultipleUnit ?? this.isMultipleUnit,
    fourthUnitOpStock: fourthUnitOpStock ?? this.fourthUnitOpStock,
    description: description ?? this.description,
    productQty: productQty ?? this.productQty,
    storeId: storeId ?? this.storeId,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    deletedAt: deletedAt ?? this.deletedAt,
  );
}