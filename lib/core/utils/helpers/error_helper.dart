import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_rxdart/core/shared/dp_popup.dart';

class ErrorHelper {
  final BuildContext _context;
  const ErrorHelper(this._context);

  Future handleError(Object object) async {
    debugPrint(object.toString());
    return object is DioException
        ? _handleNetworkError(object)
        : _defaultHandleError(object);
  }

  Future<dynamic> _handleNetworkError(DioException object) {
    return showDialogHelper(
      _context,
      subTitle: "Network error",
      actions: [
        Expanded(
          child: Builder(builder: (cContext) {
            return TextButton(
              onPressed: () {
                Navigator.pop(cContext);
              },
              child: const Text("OK"),
            );
          }),
        ),
      ],
    );
  }

  Future _defaultHandleError(object) async {
    return showDialogHelper(
      _context,
      subTitle: "System error",
      actions: [
        Expanded(
          child: TextButton(
            onPressed: () => Navigator.of(_context).pop(),
            child: const Text("OK"),
          ),
        ),
      ],
    );
  }
}
