import 'package:accumulation/request/client/exception.dart';
import 'package:accumulation/request/client/exception_handle.dart';
import 'package:accumulation/utils/utils_paths.dart';

Future request(
  Function() block, {
  bool showLoading = true,
  bool Function(ApiException)? onError,
}) async {
  try {
    
    await loading(block, isShowLoading: showLoading);
  } catch (e) {
    handleException(e, onError: onError);
  }
  return;
}
