import 'package:accumulation/components/common/inetwork_image.dart';
import 'package:accumulation/components/input_box/input_box.dart';
import 'package:accumulation/consts/consts.dart';
import 'package:accumulation/view_pages/logins/bloc/login_bloc.dart';
import 'package:accumulation/view_pages/logins/components/vertical_dividers.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<LoginBloc>(context);
    double stops = (MediaQuery.of(context).size.height) * 1.6 / 10;
    return WillPopScope(
      onWillPop: () async => ExitApp.canExit(),
      child: Material(
        child: Stack(
          children: [
            INetworkImage(
              fit: BoxFit.fitHeight,
              height: MediaQuery.of(context).size.height,
              placeholder: ImgAsset.jini,
            ),
            Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: stops),
                      const INetworkImage(
                        borderRadius: 6,
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                        placeholder: ImgAsset.rap,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "唱跳rap篮球",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      const SizedBox(height: 30),
                      SearchFrom(
                        context,
                        bloc.nameController,
                        bloc.namefocusNode,
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      SearchFrom(
                        context,
                        bloc.wordController,
                        bloc.wordfocusNode,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        width: double.infinity,
                        child: CupertinoButton(
                          color: Globals.deepGreen,
                          onPressed: () {
                            bloc.login(context);
                          },
                          borderRadius: BorderRadius.circular(30),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: const Text(
                            "登  录",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(context, title: "手机登录"),
                    verticalDividers(),
                    text(context, title: "新用户注册"),
                    verticalDividers(),
                    text(context, title: "更多选项"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget text(BuildContext context, {required String title}) {
    TextStyle style = TextStyle(
      color: Theme.of(context).indicatorColor,
      fontSize: 15,
    );
    return Text(title, style: style);
  }
}
