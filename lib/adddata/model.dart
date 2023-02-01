class DataListFormModel {
  String? title;
  String? description;

  DataListFormModel(this.title, this.description);

  DataListFormModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
