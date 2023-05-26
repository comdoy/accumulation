import 'package:accumulation/components/components.dart';
import 'package:accumulation/consts/consts.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:accumulation/view_pages/image_selection/bloc/image_selection_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageSelectionPage extends StatelessWidget {
  const ImageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ImageSelectionBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("上传证件照"),
      ),
      body: Body(
        vsync: bloc,
        builder: (_, model) {
        return Column(
          children: [
            SizedBox(
              width: Adapt.screenW(),
              height: Adapt.screenW(),
              child: bloc.image ??
                  INetworkImage(
                    placeholder: ImgAsset.avatar128,
                    image: Utils.imgUrl(
                      image: bloc.imageType,
                    ),
                    width: Adapt.screenW(),
                    height: Adapt.screenW(),
                  ),
            ),
            Container(
              margin: const EdgeInsets.all(6),
              width: double.infinity,
              child: CupertinoButton(
                color: Globals.oceanBlue,
                onPressed: () => bloc.uploadImage(context),
                borderRadius: BorderRadius.circular(8),
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: const Text(
                  "从相册选择图片",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(6),
              width: double.infinity,
              child: CupertinoButton(
                color: Globals.c,
                onPressed:  bloc.image== null ? null : () => bloc.upload(context),
                borderRadius: BorderRadius.circular(8),
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: const Text(
                  "上传图片",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
