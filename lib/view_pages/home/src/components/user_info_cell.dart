import 'package:accumulation/components/components.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/router/router.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/material.dart';

class UserInfoCell extends StatelessWidget {
  const UserInfoCell({Key? key, this.itme, this.onTap, this.onLoading})
      : super(key: key);
  final UserEntity? itme;
  final void Function()? onTap;
  final void Function()? onLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: onTap,
            child: INetworkImage(
              fit: BoxFit.cover,
              width: 64,
              height: 64,
              borderRadius: 8,
              image: Utils.imgUrl(image: itme?.images),
              placeholder: ImgAsset.avatar128,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          itme?.id == 0
              ? Expanded(
                  flex: 1,
                  child: InkWell(
                    child: const Text(
                      "登录/注册",
                    ),
                    onTap: () {
                      Application.router.navigateTo(context, Routes.login);
                    },
                  ))
              : Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: onLoading,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("姓名：${itme?.nickname}",
                            style: const TextStyle(fontSize: 18)),
                        Text("账号：${itme?.username}",
                            style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
          IconButton(
            onPressed: () {
              // Application.router.navigateTo(context, '/jobOffers');
            },
            icon: const Icon(
              Icons.search_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
