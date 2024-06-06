
class Loginmodel {
  String? status;
  User? user;
  Authorisation? authorisation;

  Loginmodel({this.status, this.user, this.authorisation});

  Loginmodel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if(json["authorisation"] is Map) {
      authorisation = json["authorisation"] == null ? null : Authorisation.fromJson(json["authorisation"]);
    }
  }

  static List<Loginmodel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Loginmodel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    if(authorisation != null) {
      _data["authorisation"] = authorisation?.toJson();
    }
    return _data;
  }

  Loginmodel copyWith({
    String? status,
    User? user,
    Authorisation? authorisation,
  }) => Loginmodel(
    status: status ?? this.status,
    user: user ?? this.user,
    authorisation: authorisation ?? this.authorisation,
  );
}

class Authorisation {
  String? token;
  String? type;

  Authorisation({this.token, this.type});

  Authorisation.fromJson(Map<String, dynamic> json) {
    if(json["token"] is String) {
      token = json["token"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
  }

  static List<Authorisation> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Authorisation.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["token"] = token;
    _data["type"] = type;
    return _data;
  }

  Authorisation copyWith({
    String? token,
    String? type,
  }) => Authorisation(
    token: token ?? this.token,
    type: type ?? this.type,
  );
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic isSuperAdmin;
  dynamic isShopAdmin;
  String? isStaff;
  int? departmentId;
  int? designationId;
  int? storeId;
  int? rolId;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.name, this.email, this.emailVerifiedAt, this.isSuperAdmin, this.isShopAdmin, this.isStaff, this.departmentId, this.designationId, this.storeId, this.rolId, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    emailVerifiedAt = json["email_verified_at"];
    isSuperAdmin = json["is_super_admin"];
    isShopAdmin = json["is_shop_admin"];
    if(json["is_staff"] is String) {
      isStaff = json["is_staff"];
    }
    if(json["department_id"] is num) {
      departmentId = (json["department_id"] as num).toInt();
    }
    if(json["designation_id"] is num) {
      designationId = (json["designation_id"] as num).toInt();
    }
    if(json["store_id"] is num) {
      storeId = (json["store_id"] as num).toInt();
    }
    if(json["rol_id"] is num) {
      rolId = (json["rol_id"] as num).toInt();
    }
    if(json["created_at"] is String) {
      createdAt = json["created_at"];
    }
    if(json["updated_at"] is String) {
      updatedAt = json["updated_at"];
    }
  }

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => User.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["email_verified_at"] = emailVerifiedAt;
    _data["is_super_admin"] = isSuperAdmin;
    _data["is_shop_admin"] = isShopAdmin;
    _data["is_staff"] = isStaff;
    _data["department_id"] = departmentId;
    _data["designation_id"] = designationId;
    _data["store_id"] = storeId;
    _data["rol_id"] = rolId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    dynamic emailVerifiedAt,
    dynamic isSuperAdmin,
    dynamic isShopAdmin,
    String? isStaff,
    int? departmentId,
    int? designationId,
    int? storeId,
    int? rolId,
    String? createdAt,
    String? updatedAt,
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
    isSuperAdmin: isSuperAdmin ?? this.isSuperAdmin,
    isShopAdmin: isShopAdmin ?? this.isShopAdmin,
    isStaff: isStaff ?? this.isStaff,
    departmentId: departmentId ?? this.departmentId,
    designationId: designationId ?? this.designationId,
    storeId: storeId ?? this.storeId,
    rolId: rolId ?? this.rolId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
}