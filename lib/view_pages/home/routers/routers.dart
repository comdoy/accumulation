import 'package:accumulation/router/router.dart';

class HomeRouters {
  static const String login = '/login';
  static List<RouteModel> router() {
    return [RouteModel(login, handler: loginHanderl)];
  }
}
