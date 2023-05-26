import 'package:accumulation/components/i-toast/i_toast.dart';
import 'package:accumulation/request/client/exception.dart';

bool handleException(Object exception, {bool Function(ApiException)? onError}) {
  ApiException apiException = ApiException.from(exception);
  if (onError?.call(apiException) == true) {
    return true;
  }
  if (apiException.code == 0) {
    IToast.loading();
    return true;
  }

  IToast.show(
    apiException.msg ?? ApiException.unknownException,
    position: IToastPosition.center,
  );

  return false;
}
