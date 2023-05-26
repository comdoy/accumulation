import 'package:accumulation/components/body/body.dart';
import 'package:accumulation/components/common/jk_pull_refresh.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/view_pages/creation/bloc/creation.dart';
import 'package:accumulation/view_pages/creation/components/news_emplates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreationPage extends StatelessWidget {
  const CreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CreationBloc>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("我的发布"),elevation: 0,),
        body: Body<List<PressModel>?>(
          onInit: bloc.onInit,
          controller: bloc.controller,
          builder: (context, data) {
            return JKPullRefresh(
            controller:bloc.refreshController,
            onRefresh: bloc.onInit,
            onLoading: bloc.onLoading,
            empty: data!.isEmpty,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (item, index) => NewsEmplates(
                model:data[index],
              ),
            ),
          );
          },
        ),
        );
  }
}
