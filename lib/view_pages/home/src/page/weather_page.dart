import 'package:accumulation/consts/consts.dart';
import 'package:accumulation/model/model_paths.dart';
import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage(Map<String, dynamic>? args) : _args = args ?? {};
  final Map<String, dynamic> _args;

  Weather? get model => _args["weather"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(model?.city ?? '中国'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.add,
              size: 28,
            ),
          )
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: Theme.of(context).primaryColor,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model!.tem,
                      style:
                          const TextStyle(fontSize: 100, color: Colors.white),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Text(
                        "℃",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        model?.wea ?? "-",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '   ${model?.tem1 ?? "-"}°  /',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${model?.tem2 ?? '-'}°',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.park,
                            size: 15,
                            color: Colors.white,
                          ),
                          Text(
                            ' 空气${model?.airLevel ?? '-'} ${model?.air ?? '-'}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.opacity,
                            size: 15,
                            color: Colors.white,
                          ),
                          Text(
                            ' 2小时内无降水',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 16),
                  margin: const EdgeInsets.all(10).copyWith(top: 170),
                  child: Column(
                    children: [
                      columCell(
                          icon: Icons.cloudy_snowing,
                          tem: "明天",
                          wem: "小雨",
                          api: "优",
                          temmax: "19°/9°"),
                      columCell(
                          icon: Icons.cloudy_snowing,
                          tem: "明天",
                          wem: "小雨",
                          api: "优",
                          temmax: "19°/9°"),
                      columCell(
                          icon: Icons.cloudy_snowing,
                          tem: "明天",
                          wem: "小雨",
                          api: "优",
                          temmax: "19°/9°"),
                      Center(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(color: Theme.of(context).dividerColor,borderRadius: BorderRadius.circular(28)),
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(' 2小时内无降水',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ))),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.av_timer,
                              color: Colors.grey.shade400,
                            ),
                            Text(
                              "24小时预报",
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 240,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model!.hours.length,
                              itemBuilder: (context, index) {
                                return hoersCell(model!.hours[index]);
                              }),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget columCell(
      {IconData? icon, String? tem, String? wem, String? api, String? temmax}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          const Icon(
            Icons.cloud,
            size: 20,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              tem ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            wem ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            api ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 30),
          Text(
            temmax ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget hoersCell(WeatherHours itme) {
    double topTem = double.parse(itme.tem);
    double tem = double.parse(model!.tem);
    double top;
    if (tem - topTem >= 0) {
      top = (tem - topTem) * 20 + tem * 4;
    } else {
      top = tem * 4 - (topTem - tem) * 20;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: top),
            child: Text(
              itme.tem,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          const Icon(
            Icons.cloud,
            size: 20,
            color: Colors.white,
          ),
          const SizedBox(height: 5),
          Text(
            itme.winSpeed,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding:
                const EdgeInsets.symmetric(horizontal: 5).copyWith(bottom: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: const Color.fromARGB(255, 142, 142, 142),
            ),
            child: Text(
              itme.aqi,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Text(
            itme.hours,
            style: const TextStyle(
              color: Color.fromARGB(255, 206, 206, 206),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
