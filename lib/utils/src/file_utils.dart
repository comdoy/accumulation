import 'dart:io';

import 'package:accumulation/utils/src/allowed_extensions.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  const FileUtils._();

  /// [data] 可以是含有文件扩展名的文件名或路径
  /// [size] 当然是图片大小啦
  static Widget buildFileIcon(String? data, [double size = 48]) {
    var type = data;
    var name = ImgAsset.unknownExt;
    if (AllowedExtensions.image.containsKey(type)) {
      name = ImgAsset.imageExt;
    } else if (AllowedExtensions.document.containsKey(type)) {
      switch (type) {
        case 'doc':
        case 'docx':
          name = ImgAsset.wordExt;
          break;
        case 'ppt':
        case 'pptx':
          name = ImgAsset.pptExt;
          break;
        case 'xls':
        case 'xlsx':
          name = ImgAsset.excel64;
          break;
        case 'pdf':
          name = ImgAsset.pdfExt;
          break;
        case 'txt':
          name = ImgAsset.txtExt;
          break;
      }
    } 
    // else if (AllowedExtensions.archive.containsKey(type)) {
    //   name = ImgAsset.archiveExt;
    // } else if (AllowedExtensions.video.containsKey(type)) {
    //   name = ImgAsset.videoExt;
    // } else if (AllowedExtensions.audio.containsKey(type)) {
    //   name = ImgAsset.audioExt;
    // }
    return Image.asset(name, width: size, height: size);
  }

  static Future<String> getPath(String item, String type) async {
    final storageDir = await getApplicationDocumentsDirectory();
    return "${storageDir.path}/download/$type/$item";
  }

  /// 下载文件
  static Future<File?> download(String item, String type) async {
    File? file;
    try {
      final storageDir = await getApplicationDocumentsDirectory();
      var filePath = "download/$type/$item";
      file = File('${storageDir.path}/$filePath');
      if (!file.existsSync()) {
        file = createFile(storageDir.path, filePath);
        if (file == null) return null;
        var response = await Dio().get(
          Utils.imgUrl(image: item)!,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
          ),
        );
        file.writeAsBytesSync(response.data);
      }
    } catch (e) {
      file?.deleteSync();
      rethrow;
    }
    return file;
  }

  /// 校验服务器文件在本地是否存在
  /// 存在返回文件绝对路径，否则返回null
  static Future<String?> exists(String item, String type) async {
    final storageDir = await getApplicationDocumentsDirectory();
    var filePath = "download/$type/$item";
    File? file = File('${storageDir.path}/$filePath');
    return file.existsSync() ? file.path : null;
  }

  /// 在指定目录下创建文件，务必保证[target]目录已经存在
  /// path的格式可以是：'dir1/dir11/dir111/xxx.xxx'
  static File? createFile(String target, String path) {
    var targetDir = Directory(target);
    if (!targetDir.existsSync()) return null;
    var dirs = path.split('/');
    for (var i = 0; i < dirs.length - 1; i++) {
      var dir = Directory('$target/${dirs[i]}');
      if (!dir.existsSync()) dir.createSync();
      target = dir.path;
    }
    var file = File('$target/${dirs.last}');
    file.createSync();
    return file;
  }
}
