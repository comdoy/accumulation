///
/// 服务器允许上传的文件扩展名
/// { 扩展名: MIME类型 }
class AllowedExtensions {
  const AllowedExtensions._();

  /// 图片
  static const Map<String, String> image = {
    'jpg': 'image/jpg',
    'jpeg': 'image/jpeg',
    'png': 'image/png',
    'gif': 'image/gif',
    'webp': 'image/webp',
    'bmp': 'image/bmp',
  };

  /// 文档
  static const Map<String, String> document = {
    'txt': 'text/plain',
    'doc': 'application/msword',
    'docx':
        'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'ppt': 'application/vnd.ms-powerpoint',
    'pptx':
        'application/vnd.openxmlformats-officedocument.presentationml.presentation',
    'xls': 'application/vnd.ms-excel',
    'xlsx': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    'pdf': 'application/pdf',
  };

  /// 音频
  static const Map<String, String> audio = {
    'mp3': 'audio/mpeg',
    'mid': 'audio/midi',
    'midi': 'audio/midi',
    'ogg': 'audio/ogg',
    'ape': 'audio/ape',
    'flac': 'audio/x-flac',
    'wav': 'audio/x-wav',
    'weba': 'audio/webm',
  };

  /// 视频
  static const Map<String, String> video = {
    'mp4': 'video/mp4',
    '3gp': 'video/3gpp',
    'avi': 'video/x-msvideo',
    'webm': 'video/webm',
    'flv': 'video/x-flv',
    'mkv': 'video/x-matroska',
  };

  /// 压缩文件
  static const Map<String, String> archive = {
    'zip': 'application/zip',
    'gz': 'application/gzip',
    'rar': 'application/x-rar-compressed',
    '7z': 'application/x7zcompressed',
    'xz': 'application/x-xz',
    'tar': 'application/x-tar',
    'tgz': 'application/x-tar',
  };

  static const Map<String, String> file = {
    ...image,
    ...document,
    ...audio,
    ...video,
    ...archive,
  };

  /// 获取服务器允许上传的所有文件MIME类型
  static List<String> get allowedExtensions =>
      file.keys.map((e) => '.$e').toList();
}
