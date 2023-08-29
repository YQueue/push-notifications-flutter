import 'package:pigeon/pigeon.dart';

class BeamsAuthProvider {
  String? authUrl;
  Map<String?, String?>? headers;
  Map<String?, String?>? queryParams;
  String? credentials; // web-only
}

@HostApi()
abstract class PusherBeamsApi {
  void start(String instanceId);

  @async
  Map<String, dynamic> getInitialMessage();

  void addDeviceInterest(String interest);

  void removeDeviceInterest(String interest);

  List<String> getDeviceInterests();

  void setDeviceInterests(List<String> interests);

  void clearDeviceInterests();

  void onInterestChanges(String callbackId);

  void setUserId(String userId, BeamsAuthProvider provider, String callbackId);

  void clearAllState();

  void onMessageReceivedInTheForeground(String callbackId);

  void onBackgroundNotificationOpened(String callbackId);

  void stop();
}

@FlutterApi()
abstract class CallbackHandlerApi {
  void handleCallback(String callbackId, String callbackName, List args);
}
