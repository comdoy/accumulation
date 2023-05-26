import 'package:flutter/material.dart';
import 'toast.dart';
import 'i_overlay_entry.dart';

/// A [Stack] of entries that can be managed independently.
///
/// Overlays let independent child widgets "float" visual elements on top of
/// other widgets by inserting them into the overlay's [Stack]. The overlay lets
/// each of these widgets manage their participation in the overlay using
/// [OverlayEntry] objects.
class IOverlay extends StatefulWidget {
  final Widget? child;

  const IOverlay({
    Key? key,
    required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  IOverlayState createState() => IOverlayState();
}

class IOverlayState extends State<IOverlay> {
  late IOverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    _overlayEntry = IOverlayEntry(
      builders: (BuildContext context) => IToast.instance.w ?? Container(),
    );
    IToast.instance.overlayEntry = _overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          IOverlayEntry(
            builders: (BuildContext context) {
              if (widget.child != null) {
                return widget.child!;
              } else {
                return Container();
              }
            },
          ),
          _overlayEntry,
        ],
      ),
    );
  }
}
