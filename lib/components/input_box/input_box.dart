import 'package:flutter/material.dart';

class TextFieldCell extends StatelessWidget {
  const TextFieldCell({
    super.key,
    this.prefixIcon,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.hintText,
    this.onClear,
    this.offstage = true,
    this.onChanged,
    this.onSubmitted,
  });
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final String? hintText;

  /// 取消搜索
  final VoidCallback? onClear;
  final bool offstage;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        focusNode: focusNode,
        textInputAction: textInputAction,
        style: TextStyle(fontSize: 14,color: Theme.of(context).cardColor),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.only(left: 10),
          prefixIconConstraints: const BoxConstraints(minWidth: 35),
          hintText: hintText ?? "请输入",
          hintStyle: TextStyle(
            fontSize: 14,
            color: Theme.of(context).cardColor,
          ),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          suffixIconConstraints: const BoxConstraints(maxWidth: 40),
          suffixIcon: Offstage(
            offstage: offstage, //清除按钮
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 5),
              child: GestureDetector(
                onTap: onClear,
                child: Icon(
                  Icons.clear,
                  size: 20,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted);
  }
}

class SearchFrom extends StatefulWidget {
  const SearchFrom(
    this.context,
    this.textController,
    this.focusNode, {
    super.key,
    this.onClear,
    this.searched,
    this.prefixIcon,
  });
  final BuildContext context;
  final TextEditingController textController;
  final FocusNode focusNode;

  final Widget? prefixIcon;

  /// 取消搜索
  final VoidCallback? onClear;

  final bool? searched;

  @override
  State<SearchFrom> createState() => _SearchFromState();
}

class _SearchFromState extends State<SearchFrom> {
  bool hiddenCleanIcon = true;

  bool? _searched;
  void onChanged(String? value) {
    _searched = widget.searched;

    bool isEmpty = value == '' || value?.isEmpty == true;
    if (hiddenCleanIcon == true) {
      if (!isEmpty) {
        setState(() {
          hiddenCleanIcon = false;
        });
      }
    } else {
      if (_searched == false && isEmpty) {
        setState(() {
          hiddenCleanIcon = true;
        });
      }
    }
    if (_searched == true && isEmpty) {
      setState(() {
        onClear();
      });
    }
  }

  void onClear() {
    _searched = widget.searched;
    hiddenCleanIcon = true;
    widget.textController.clear();
    if (_searched == false) {
      setState(() {});
      return;
    }
    if (_searched == true) {
      setState(() {
        widget.onClear?.call();
        Future.delayed(const Duration(milliseconds: 250), () {
          widget.focusNode.requestFocus();
        });
      });
    }
    _searched = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxHeight: 40),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).cardColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).focusColor.withOpacity(0.06)),
        child: TextFieldCell(
          prefixIcon: widget.prefixIcon,
          controller: widget.textController,
          focusNode: widget.focusNode,
          textInputAction: TextInputAction.next,
          offstage: widget.textController.text.isNotEmpty == true
              ? false
              : hiddenCleanIcon == true,
          onClear: onClear,
          onChanged: onChanged,
        ));
  }
}

class FieldViewCell extends StatefulWidget {
  ///搜索导航栏
  const FieldViewCell(
    this.context,
    this.textController,
    this.focusNode,
    this.onFieldSubmitted, {
    super.key,
    this.hintText,
    this.onSearch,
    this.onClear,
    this.searched,
  });
  final BuildContext context;
  final TextEditingController textController;
  final FocusNode focusNode;
  final VoidCallback onFieldSubmitted;

  ///搜索提示
  final String? hintText;

  /// 搜索按钮
  final ValueCallback? onSearch;

  /// 取消搜索
  final VoidCallback? onClear;

  final bool? searched;

  @override
  State<FieldViewCell> createState() => _FieldViewCellState();
}

class _FieldViewCellState extends State<FieldViewCell> {
  bool hiddenCleanIcon = true;

  bool? _searched;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 350), () {
      widget.focusNode.requestFocus();
    });
    super.initState();
  }

  void onChanged(String? value) {
    _searched = widget.searched;

    bool isEmpty = value == '' || value?.isEmpty == true;
    if (hiddenCleanIcon == true) {
      if (!isEmpty) {
        setState(() {
          hiddenCleanIcon = false;
        });
      }
    } else {
      if (_searched == false && isEmpty) {
        setState(() {
          hiddenCleanIcon = true;
        });
      }
    }
    if (_searched == true && isEmpty) {
      setState(() {
        onClear();
      });
    }
  }

  void onClear() {
    _searched = widget.searched;
    hiddenCleanIcon = true;
    widget.textController.clear();
    if (_searched == false) {
      setState(() {});
      return;
    }
    if (_searched == true) {
      setState(() {
        widget.onClear?.call();
        Future.delayed(const Duration(milliseconds: 250), () {
          widget.focusNode.requestFocus();
        });
      });
    }
    _searched = false;
  }

  TextStyle? get actionStyle {
    return widget.textController.text.isNotEmpty == true
        ? const TextStyle(color: null)
        : const TextStyle(color: Colors.grey);
  }

  void onSubmitted(String? val) {
    FocusManager.instance.primaryFocus?.unfocus();
    widget.onSearch?.call(val);
    _searched == true;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxHeight: 35),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).cardColor,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).focusColor.withOpacity(0.06)),
            child: TextFieldCell(
                controller: widget.textController,
                focusNode: widget.focusNode,
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).hintColor,
                  size: 16,
                ),
                textInputAction: TextInputAction.search,
                hintText: widget.hintText ?? "请输入关键字",
                offstage: widget.textController.text.isNotEmpty == true
                    ? false
                    : hiddenCleanIcon == true,
                onClear: onClear,
                onChanged: onChanged,
                onSubmitted: widget.textController.text.trim().isEmpty == true
                    ? null
                    : onSubmitted),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: AbsorbPointer(
            absorbing: widget.textController.text.trim().isEmpty,
            child: TextButton(
                child: Text(
                  "搜索",
                  style: actionStyle,
                ),
                onPressed: () => onSubmitted(widget.textController.text)),
          ),
        ),
      ],
    );
  }
}

typedef ValueCallback<T, S> = T Function(S);
