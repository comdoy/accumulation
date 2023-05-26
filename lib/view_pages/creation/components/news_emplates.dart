import 'package:accumulation/components/components.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/material.dart';

class NewsEmplates extends StatelessWidget {
  const NewsEmplates({Key? key, this.model, this.onTap}) : super(key: key);
  final PressModel? model;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var time = model?.pressTime.toString();
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          INetworkImage(
                            fit: BoxFit.cover,
                            width: 34,
                            height: 34,
                            borderRadius: 20,
                            image: Utils.imgUrl(image: model?.userImage),
                            placeholder: ImgAsset.avatar128,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              model?.pressName ?? '-',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(IDateUtils.remindTime(time) ?? '-'),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 160,
                child: INetworkImage(
                  image: Utils.imgUrl(image: model?.pressImage),
                  placeholder: ImgAsset.image64,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                child: Text(
                  model?.pressTitle ?? '-',
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
