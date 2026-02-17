// This file should not be exported as the APIs in it are meant for internal usage only

import 'dart:async' show StreamSubscription;

import 'package:web/web.dart';

import '../quill_controller.dart';

StreamSubscription? _webCopyEventSubscription;

extension QuillControllerWeb on QuillController {
  void initializeWebClipboardEvents() {
    _webCopyEventSubscription =
        EventStreamProviders.copyEvent.forTarget(window.document).listen((e) {
      clipboardSelection(true);
      e.preventDefault();
    });
  }

  void closeWebClipboardEvents() {
    _webCopyEventSubscription?.cancel();
    _webCopyEventSubscription = null;
  }
}
