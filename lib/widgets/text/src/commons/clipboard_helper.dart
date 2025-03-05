import 'dart:io';

import 'package:stumato_march/widgets/text/src/pigeons/messages.pigeon.dart';
import 'package:stumato_march/widgets/text/src/safe/safe_ops.dart';

class ClipboardHelper implements ClipboardInterface {
  late final _interface = ClipboardInterface();

  @override
  Future<HostClipboardData?> getClipboardData() async {
    if (!Platform.isAndroid) return null;
    return await safeFuture(() => _interface.getClipboardData());
  }

  Future<DateTime?> lastCopiedTime() async {
    if (!Platform.isAndroid) return null;
    final clipboardData = await getClipboardData();
    var copiedAtInMillis = clipboardData?.copiedAtInMillis;
    if (copiedAtInMillis == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(copiedAtInMillis);
  }
}
