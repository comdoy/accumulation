import 'package:accumulation/model/model_paths.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;

const PdfColor valueColor = PdfColor.fromInt(0xff494949);
const PdfColor titleColor = PdfColor.fromInt(0xff898989);
pw.FontWeight? fontWeight = pw.FontWeight.bold;

class CustomData {
  const CustomData({this.name = '[your name]'});

  final String name;
}

Future<Uint8List> _generatePdf(
  PdfPageFormat format,
  UserEntity? entity,
  Advantages? advantages,
  EducationExperience? education,
) async {
  final pdf = pw.Document(
    title: '杨俊的简历',
    author: '杨俊',
  );
  final pw.ImageProvider netImage;
  entity?.images == null
      ? netImage = pw.MemoryImage(
          (await rootBundle.load(ImgAsset.avatar128)).buffer.asUint8List(),
        )
      : netImage = await networkImage(Utils.imgUrl(
            image: entity?.images,
          ) ??
          '');

  final pageTheme = await _myPageTheme(format);
  pdf.addPage(
    pw.MultiPage(
        pageTheme: pageTheme,
        build: (pw.Context context) => [
              pw.Partitions(children: [
                pw.Partition(
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.only(right: 15),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Container(
                          height: 90,
                          width: 90,
                          child: pw.Image(netImage),
                        ),
                        TitleCell(
                          title: entity?.nickname ?? '-',
                          fontSize: 25,
                        ),
                        pw.Text(
                            "${entity?.sex ?? '-'} | ${entity?.age ?? '-'}岁"),
                        TitleCell(title: "联系方式"),
                        _PDFText(title: "电话", value: entity?.username ?? '-'),
                        _PDFText(title: "微信号", value: entity?.username ?? '-'),
                        _PDFText(
                          title: "邮箱",
                          value: '${entity?.username ?? '-'}@163.com',
                        ),
                        TitleCell(title: "求职信息"),
                        _PDFText(
                          title: "工作时间",
                          value: '${entity?.username ?? '-'}@163.com',
                        ),
                        _PDFText(
                          title: "求职意向",
                          value: '${entity?.username ?? '-'}@163.com',
                        ),
                        _PDFText(
                          title: "期望薪资",
                          value: '${entity?.username ?? '-'}@163.com',
                        ),
                        _PDFText(
                          title: "期望城市",
                          value: '${entity?.username ?? '-'}@163.com',
                        ),
                        TitleCell(title: "资格证书"),
                        pw.Text(
                          "计算机二级",
                          style: pw.TextStyle(
                            fontWeight: fontWeight,
                            color: valueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Partition(
                  flex: 2,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      TitleCell(title: "个人优势", padding: false),
                      pw.SizedBox(height: 10),
                      pw.Text(advantages?.advantageContents ?? '-'),
                      TitleCell(title: "工作经历"),
                      RowCell(
                        title: "上海赢家枯有限责任公司",
                        value2: "flutter 开发工程师",
                        time: "2021.12-至今",
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "内容:",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(education?.graduatedSchool ?? '-'),
                      pw.Text(
                        "业绩:",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                          "如何沿着主轴放置。如何沿着主轴放置final MainAxisAlignment mainAxisAlignment;final List<_MultiPageInstance> _pages = <_MultiPageInstance>[];/// 在引发错误之前允许的最大页数。 /// 在Release build中不检查这个。final int maxPages;"),
                      pw.SizedBox(height: 20),
                      RowCell(
                        title: "上海赢家枯有限责任公司",
                        value2: "flutter 开发工程师",
                        time: "2021.12-至今",
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "内容:",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                          "/// 孩子们应该如何沿着十字轴放置。final CrossAxisAlignment crossAxisAlignment;final BuildCallback? header;/// 一个页面页脚的生成器。final BuildCallback? footer;/// 孩子们应该如何沿着主轴放置。final MainAxisAlignment mainAxisAlignment;final List<_MultiPageInstance> _pages = <_MultiPageInstance>[];/// 在引发错误之前允许的最大页数。 /// 在Release build中不检查这个。final int maxPages;"),
                      pw.Text(
                        "业绩:",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                          "如何沿着主轴放置。如何沿着主轴放置final MainAxisAlignment mainAxisAlignment;final List<_MultiPageInstance> _pages = <_MultiPageInstance>[];/// 在引发错误之前允许的最大页数。 /// 在Release build中不检查这个。final int maxPages;"),
                      TitleCell(title: "项目经历"),
                      RowCell(
                        title: "上海赢家枯有限责任公司",
                        value2: "flutter 开发工程师",
                        time: "2021.12-至今",
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "内容:",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(education?.graduatedSchool ?? '-'),
                      pw.Text(
                        "业绩:",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                          "如何沿着主轴放置。如何沿着主轴放置final MainAxisAlignment mainAxisAlignment;final List<_MultiPageInstance> _pages = <_MultiPageInstance>[];/// 在引发错误之前允许的最大页数。 /// 在Release build中不检查这个。final int maxPages;"),
                      pw.SizedBox(height: 20),
                      RowCell(
                        title: "上海赢家枯有限责任公司",
                        value2: "flutter 开发工程师",
                        time: "2021.12-至今",
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        "内容:",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                          "/// 孩子们应该如何沿着十字轴放置。final CrossAxisAlignment crossAxisAlignment;final BuildCallback? header;/// 一个页面页脚的生成器。final BuildCallback? footer;/// 孩子们应该如何沿着主轴放置。final MainAxisAlignment mainAxisAlignment;final List<_MultiPageInstance> _pages = <_MultiPageInstance>[];/// 在引发错误之前允许的最大页数。 /// 在Release build中不检查这个。final int maxPages;"),
                      pw.Text(
                        "业绩:",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                          "如何沿着主轴放置。如何沿着主轴放置final MainAxisAlignment mainAxisAlignment;final List<_MultiPageInstance> _pages = <_MultiPageInstance>[];/// 在引发错误之前允许的最大页数。 /// 在Release build中不检查这个。final int maxPages;"),
                      TitleCell(title: "教育经历"),
                      RowCell(
                          title: education?.graduatedSchool ?? '-',
                          value: education?.education ?? '-',
                          valueBool: true,
                          value2: education?.profession ?? '-',
                          time: education?.period ?? '-'),
                    ],
                  ),
                )
              ])
            ]),
  );
  return pdf.save();
}

Future<pw.PageTheme> _myPageTheme(PdfPageFormat format) async {
  final bgShape = await rootBundle.loadString(ImgAsset.resume);

  format = format.applyMargin(
      left: 2.0 * PdfPageFormat.cm,
      top: 2.0 * PdfPageFormat.cm,
      right: 2.0 * PdfPageFormat.cm,
      bottom: 2.0 * PdfPageFormat.cm);
  return pw.PageTheme(
    pageFormat: format,
    theme: pw.ThemeData.withFont(
      bold: pw.Font.ttf(await rootBundle.load('assets/fonts/bold.ttf')),
      base: pw.Font.ttf(await rootBundle.load('assets/fonts/light.ttf')),
      icons: await PdfGoogleFonts.materialIcons(),
    ),
    buildBackground: (pw.Context context) {
      return pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned(
              child: pw.SvgImage(svg: bgShape),
              left: 0,
              top: 0,
            ),
            pw.Positioned(
              child: pw.Transform.rotate(
                  angle: pi, child: pw.SvgImage(svg: bgShape)),
              right: 0,
              bottom: 0,
            ),
          ],
        ),
      );
    },
  );
}

