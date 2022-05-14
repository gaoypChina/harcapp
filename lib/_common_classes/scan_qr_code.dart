import 'package:qrscan/qrscan.dart' as scanner;
/*
import 'package:qrcode_reader/qrcode_reader.dart';

Future<String> scanQrCode() => QRCodeReader()
    .setAutoFocusIntervalInMs(200)
    .setForceAutoFocus(true)
    .scan();

 */

Future<String?> scanQrCode() => scanner.scan();