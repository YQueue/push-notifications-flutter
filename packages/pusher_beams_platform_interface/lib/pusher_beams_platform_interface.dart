library pusher_beams_platform_interface;

import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:pusher_beams_platform_interface/method_channel_pusher_beams.dart';

typedef OnUserCallback = Function(String? error);
typedef OnInterestsChange = Function(List<String?> interests);
typedef OnMessageReceivedInTheForeground = Function(Map<Object?, Object?> data);
typedef OnBackgroundNotificationOpened = Function(Map<Object?, Object?> data);

abstract class PusherBeamsPlatform extends PlatformInterface {
  PusherBeamsPlatform() : super(token: _token);

  static final Object _token = Object();

  // NOTE: Remember to change .onInterestChanges and .setUserId last argument
  // and .getInitialMessage return type to dynamic on MethodChannel
  static PusherBeamsPlatform _instance = PusherBeamsApi();

  /// The default instance of [PusherBeamsPlatform] to use.
  ///
  /// Defaults to [DefaultPlatform].
  static PusherBeamsPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [PusherBeamsPlatform] when they register themselves.
  // https://github.com/flutter/flutter/issues/43368
  static set instance(PusherBeamsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> start(String instanceId) {
    throw UnimplementedError('start() has not been implemented.');
  }

  Future<dynamic> getInitialMessage() {
    throw UnimplementedError('getInitialMessage() has not been implemented.');
  }

  Future<void> addDeviceInterest(String interest) {
    throw UnimplementedError('addDeviceInterest() has not been implemented.');
  }

  Future<void> removeDeviceInterest(String interest) {
    throw UnimplementedError(
        'removeDeviceInterest() has not been implemented.');
  }

  Future<List<String?>> getDeviceInterests() {
    throw UnimplementedError('getDeviceInterests() has not been implemented.');
  }

  Future<void> setDeviceInterests(List<String> interests) {
    throw UnimplementedError('setDeviceInterests() has not been implemented.');
  }

  Future<void> clearDeviceInterests() {
    throw UnimplementedError(
        'clearDeviceInterests() has not been implemented.');
  }

  Future<void> onInterestChanges(OnInterestsChange callback) {
    throw UnimplementedError('onInterestChanges() has not been implemented.');
  }

  Future<void> setUserId(
      String userId, BeamsAuthProvider provider, OnUserCallback callback) {
    throw UnimplementedError('setUserId() has not been implemented.');
  }

  Future<void> clearAllState() {
    throw UnimplementedError('clearAllState() has not been implemented.');
  }

  Future<void> stop() {
    throw UnimplementedError('stop() has not been implemented.');
  }

  Future<void> onMessageReceivedInTheForeground(
      OnMessageReceivedInTheForeground callback) {
    throw UnimplementedError(
        'onMessageReceivedInTheForeground() has not been implemented.');
  }

  Future<void> onBackgroundNotificationOpened(
      OnBackgroundNotificationOpened callback) {
    throw UnimplementedError(
        'onBackgroundNotificationOpened() has not been implemented.');
  }
}
