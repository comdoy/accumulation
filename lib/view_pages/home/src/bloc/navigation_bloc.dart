import 'package:accumulation/components/components.dart';
import 'package:flutter/material.dart';

class NavigationBloc with BodyMixin{

  PagesScope pageScope = PagesScope();
  IndexScope indexScope = IndexScope();

  ValueChanged<int> get onChanged => (index) {
        pageScope.onChanged(index);
        indexScope.onChanged(index);
      };
}
