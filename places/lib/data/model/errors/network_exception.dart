
import 'package:places/ui/res/strings.dart';

class NetworkException implements Exception {
  String messageName;
  String errorCode;
  String methodName;

  NetworkException(this.messageName, this.errorCode, this.methodName);

  @override
  String toString() {
    return apiException.replaceFirst("{0}", this.methodName)
        .replaceFirst("{1}", this.errorCode)
        .replaceFirst("{2}", this.messageName);
  }
}