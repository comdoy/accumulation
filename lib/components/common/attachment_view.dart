//
//  AttachmentView.dart
//
//
//  Created by xbwca on 2023/03/21.
//  Copyright © 2022年 xbwca. All rights reserved.
//

import 'package:accumulation/components/components.dart';
import 'package:accumulation/components/i-toast/i_toast.dart';
import 'package:accumulation/utils/src/file_utils.dart';
import 'package:accumulation/utils/utils_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

/// 附件展示小组件，提供预览(下载)文件等功能，可以用在任何地方
/// 建议底部弹窗展示，比较优雅~
class AttachmentView extends StatefulWidget {
  const AttachmentView(this.attachments, this.type, {Key? key})
      :super(key: key);

  final String attachments;

  /// 文件类型，see also [AttachmentType]
  final String type;

  @override
  State<StatefulWidget> createState() => _AttachmentViewState();
}

class _AttachmentViewState extends State<AttachmentView> {
  late Future _future;

  /// [attachments]在本地是否存在的结果集
  List<bool> exists = [];

  Future _init() async {
      var path = await FileUtils.exists(widget.attachments, widget.type);
      exists.add(path != null);
    
  }

  @override
  void initState() {
    super.initState();
    _future = _init.call();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (_, snapshot) {
        if ([ConnectionState.waiting, ConnectionState.none]
            .contains(snapshot.connectionState)) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 200),
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        return Column(
          children: List.generate(
            widget.attachments.length,
            (idx) => AttachmentListCell(
              item: widget.attachments[idx],
              exists: exists[idx],
              type: widget.type,
            ),
          ),
        );
      },
    );
  }
}

class AttachmentListCell extends StatefulWidget {
  const AttachmentListCell({
    Key? key,
    required this.exists,  
    required this.item,
    required this.type,
  }) : super(key: key);

  final String item;

  final bool exists;

  final String type;

  @override
  State<StatefulWidget> createState() => AttachmentListCellState();
}

class AttachmentListCellState extends State<AttachmentListCell> {
  final _downloadNotifier = ValueNotifier(false);

  bool _isDownloaded = false;

  void _onTap() async {
    try {
      var filePath = await FileUtils.getPath(widget.item, widget.type);
      if (!widget.exists) {
        if (_downloadNotifier.value) return;
        if (!_isDownloaded) {
          _downloadNotifier.value = true;
          var file = await FileUtils.download(widget.item, widget.type);
          _isDownloaded = true;
          _downloadNotifier.value = false;
          await OpenFile.open(file?.path);
          return;
        }
      }
      await OpenFile.open(filePath);
    } catch (e) {
      _downloadNotifier.value = false;
      IToast.show("文件已损坏或丢失");
    }
  }

  String? getFileType(String? image) {
    if (image != null) {
      return image.split('.').last;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            INetworkImage(
                    placeholder: ImgAsset.image64,
                    image: Utils.imgUrl(
                      image: widget.item,
                    ),
                    height: 48,
                    width: 48,
                    borderRadius: 8,
                  ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  
                  
                ],
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _downloadNotifier,
              builder: (_, val, child) {
                return Offstage(
                  offstage: widget.exists || _isDownloaded,
                  child: val
                      ? const CupertinoActivityIndicator(
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.arrow_circle_down,
                          color: Colors.blueAccent,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
