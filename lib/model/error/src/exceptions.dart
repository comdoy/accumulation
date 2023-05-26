

class IException implements Exception {
  IException([this.message]);

  final String? message;

  @override
  String toString() {
    return message ?? super.toString();
  }
}

class LoginExpiration extends IException {
  LoginExpiration([String? message]) : super(message);
}

class NetworkExpiration extends IException {
  NetworkExpiration([String? message]) : super(message);
}

class RefreshExpiration extends IException {
  RefreshExpiration([String? message]) : super(message);
}

/// 离线模式下没有找到服务器
class NotFoundServerExpiration extends IException {
  NotFoundServerExpiration([String? message]) : super(message);
}

/// 离线模式下服务器没有绑定公司
class NotBoundCompanyExpiration extends IException {
  NotBoundCompanyExpiration([String? message]) : super(message);
}

/// 内容含有敏感词
// class SensitiveWordsException extends IException {
//   SensitiveWordsException(this.sensitiveWords, [String? message])
//       : super(message ??
//             '数据中存在敏感词汇：${sensitiveWords.map((e) => '"${e.text}"').toList().toSet().join(', ')}');

//   final List<SensitiveWordsFilterResult> sensitiveWords;
// }
