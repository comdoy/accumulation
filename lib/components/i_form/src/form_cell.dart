import 'package:accumulation/components/i_form/src/form_model.dart';
import 'package:accumulation/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormCell extends StatefulWidget {
  const FormCell({super.key, this.formList});
  final List<FormModel>? formList;

  @override
  State<FormCell> createState() => _FormCellState();
}

class _FormCellState extends State<FormCell> {
  List<Widget> _columnCells = [];
  void _formListMap() {
    var c = widget.formList?.forEach((e) {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: _columnCells));
  }
}

class FormCellWidget extends StatefulWidget {
  const FormCellWidget({super.key, required this.item});
  final FormModel item;

  @override
  State<FormCellWidget> createState() => FormCellWidgetState();
}

class FormCellWidgetState extends State<FormCellWidget> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  String? errorMsg;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: const Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: _buildLabel()),
          Expanded(child: _buildTextField()),
        ],
      ),
    );
  }

  /// 表单项左边的label
  Widget _buildLabel() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 3,
          left: -8,
          child: Offstage(
            offstage: !widget.item.required,
            child: const Text('*', style: TextStyle(color: Colors.red)),
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.item.label,
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 15,
                ),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Offstage(
                  offstage: widget.item.noteText?.isEmpty ?? true,
                  child: Tooltip(
                    triggerMode: TooltipTriggerMode.tap,
                    showDuration: const Duration(milliseconds: 2000),
                    padding: const EdgeInsets.all(Globals.pad12),
                    margin: const EdgeInsets.symmetric(
                      horizontal: Globals.pad12,
                    ),
                    message: widget.item.noteText ?? '',
                    child: const Padding(
                      padding: EdgeInsets.only(left: Globals.pad12),
                      child: Icon(
                        CupertinoIcons.question_circle_fill,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    TextAlign textAlign = TextAlign.end,
    int? maxLength,
    int? maxLines,
    double? maxHeight,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight ?? double.infinity),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: textAlign,
        style: const TextStyle(fontSize: 15),
        maxLines: maxLines ?? 1,
        minLines: 1,
        maxLength: maxLength,
        inputFormatters: widget.item.inputFormatters,
        textInputAction: widget.item.textInputAction,
        onChanged: (val) => setState(() {
          errorMsg = null;
          widget.item.value = val.trim();
        }),
        decoration: InputDecoration(
          hintText: widget.item.placeholder,
          border: InputBorder.none,
          suffixIconConstraints: const BoxConstraints(maxWidth: 20),
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
          suffixIcon: Offstage(
            offstage: !focusNode.hasFocus || widget.item.readOnly,
            child: GestureDetector(
              onTap: () {
                controller.clear();
                widget.item.value = null;
              },
              child: const Icon(
                CupertinoIcons.clear_circled_solid,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
