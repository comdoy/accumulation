import 'package:accumulation/components/components.dart';
import 'package:accumulation/view_pages/home/home.dart';
import 'package:accumulation/view_pages/home/src/components/user_account_header.dart';
import 'package:accumulation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<PersonBloc>(context);
    return Material(
        color: Theme.of(context).cardColor,
        child: Body(
          onInit: bloc.onInit,
          autoKeep: true,
          vsync: bloc,
          controller: bloc.controller,
          notData: Column(
            children: [
              UserAccountHeader(
                user: bloc.model,
                onTap: () {
                  Application.router
                      .navigateTo(context, Routes.login, clearStack: true);
                },
              ),
              Expanded(
                child: EmptyWidget(
                  message: "登录查看更多",
                  btnTitle: "登录查看更多",
                  onTap: () {
                    Application.router
                        .navigateTo(context, Routes.login, clearStack: true);
                  },
                ),
              )
            ],
          ),
          builder: (context, data) {
            return CustomScrollView(
              controller: bloc.scrollController,
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor,
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  expandedHeight: 160,
                  pinned: true,
                  stretch: true,
                  centerTitle: false,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.circle_notifications,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Application.router
                            .navigateTo(context, Routes.userCenter);
                      },
                      icon: const Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: UserAccountHeader(
                      user: bloc.model,
                      weather: bloc.weather,
                      onTaps: () => bloc.onWeather(context),
                    ),
                    title: ChangeNotifierProvider<UpdateScope>.value(
                      value: bloc.scope,
                      child: Consumer<UpdateScope>(
                        builder: (_, scope, __) => Text(
                          bloc.model?.nickname ?? '',
                          style: TextStyle(color: bloc.textColor, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 23),
                    child: Wrap(
                      runSpacing: 20,
                      spacing: 22,
                      children: [
                        ...bloc.item
                            .map((e) => cardCell(context,
                                path: e.path, image: e.image, title: e.title))
                            .toList()
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }

  Widget cardCell(BuildContext context,
      {required String path, String? image, String? title}) {
    return InkWell(
      onTap: () => Application.router.navigateTo(context, path),
      child: Column(
        children: [
          INetworkImage(
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            borderRadius: 10,
            placeholder: image,
          ),
          const SizedBox(height: 5),
          Text(
            title ?? '-',
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}

class CardCell {
  CardCell({required this.path, this.image, this.title});
  final String path;
  final String? image;
  final String? title;
}
