import 'package:accumulation/components/body/body_mixin.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/request/common/home_request.dart';

class RecruitmentBloc with BodyMixin<List<Recruitment>?> {
  late int pageIndex;
  List<Recruitment>? model;

  @override
  Future<List<Recruitment>?> onInit() async {
    pageIndex = 0;
    model = [];
    await onLoading();
    return model;
  }

  @override
  Future<List<Recruitment>?> onLoading() async {
    try {
      var res = await HomeRequest.getRecruitment(page: pageIndex, pageSize: 20);
      model?.addAll(res!);
      ++pageIndex;
      controller.withData(res);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
