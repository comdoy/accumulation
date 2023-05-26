import 'package:accumulation/components/components.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const double _kDefaultHeight = 150.0;
const double _kImageSize = 72.0;

class UserAccountHeader extends StatelessWidget implements PreferredSizeWidget {
  const UserAccountHeader(
      {super.key, this.user, this.weather, this.onTap, this.tag, this.onTaps,this.padding});

  final UserEntity? user;

  final Weather? weather;

  final VoidCallback? onTap;
  final VoidCallback? onTaps;

  final EdgeInsetsGeometry? padding;

  /// 底部的tag,有一些要显示部门
  final String? tag;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        alignment: Alignment.center,
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: padding ?? const EdgeInsets.all(16).copyWith(top: 32),
                child: _buildUser(),
              ),
              //乱搞
              ...positionedCircularList,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUser() {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          INetworkImage(
            borderRadius: 8,
            width: _kImageSize,
            height: _kImageSize,
            image: Utils.imgUrl(
              image: user?.images,
            ),
            placeholder: ImgAsset.avatar128,
          ),
          const SizedBox(width: 16),
          user == null
              ? const Expanded(
                  child: Text(
                    "前往登录",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Expanded(
                  child: SizedBox(
                    height: _kImageSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          user?.nickname ?? '-',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        InkWell(
                          onTap: () =>
                              CommonUtils.makePhoneCall(user?.username),
                          child: _buildTag(
                            child: Text(
                              tag ?? user?.username ?? '-',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          InkWell(
            onTap: onTaps,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      weather?.tem ?? "-",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    const Text(
                      "℃",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${weather?.wea ?? "-"}  |  ",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '空气${weather?.airLevel ?? '-'}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weather?.tem1 ?? "-"}  /',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      weather?.tem2 ?? '-',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Offstage(
            offstage: onTap == null,
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTag({required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  List<Widget> get positionedCircularList {
    return [
      Positioned(
        right: 30,
        bottom: 30,
        child: CustomPaint(
          painter: _PaintCircular(60),
        ),
      ),
      Positioned(
        right: 50,
        bottom: 50,
        child: CustomPaint(
          painter: _PaintCircular(90),
        ),
      ),
      Positioned(
        right: 30,
        bottom: 30,
        child: CustomPaint(
          painter: _PaintCircular(90),
        ),
      ),
      Positioned(
        top: 30,
        left: 30,
        child: CustomPaint(
          painter: _PaintCircular(120),
        ),
      ),
      Positioned(
        top: 50,
        left: 30,
        child: CustomPaint(
          painter: _PaintCircular(120),
        ),
      ),
    ];
  }

  @override
  Size get preferredSize => const Size.fromHeight(_kDefaultHeight);
}

class _PaintCircular extends CustomPainter {
  final double radius;

  _PaintCircular(this.radius);

  final Paint _paint = Paint()
    ..color = Colors.white.withOpacity(0.1)
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(0.0, 0.0), radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
