
import 'package:accumulation/components/components.dart';
import 'package:accumulation/view_pages/home/home.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage ({super.key});
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<NavigationBloc>(context);
    return WillPopScope(
      onWillPop: () async => ExitApp.canExit(),
      child: Scaffold(
        body: Body(
          bottom: false,
          child: Builder(
            builder: (_) {
              return ChangeNotifierProvider<PagesScope>.value(
                value: bloc.pageScope,
                child: Consumer<PagesScope>(
                  builder: (context, scope, child) {
                    List<Widget> children = [
                      Provider<HomesBloc>(
                        create: (_) => HomesBloc(),
                        child: const HomesPage(),
                        dispose: (_, bloc) => bloc.dispose(),
                      ),
                      Provider(
                        create: (_) => PersonBloc(),
                        child: const PersonPage(),
                      ),
                    ];
                    return PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: scope.pageController,
                      children: children,
                    );
                  },
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: ChangeNotifierProvider<IndexScope>.value(
          value: bloc.indexScope,
          child: Consumer<IndexScope>(
            builder: (_, scope, __) {
              List<BottomNavigationBarItem> items = [
                _buildBottomNavigationBarItem(
                  label: "首页",
                  icon: Icons.home,
                ),
                _buildBottomNavigationBarItem(
                  label: "个人中心",
                  icon: Icons.person,
                ),
              ];
              return CupertinoTabBar(
                iconSize: 22,
                currentIndex: scope.currentIndex,
                onTap: bloc.onChanged,
                items: items,
                backgroundColor: Theme.of(context).cardColor,
                border: Border(top: Divider.createBorderSide(context)),
              );
            },
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    String? label,
    IconData? icon,
    double? iconSize,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        icon,
        size: iconSize,
      ),
    );
  }
}
