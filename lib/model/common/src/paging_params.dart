class PagingParams {

  int current = 1;
  Map<String, dynamic>? extra = {};
  Map<String, dynamic> model = {};
  String? order = 'descending';
  int size = 10;
  String? sort = "id";
  PagingParams();

  factory PagingParams.create({required int pageIndex}){
    var params = PagingParams();
    params.current = pageIndex;
    return params;
  }
}
