import 'dart:io';

import 'package:accumulation/components/body/body_mixin.dart';
import 'package:accumulation/request/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectionBloc with BodyMixin {
  ImageSelectionBloc(Map<String, dynamic>? args) : _args = args ?? {};
  final Map<String, dynamic> _args;
  String? get imageType => _args["image"];
  CroppedFile? croppedFile;
  XFile? pickedFiles;
  Image? image;

  void upload(BuildContext context) async {
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        croppedFile!.path,
        filename: 'file.jpg',
      ),
    });
    var url = await HomeRequest.postImages(formData: formData);
    
    if (context.mounted) {
      return Navigator.pop(context, {
        'images': url,
      });
    }
  }

  Future<void> uploadImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedFiles = pickedFile;
      if (context.mounted) {
        _cropImage(context);
      }
    }
    controller.withData(true);
  }

  Future<void> _cropImage(BuildContext context) async {
    if (pickedFiles != null) {
      final croppedFiles = await ImageCropper().cropImage(
        sourcePath: pickedFiles!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '剪裁',
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFiles != null) {
        croppedFile = croppedFiles;
      }
      if (croppedFile?.path != null) {
        image = Image.file(File(croppedFile!.path), fit: BoxFit.cover);
      }
      controller.withData(true);
    }
  }
}
