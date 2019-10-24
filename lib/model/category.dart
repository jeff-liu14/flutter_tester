class CategoryModelResp {
  String code;
  String message;
  List<CategoryData> data;

  CategoryModelResp.fromJsonMap(Map<String, dynamic> map)
      : code = map["code"],
        message = map["message"],
        data = List<CategoryData>.from(
            map["data"].map((it) => CategoryData.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    data['data'] =
        data != null ? this.data.map((v) => v.toJson()).toList() : null;
    return data;
  }
}

class CategoryData {
  String mallCategoryId;
  String mallCategoryName;
  List<BxMallSubDto> bxMallSubDto;
  Object comments;
  String image;

  CategoryData.fromJsonMap(Map<String, dynamic> map)
      : mallCategoryId = map["mallCategoryId"],
        mallCategoryName = map["mallCategoryName"],
        bxMallSubDto = List<BxMallSubDto>.from(
            map["bxMallSubDto"].map((it) => BxMallSubDto.fromJsonMap(it))),
        comments = map["comments"],
        image = map["image"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallCategoryId'] = mallCategoryId;
    data['mallCategoryName'] = mallCategoryName;
    data['bxMallSubDto'] = bxMallSubDto != null
        ? this.bxMallSubDto.map((v) => v.toJson()).toList()
        : null;
    data['comments'] = comments;
    data['image'] = image;
    return data;
  }
}

class BxMallSubDto {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  BxMallSubDto(
      {this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  BxMallSubDto.fromJsonMap(Map<String, dynamic> map) {
    mallSubId = map["mallSubId"];
    mallCategoryId = map["mallCategoryId"];
    mallSubName = map["mallSubName"];
    comments = map["comments"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mallSubId'] = mallSubId;
    data['mallCategoryId'] = mallCategoryId;
    data['mallSubName'] = mallSubName;
    data['comments'] = comments;
    return data;
  }
}
