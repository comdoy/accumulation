import 'package:accumulation/components/components.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/router/router.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:accumulation/view_pages/home/src/bloc/resume_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ResumeCellKeys {
  basicInfo,
  advantages,
  education,
}

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ResumeBloc>(context);
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("我的简历"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => bloc.resumePDF(context),
            icon: Icon(
              Icons.picture_as_pdf_sharp,
              color: Theme.of(context).cardColor,
              size: 20,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: Theme.of(context).primaryColor,
            ),
          ),
          frame(),
          Body(
            onInit: bloc.onInit,
            controller: bloc.controller,
            builder: (context, data) {
              return SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Stack(
                  children: [
                    frame(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16, left: 16),
                            child: infoView(context, bloc.entity),
                          ),
                          const SizedBox(height: 16),
                          ...List.generate(
                            bloc.itmeListCell.length,
                            (index) {
                              var block = bloc.itmeListCell[index];
                              return infoBlock(
                                List.generate(block.map?.length ?? 0, (idx) {
                                  var keys = block.map?.keys.toList();
                                  var values = block.map?.values.toList();
                                  return infoItem(
                                    keys?[idx] ?? '-',
                                    values?[idx] ?? '-',
                                  );
                                }),
                                title: block.title,
                                icon: block.icon,
                                iconfont: block.iconfont,
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    Routes.root,
                                    arguments: {"key": block.keys},
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    ChangeNotifierProvider<PagesScope>.value(
                      value: bloc.pageScope,
                      child: Consumer<PagesScope>(
                          builder: (context, scope, child) {
                        return Positioned(
                            top: 32,
                            right: 40,
                            child: headView(bloc,
                                onTap: () => bloc.getImage(
                                    bloc.entity!.images, "resume")));
                      }),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget headView(ResumeBloc? bloc, {GestureTapCallback? onTap}) {
    var model = bloc?.entity;
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ]),
          child: InkWell(
            onTap: onTap,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                INetworkImage(
                  borderRadius: 6,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                  placeholder: ImgAsset.avatar128,
                  image: Utils.imgUrl(
                    image: (model?.images),
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: bloc!.downloadNotifier,
                  builder: (_, val, child) {
                    return Offstage(
                      offstage: bloc.path != null || bloc.isDownloaded,
                      child: val
                          ? const CupertinoActivityIndicator(
                              color: Colors.grey,
                            )
                          : const Icon(
                              Icons.arrow_circle_down,
                              color: Colors.blueAccent,
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 100),
          child: Text(
            model?.nickname ?? '-',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget infoView(
    BuildContext context,
    UserEntity? model,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTextStyle(
          style: TextStyle(color: Theme.of(context).disabledColor),
          child: Row(
            children: [
              Text(
                model?.age == null ? "未知" : '${model?.age}\t岁',
              ),
              Text(
                " / ${model?.sex ?? ''}",
              ),
              Text(
                " / ${model?.address ?? "未知地区"}",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: rowIconText(
              icon: Icons.phone_android,
              text: model?.username,
              textColor: Theme.of(context).primaryColor,
              onTap: () => CommonUtils.makePhoneCall(model?.username)),
        ),
        rowIconText(
            icon: Icons.phone_android,
            text: model?.username,
            textColor: Theme.of(context).disabledColor,
            onTap: () => CommonUtils.makePhoneCall(model?.username)),
      ],
    );
  }

  Widget rowIconText({
    Color? textColor,
    Color? iconColor,
    IconData? icon,
    String? text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: iconColor ?? textColor,
          ),
          const SizedBox(width: 6),
          Text(
            text ?? '-',
            style: TextStyle(
              color: textColor,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget infoBlock(
    List<Widget> infoItems, {
    String? title,
    IconData? icon,
    IconData? iconfont,
    VoidCallback? onPressed,
  }) {
    return Builder(builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border(
              bottom: Divider.createBorderSide(context)
                  .copyWith(color: Theme.of(context).dividerColor, width: 3),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Offstage(
              offstage: title == null,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  children: <Widget>[
                    Icon(
                      icon,
                      color: Theme.of(context).dividerColor,
                      size: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        title ?? '',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          iconfont,
                          color: Theme.of(context).unselectedWidgetColor,
                          size: 20,
                        ),
                        onPressed: onPressed,
                      ),
                    ))
                  ],
                ),
              ),
            ),
            Column(children: infoItems),
          ],
        ),
      );
    });
  }

  Widget infoItem(String key, String value) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(key),
            const SizedBox(width: 16),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
