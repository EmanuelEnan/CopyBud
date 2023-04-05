class CopyModel {
  String? data1;
  String? data2;

  String? text;

  CopyModel({this.data1, this.text, this.data2});

  factory CopyModel.fromJson(Map<String, dynamic> json) {
    return CopyModel(
      data1: json['data1'] ?? 'null',
      data2: json['data2'] ?? 'null',
      text: json['text'] ?? 'null',
    );
  }
}
