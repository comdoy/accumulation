import 'package:accumulation/components/components.dart';
import 'package:accumulation/consts/consts.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/view_pages/creation/bloc/creation.dart';
import 'package:accumulation/view_pages/creation/page/creation.dart';
import 'package:accumulation/view_pages/home/home.dart';
import 'package:accumulation/view_pages/home/src/components/recruitment_cell.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomesPage extends StatelessWidget {
  const HomesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<HomesBloc>(context);
    Widget frame({Widget? child}) {
      return Container(
        margin: const EdgeInsets.only(top: 64),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: child,
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("用户中心"),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: ColoredBox(
                color: Theme.of(context).primaryColor,
              ),
            ),
            frame(),
            frame(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Globals.oceanBlue?.withOpacity(0.3)),
                    margin: const EdgeInsets.all(10),
                    child: TabBar(
                      unselectedLabelColor: Globals.oceanBlue,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: Globals.oceanBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      tabs: bloc.list,
                    ),
                  ),
                  Flexible(
                    child: TabBarView(
                      children: [
                        Body<List<Recruitment>?>(
                          onInit: bloc.onInit,
                          autoKeep: true,
                          controller: bloc.controller,
                          builder: (context, data) {
                            return JKPullRefresh(
                              controller: bloc.refreshController,
                              onRefresh: bloc.onInit,
                              onLoading: bloc.onLoading,
                              empty: data!.isEmpty,
                              child: ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (item, index) => RecruitmentCell(
                                  onTap: () {},
                                  model: data[index],
                                ),
                              ),
                            );
                          },
                        ),
                        Provider(
                          create: (_) => CreationBloc(),
                          child: const CreationPage(),
                        ),
                        Provider(
                          create: (_) => CreationBloc(),
                          child: const CreationPage(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Tab tab(
  IconData icon,
  String text,
) {
  return Tab(
    height: 44,
    icon: Icon(icon),
    text: text,
    iconMargin: const EdgeInsets.all(0),
  );
}
