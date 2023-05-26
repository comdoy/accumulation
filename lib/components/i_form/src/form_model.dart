import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormModel {
  FormModel({
    required this.key,
    this.label,
    this.valueKey = 'name',
    this.noteText,
    this.unit,
    this.overflow = false,
    var this.value,
    this.flexes = const [1, 2],
    String? placeholder,
    bool? autofocus,
    bool? required,
    bool? readOnly,
    bool? hidden,
    this.extKey,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    this.inputFormatters,
  })  : autofocus = autofocus ?? false,
        required = required ?? false,
        readOnly = readOnly ?? false,
        textInputAction = textInputAction ?? TextInputAction.next,
        placeholder = placeholder ?? "请输入",
        assert(flexes.length > 1, "表单项左右比例必须为两个正整数");

  /// 表单项在表单数据(键值对数据)中的键名,如 name,jobId...
  final String key;

  /// 表单项在[IFormState.ext]中对应的键名,默认是从[key]里截取，如`jobId` -> `job`.
  final String? extKey;

  /// 表单项左侧文本
  final String? label;

  /// 当[value]为json数据时,界面显示的数据在[value]中的键名
  /// 默认`name`,界面显示的数据即为value['name']
  final String valueKey;

  /// 提示文本
  final String? noteText;

  /// 键盘右下角按钮事件类型
  final TextInputAction? textInputAction;

  /// 格式化
  final List<TextInputFormatter>? inputFormatters;

  /// 单位,当[type]为[IFormCellType.INPUT]时有效
  final String? unit;

  /// 表单项初始值,进行`update`操作时需要把旧数据作为初始值注入到表单项
  /// 如果旧数据类型是String,num,I18NFieldDict(以及其子类),直接传入即可
  /// 如果是实体类对象,如(Ship),务必转json传入,并且界面显示的数据为json的name值
  /// IF [type] is [IFormCellType.switch],value默认值为false
  /// 当然这样约定可能不满足需求,比如界面应显示的数据不是json的name值,可传入参数[valueKey],界面显示的数据即为json[valueKey].
  /// See also: [IFormCellWidgetState.valueText]
  dynamic value;

  /// 自动获取焦点
  final bool autofocus;

  /// 表单项是否必填,默认false
  final bool required;

  /// 表单项只读
  final bool readOnly;

  ///是否隐藏溢出字体
  final bool overflow;

  /// 输入框提示文本
  final String? placeholder;

  /// 自定义表单项左右比例
  final List<int> flexes;
}
