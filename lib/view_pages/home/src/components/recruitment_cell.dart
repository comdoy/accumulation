import 'package:accumulation/components/components.dart';
import 'package:accumulation/consts/consts.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/material.dart';

double height = 22;

class RecruitmentCell extends StatelessWidget {
  const RecruitmentCell(
      {Key? key, this.model, required this.onTap, this.andtwo = true})
      : super(key: key);
  final Recruitment? model;
  final void Function() onTap;
  final bool? andtwo;
  List<String> get list {
    return [
      model?.boon ?? '-',
      model?.time ?? '-',
      model?.route ?? '-',
      model?.city ?? '-',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return informationRelease(
      context,
      onTap: onTap,
    );
  }

  Widget informationRelease(
    BuildContext context, {
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).focusColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Text(
                    model?.title ?? '-',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    model?.salary ?? '-',
                    style: TextStyle(color: Globals.oceanBlue),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 16),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    list.length,
                    (index) => tagCell(list[index]),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                INetworkImage(
                  borderRadius: 30,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                  placeholder: ImgAsset.avatar128,
                  image: Utils.imgUrl(
                    image: (model?.image),
                  ),
                ),
                Text(
                  " ${model?.people} .${model?.position}",
                  style: const TextStyle(fontSize: 14),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      model?.company ?? '-',
                      style: TextStyle(color: Globals.oceanBlue),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget tagCell(String vaule) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Globals.oceanBlue?.withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        vaule,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
