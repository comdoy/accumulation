import 'package:accumulation/components/components.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:accumulation/view_pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCenterPage extends StatelessWidget {
  const UserCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 弹出对话框
    var bloc = Provider.of<UserCenterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("个人信息"),
        elevation: 0,
      ),
      body: Body<UserEntity?>(
        vsync: bloc,
        builder: (_, model) {
          return Column(
            children: [
              inkewllCell(
                context,
                onTap: () => bloc.onAvatar(context),
                rightWidget: INetworkImage(
                  borderRadius: 6,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  placeholder: ImgAsset.avatar128,
                  image: Utils.imgUrl(
                    image: (model?.images),
                  ),
                ),
                title: "头像",
              ),
              inkewllCell(
                context,
                value: model?.username,
                title: "账号",
              ),
              inkewllCell(
                context,
                value: model?.nickname,
                title: "姓名",
              ),
              inkewllCell(
                context,
                value: model?.sex,
                title: "性别",
              ),
              inkewllCell(
                context,
                value: "${model?.age}",
                title: "年龄",
              ),
              inkewllCell(
                context,
                value: model?.address,
                title: "家庭地址",
                bottom: 5,
              ),
              inkewllCell(
                context,
                onTap: () {},
                title: "账户安全",
                bottom: 5,
              ),
              inkewllCell(
                context,
                title: "退出登录",
                onTap: () => bloc.showDeleteConfirmDialog1(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget inkewllCell(
    BuildContext context, {
    GestureTapCallback? onTap,
    required String title,
    String? value,
    double bottom = 1,
    Widget? rightWidget,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).cardColor,
        margin: EdgeInsets.only(bottom: bottom),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            Expanded(
              child: onTap == null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        value ?? '-',
                        textAlign: TextAlign.right,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        rightWidget ?? const SizedBox(),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
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
