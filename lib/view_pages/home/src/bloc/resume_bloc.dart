import 'package:accumulation/components/components.dart';
import 'package:accumulation/components/i-toast/i_toast.dart';
import 'package:accumulation/model/common/src/invoice.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/request/common/home_request.dart';
import 'package:accumulation/router/router.dart';
import 'package:accumulation/utils/src/file_utils.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:accumulation/view_pages/home/src/page/resume_page.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

class ResumeBloc with BodyMixin<dynamic> {
  int? userId;
  UserEntity? entity;
  Advantages? advantages;
  EducationExperience? education;
  PagesScope pageScope = PagesScope();
  @override
  Future<dynamic> onInit() async {
    var storage = await UserUtil.userHome;
    if (storage?.id != null) {
      userId = storage?.id;
    }
    await Future.wait(
        [requestAdvantages(), requestEntity(), educationAdvantages()]);
    path = await FileUtils.exists(entity!.images, "resume");
    return true;
  }

  final downloadNotifier = ValueNotifier(false);

  bool isDownloaded = false;
  String? path;

  void getImage(String item, String type) async {
    try {
      if (await Permission.storage.request().isGranted) {
        var filePath = await FileUtils.getPath(item, type);
        if (path == null) {
          if (downloadNotifier.value) return;
          if (!isDownloaded) {
            downloadNotifier.value = true;
            var file = await FileUtils.download(item, type);
            isDownloaded = true;
            downloadNotifier.value = false;
            await OpenFile.open(file?.path);
            return;
          }
        }
        await OpenFile.open(filePath);
      }
    } catch (e) {
      downloadNotifier.value = false;
      IToast.show("文件已损坏或丢失");
    }
  }

  Future requestEntity() async {
    entity = await HomeRequest.postUser(id: userId);
  }

  Future requestAdvantages() async {
    advantages = await HomeRequest.postAdvantages(id: userId!);
  }

  Future educationAdvantages() async {
    education = await HomeRequest.postEducation(id: userId!);
  }

  void resumePDF(BuildContext context) async {
    await pushNamed(
      context,
      Routes.resumePDF,
      {
        "entity": entity,
        "advantages": advantages,
        "education": education,
      },
    );
  }

  List<Invoice> get invoices {
    return [
      Invoice("基本信息", "address", [
        LineItem("姓名", entity?.nickname ?? '-'),
        LineItem("年龄", '${entity?.age ?? 0}'),
        LineItem("性别", entity?.sex ?? '-'),
        LineItem("电话", entity?.sex ?? '-'),
        LineItem("居住地址", entity?.sex ?? '-'),
      ]),
      Invoice("个人优势", "address", [
        LineItem("姓名", entity?.nickname ?? '-'),
        LineItem("年龄", '${entity?.age ?? 0}'),
        LineItem("性别", entity?.sex ?? '-'),
        LineItem("电话", entity?.sex ?? '-'),
        LineItem("居住地址", entity?.sex ?? '-'),
      ]),
      Invoice("教育经历", "address", [
        LineItem("姓名", entity?.nickname ?? '-'),
        LineItem("年龄", '${entity?.age ?? 0}'),
        LineItem("性别", entity?.sex ?? '-'),
        LineItem("电话", entity?.sex ?? '-'),
        LineItem("居住地址", entity?.sex ?? '-'),
      ]),
    ];
  }

  List<InfoUser> get itmeListCell {
    return [
      InfoUser(
        "基本信息",
        Icons.account_circle_rounded,
        UIIcons.modify,
        ResumeCellKeys.advantages,
        {
          "姓名": entity?.nickname ?? '-',
          "年龄": '${entity?.age ?? 0}',
          "性别": entity?.sex ?? '-',
          "电话": entity?.username ?? '-',
          "学历": entity?.educational ?? '-',
          "身份": entity?.identity ?? '-',
          "居住地址": entity?.address ?? '-',
          "邮箱": entity?.username ?? '-',
        },
      ),
      advantages == null
          ? InfoUser("个人优势", Icons.poll, null, ResumeCellKeys.advantages, {})
          : InfoUser("个人优势", Icons.poll, Icons.chevron_right,
              ResumeCellKeys.advantages, {
              '': advantages?.advantageContents ?? '-',
            }),
      // InfoUser("求职期望", Icons.app_registration, {
      //   "姓名": _model?.nickname ?? '-',
      //   "年龄": '${_model?.age ?? 0}',
      //   "性别": _model?.sex ?? '-',
      //   "电话": _model?.username ?? '-',
      //   "学历": _model?.educational ?? '-',
      //   "身份": _model?.identity ?? '-',
      //   "居住地址": _model?.address ?? '-',
      //   "邮箱": _model?.username ?? '-',
      // }),
      // InfoUser("工作经历", Icons.article_outlined, {
      //   "姓名": _model?.nickname ?? '-',
      //   "年龄": '${_model?.age ?? 0}',
      //   "性别": _model?.sex ?? '-',
      //   "电话": _model?.username ?? '-',
      //   "学历": _model?.educational ?? '-',
      //   "身份": _model?.identity ?? '-',
      //   "居住地址": _model?.address ?? '-',
      //   "邮箱": _model?.username ?? '-',
      // }),
      // InfoUser("项目经历", Icons.ballot, {
      //   "姓名": _model?.nickname ?? '-',
      //   "年龄": '${_model?.age ?? 0}',
      //   "性别": _model?.sex ?? '-',
      //   "电话": _model?.username ?? '-',
      //   "学历": _model?.educational ?? '-',
      //   "身份": _model?.identity ?? '-',
      //   "居住地址": _model?.address ?? '-',
      //   "邮箱": _model?.username ?? '-',
      // }),
      InfoUser(
        "教育经历",
        Icons.auto_stories,
        Icons.chevron_right,
        ResumeCellKeys.advantages,
        {
          "毕业学校": education?.graduatedSchool ?? '-',
          "就读专业": education?.profession ?? '-',
          "是否全日制": education?.period ?? '-',
          "毕业时间": education?.whether ?? '-',
          "最高学历": education?.education ?? '-',
          "校园经历": education?.experience ?? '-',
        },
      ),
    ];
  }
}
