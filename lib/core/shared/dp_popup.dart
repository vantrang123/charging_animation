import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class DPPopup extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<Widget> actions;
  final double _iconSize = 20;
  final bool isActiveIconClose;

  const DPPopup({
    super.key,
    this.title = '',
    required this.subTitle,
    this.actions = const [],
    this.isActiveIconClose = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(16),
      iconPadding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      titlePadding: const EdgeInsets.only(left: 16, right: 16),
      contentPadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      icon: isActiveIconClose
          ? Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, size: _iconSize),
              ),
            )
          : const SizedBox.shrink(),
      title: title.isEmpty ? null : Text(title, textAlign: TextAlign.left),
      content: Text(subTitle, textAlign: TextAlign.left),
      actions: actions.isEmpty ? null : [Row(children: actions)],
    );
  }
}

Future<T?> showDialogHelper<T extends Object?>(
  BuildContext context, {
  String? title = '',
  required String subTitle,
  bool isActiveIconClose = false,
  List<Widget> actions = const [],
}) {
  return showAnimatedDialog<T?>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: DPPopup(
          title: title ?? '',
          subTitle: subTitle,
          actions: actions,
          isActiveIconClose: isActiveIconClose,
        ),
      );
    },
    animationType: DialogTransitionType.scale,
    curve: Curves.fastOutSlowIn,
  );
}
