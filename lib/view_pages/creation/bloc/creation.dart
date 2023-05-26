import 'package:accumulation/components/body/body_mixin.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/request/common/home_request.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CreationBloc with BodyMixin<List<PressModel>?> {
  @override
  RefreshController refreshController = RefreshController();
  List<PressModel>? view;
  late int _pageindex;
  @override
  Future<List<PressModel>?> onInit() async {
    try {
      _pageindex = 0;
      view = [];
      await onLoading();
      return view;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PressModel>?> onLoading() async {
    try {
      var res = await HomeRequest.getPress(
        page: _pageindex,
        pageSize: 20,
      );
      view?.addAll(res!);
      ++_pageindex;
      controller.withData(view);
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