class TitleCell extends pw.StatelessWidget {
  TitleCell({required this.title, this.fontSize, this.padding = true});
  final String title;
  final double? fontSize;
  final bool padding;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Padding(
      padding: padding == true
          ? const pw.EdgeInsets.only(top: 20, bottom: 10)
          : pw.EdgeInsets.zero,
      child: pw.Text(
        title,
        style: pw.TextStyle(
          fontSize: fontSize ?? 18,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
    );
  }
}

class _PDFText extends pw.StatelessWidget {
  _PDFText({required this.title, required this.value});
  final String title;
  final String value;
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.SizedBox(height: 3),
        pw.Text(
          title,
          style: pw.TextStyle(
            fontWeight: fontWeight,
            color: titleColor,
          ),
        ),
        pw.Text(
          value,
          style: pw.TextStyle(
            fontWeight: fontWeight,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}

class RowCell extends pw.StatelessWidget {
  RowCell({
    this.time,
    this.title,
    this.value,
    this.value2,
    this.valueBool = false,
  });
  final String? title;
  final String? value;
  final String? value2;
  final bool valueBool;
  final String? time;

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(children: [
      TitleCell(
        title: title ?? '-',
        fontSize: 14,
        padding: false,
      ),
      valueBool == true
          ? pw.Padding(
              padding: const pw.EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: pw.Text(value ?? '-'),
            )
          : pw.SizedBox(),
      pw.Expanded(
        child: pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
          pw.SizedBox(width: 5),
          pw.Text(value2 ?? '-'),
          pw.SizedBox(width: 5),
          pw.Text(time ?? '-'),
        ]),
      ),
    ]);
  }
}

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage(Map<String, dynamic>? args, {super.key}) : _args = args;
  final Map<String, dynamic>? _args;
  UserEntity? get entity => _args?['entity'];
  Advantages? get advantages => _args?['advantages'];
  EducationExperience? get education => _args?['education'];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: PdfPreview(
          pdfPreviewPageDecoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          scrollViewDecoration: const BoxDecoration(
            color: Color(0xFFF6F6F6),
          ),
          previewPageMargin: const EdgeInsets.only(bottom: 5),
          pdfFileName: "${entity?.nickname}的简历",
          canDebug: false,
          canChangePageFormat: false,
          allowPrinting: false,
          canChangeOrientation: false,
          build: (format) {
            return _generatePdf(
              format,
              entity,
              advantages,
              education,
            );
          }),
    );
  }
}
