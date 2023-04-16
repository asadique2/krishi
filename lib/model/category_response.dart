class CategoryResponse {
  CategoryResponse({
    this.response,
    this.message,
    this.data,
    this.error,
  });

  CategoryResponse.fromJson(dynamic json) {
    response = json['response'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    error = json['error'];
  }
  bool? response;
  String? message;
  List<Data>? data;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = response;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['error'] = error;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.category,
    this.icon,
    this.status,
    this.lnBn,
    this.lnHn,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    category = json['category'];
    icon = json['icon'];
    status = json['status'];
    lnBn = json['ln_bn'];
    lnHn = json['ln_hn'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? category;
  String? icon;
  int? status;
  String? lnBn;
  String? lnHn;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category'] = category;
    map['icon'] = icon;
    map['status'] = status;
    map['ln_bn'] = lnBn;
    map['ln_hn'] = lnHn;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
