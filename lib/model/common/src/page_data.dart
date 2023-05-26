class PageData<T> {
  PageData({this.total, this.pages,this.size, this.records});
  List<T>? records;
  int? total;
  int? size;
  int? pages;

  factory PageData.fromJson(Map<String, dynamic>? json) {
    return PageData(
            total: json?['total'],
            size:json?["size"],
            pages: json?[' pages'],
            records: json?['records'],
          );
  }
}
