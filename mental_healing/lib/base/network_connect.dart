// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:mental_healing/import.dart';

class NetWorkController extends BaseController {
  /// Connect wifi/4g
  RxBool isConnectRx = RxBool(true);

  /// Connected internet
  RxBool isConnectedRx = RxBool(true);

  bool get isConnected => isConnectedRx.value;

  bool connectionStateStatus = false;
  final Connectivity connectivity = Connectivity();
  // ignore: cancel_subscriptions
  late final StreamSubscription<ConnectivityResult> connectivitySubscription;
  @override
  Future<void> onInit() async {
    isConnectedRx.value = await DataConnectionChecker().hasConnection;
    isConnectRx.value = isConnectedRx.value;
    isConnectedRx.listen((isConnected) {});
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.onInit();
  }

  // @override
  // void onClose() {
  //   connectivitySubscription.cancel();
  //   super.onClose();
  // }

  Future<void> popWithInternet() async {
    ConnectivityResult result;
    showLoading();
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException {
      result = ConnectivityResult.none;
    }

    _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    final bool newState = result != ConnectivityResult.none;

    if (newState == connectionStateStatus) {
      1.seconds.delay(() => hideLoading());
      return;
    }

    connectionStateStatus = newState;
    isConnectRx.value = connectionStateStatus;

    try {
      isConnectedRx.value = await DataConnectionChecker().hasConnection;
    } catch (error) {
      isConnectedRx.value = false;
    }
    1.seconds.delay(() => hideLoading());
  }
}

class NetWorkConnect extends BaseScreen<NetWorkController> with BaseMixin {
  NetWorkConnect({Key? key, this.child, this.showUi = true}) : super(key: key);
  final bool showUi;
  final Widget? child;

  @override
  Widget builder() {
    return showUi
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: color.backgroundColor,
            body: Stack(
              children: <Widget>[
                child ?? const SizedBox(),
                Obx(() {
                  return Visibility(
                    visible: !controller.isConnectRx.value,
                    child: Visibility(
                      visible: !controller.isConnectedRx.value,
                      child: NoInternetDialog(
                        onPress: controller.popWithInternet,
                      ),
                    ),
                  );
                })
              ],
            ),
          )
        : Obx(
            () => controller.isConnectRx.value ? child! : const SizedBox(),
          );
  }

  @override
  NetWorkController? putController() {
    return NetWorkController();
  }
}

class NoInternetDialog extends StatelessWidget with BaseMixin {
  const NoInternetDialog({Key? key, required this.onPress}) : super(key: key);
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(
                      //   AssetImages.noInternet,
                      //   width: 147,
                      //   height: 148,
                      // ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'No Internet Connection',
                        textAlign: TextAlign.center,
                        style: textStyle.bold(size: 17, color: color.black),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        'Please connect to a mobile or Wifi network.',
                        textAlign: TextAlign.center,
                        style: textStyle.medium(size: 14, color: color.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Represents the status of the data connection.
/// Returned by [DataConnectionChecker.connectionStatus]
enum DataConnectionStatus {
  disconnected,
  connected,
}

/// This is a singleton that can be accessed like a regular constructor
/// i.e. DataConnectionChecker() always returns the same instance.
class DataConnectionChecker {
  /// This is a singleton that can be accessed like a regular constructor
  /// i.e. DataConnectionChecker() always returns the same instance.
  // factory DataConnectionChecker() => _instance;
  DataConnectionChecker() {
    // immediately perform an initial check so we know the last status?
    // connectionStatus.then((status) => _lastStatus = status);

    // start sending status updates to onStatusChange when there are listeners
    // (emits only if there's any change since the last status update)
    _statusController.onListen = () {
      _maybeEmitStatusUpdate();
    };
    // stop sending status updates when no one is listening
    _statusController.onCancel = () {
      _timerHandle?.cancel();
      _lastStatus = null; // reset last status
    };
  }

  /// More info on why default port is 53
  /// here:
  /// - https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
  /// - https://www.google.com/search?q=dns+server+port
  static const int DEFAULT_PORT = 53;

  /// Default timeout is 10 seconds.
  ///
  /// Timeout is the number of seconds before a request is dropped
  /// and an address is considered unreachable
  static const Duration DEFAULT_TIMEOUT = Duration(seconds: 10);

  /// Default interval is 10 seconds
  ///
  /// Interval is the time between automatic checks
  static const Duration DEFAULT_INTERVAL = Duration(seconds: 10);

  /// Predefined reliable addresses. This is opinionated
  /// but should be enough. See https://www.dnsperf.com/#!dns-resolvers
  ///
  /// Addresses info:
  ///
  /// <!-- kinda hackish ^_^ -->
  /// <style>
  /// table {
  ///   width: 100%;
  ///   border-collapse: collapse;
  /// }
  /// th, td { padding: 5px; border: 1px solid lightgrey; }
  /// </style>
  ///
  /// | Address        | Provider   | Info                                            |
  /// |:---------------|:-----------|:------------------------------------------------|
  /// | 1.1.1.1        | CloudFlare | https://1.1.1.1                                 |
  /// | 1.0.0.1        | CloudFlare | https://1.1.1.1                                 |
  /// | 8.8.8.8        | Google     | https://developers.google.com/speed/public-dns/ |
  /// | 8.8.4.4        | Google     | https://developers.google.com/speed/public-dns/ |
  /// | 208.67.222.222 | OpenDNS    | https://use.opendns.com/                        |
  /// | 208.67.220.220 | OpenDNS    | https://use.opendns.com/                        |
  static final List<AddressCheckOptions> DEFAULT_ADDRESSES = List.unmodifiable([
    AddressCheckOptions(
      InternetAddress('1.1.1.1'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('8.8.4.4'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('208.67.222.222'),
      port: DEFAULT_PORT,
      timeout: DEFAULT_TIMEOUT,
    ),
  ]);

  /// A list of internet addresses (with port and timeout) to ping.
  ///
  /// These should be globally available destinations.
  /// Default is [DEFAULT_ADDRESSES].
  ///
  /// When [hasConnection] or [connectionStatus] is called,
  /// this utility class tries to ping every address in this list.
  ///
  /// The provided addresses should be good enough to test for data connection
  /// but you can, of course, supply your own.
  ///
  /// See [AddressCheckOptions] for more info.
  List<AddressCheckOptions> addresses = DEFAULT_ADDRESSES;
  // ignore: unused_field
  static final DataConnectionChecker _instance = DataConnectionChecker();

  /// Ping a single address. See [AddressCheckOptions] for
  /// info on the accepted argument.
  Future<AddressCheckResult> isHostReachable(
    AddressCheckOptions options,
  ) async {
    Socket? sock;
    try {
      sock = await Socket.connect(
        options.address,
        options.port,
        timeout: options.timeout,
      );
      sock.destroy();
      return AddressCheckResult(options, true);
    } catch (e) {
      sock?.destroy();
      return AddressCheckResult(options, false);
    }
  }

  /// Returns the results from the last check.
  ///
  /// The list is populated only when [hasConnection]
  /// (or [connectionStatus]) is called.
  List<AddressCheckResult> get lastTryResults => _lastTryResults;
  List<AddressCheckResult> _lastTryResults = <AddressCheckResult>[];

  /// Initiates a request to each address in [addresses].
  /// If at least one of the addresses is reachable
  /// we assume an internet connection is available and return `true`.
  /// `false` otherwise.
  Future<bool> get hasConnection async {
    final List<Future<AddressCheckResult>> requests = [];

    for (final addressOptions in addresses) {
      requests.add(isHostReachable(addressOptions));
    }
    _lastTryResults = List.unmodifiable(await Future.wait(requests));

    return _lastTryResults.map((result) => result.isSuccess).contains(true);
  }

  /// Initiates a request to each address in [addresses].
  /// If at least one of the addresses is reachable
  /// we assume an internet connection is available and return `true`
  /// [DataConnectionStatus.connected].
  /// [DataConnectionStatus.disconnected] otherwise.
  Future<DataConnectionStatus> get connectionStatus async {
    return await hasConnection
        ? DataConnectionStatus.connected
        : DataConnectionStatus.disconnected;
  }

  /// The interval between periodic checks. Periodic checks are
  /// only made if there's an attached listener to [onStatusChange].
  /// If that's the case [onStatusChange] emits an update only if
  /// there's change from the previous status.
  ///
  /// Defaults to [DEFAULT_INTERVAL] (10 seconds).
  Duration checkInterval = DEFAULT_INTERVAL;

  // Checks the current status, compares it with the last and emits
  // an event only if there's a change and there are attached listeners
  //
  // If there are listeners, a timer is started which runs this function again
  // after the specified time in 'checkInterval'
  Future<void> _maybeEmitStatusUpdate() async {
    // just in case
    _timerHandle?.cancel();
    // timer.cancel();

    final currentStatus = await connectionStatus;

    // only send status update if last status differs from current
    // and if someone is actually listening
    if (_lastStatus != currentStatus && _statusController.hasListener) {
      _statusController.add(currentStatus);
    }

    // start new timer only if there are listeners
    if (!_statusController.hasListener) {
      return;
    }
    _timerHandle = Timer(checkInterval, _maybeEmitStatusUpdate);

    // update last status
    _lastStatus = currentStatus;
  }

  // _lastStatus should only be set by _maybeEmitStatusUpdate()
  // and the _statusController's.onCancel event handler
  DataConnectionStatus? _lastStatus;
  Timer? _timerHandle;

  // netWorkController for the exposed 'onStatusChange' Stream
  final StreamController<DataConnectionStatus> _statusController =
      StreamController.broadcast();

  /// Subscribe to this stream to receive events whenever the
  /// [DataConnectionStatus] changes. When a listener is attached
  /// a check is performed immediately and the status ([DataConnectionStatus])
  /// is emitted. After that a timer starts which performs
  /// checks with the specified interval - [checkInterval].
  /// Default is [DEFAULT_INTERVAL].
  ///
  /// *As long as there's an attached listener, checks are being performed,
  /// so remember to dispose of the subscriptions when they're no longer needed.*
  ///
  /// Example:
  ///
  /// ```dart
  /// var listener = DataConnectionChecker().onStatusChange.listen((status) {
  ///   switch(status) {
  ///     case DataConnectionStatus.connected:
  ///       print('Data connection is available.');
  ///       break;
  ///     case DataConnectionStatus.disconnected:
  ///       print('You are disconnected from the internet.');
  ///       break;
  ///   }
  /// });
  /// ```
  ///
  /// *Note: Remember to dispose of any listeners,
  /// when they're not needed anymore,
  /// e.g. in a* `StatefulWidget`'s *dispose() method*
  ///
  /// ```dart
  /// ...
  /// @override
  /// void dispose() {
  ///   listener.cancel();
  ///   super.dispose();
  /// }
  /// ...
  /// ```
  ///
  /// For as long as there's an attached listener, requests are
  /// being made with an interval of `checkInterval`. The timer stops
  /// when an automatic check is currently executed, so this interval
  /// is a bit longer actually (the maximum would be `checkInterval` +
  /// the maximum timeout for an address in `addresses`). This is by design
  /// to prevent multiple automatic calls to `connectionStatus`, which
  /// would wreck havoc.
  ///
  /// You can, of course, override this behavior by implementing your own
  /// variation of time-based checks and calling either `connectionStatus`
  /// or `hasConnection` as many times as you want.
  ///
  /// When all the listeners are removed from `onStatusChange`, the internal
  /// timer is cancelled and the stream does not emit events.
  Stream<DataConnectionStatus> get onStatusChange => _statusController.stream;

  /// Returns true if there are any listeners attached to [onStatusChange]
  bool get hasListeners => _statusController.hasListener;

  /// Alias for [hasListeners]
  bool get isActivelyChecking => _statusController.hasListener;
}

/// This class should be pretty self-explanatory.
/// If [AddressCheckOptions.port]
/// or [AddressCheckOptions.timeout] are not specified, they both
/// default to [DataConnectionChecker.DEFAULT_PORT]
/// and [DataConnectionChecker.DEFAULT_TIMEOUT]
/// Also... yeah, I'm not great at naming things.
class AddressCheckOptions {
  AddressCheckOptions(
    this.address, {
    this.port = DataConnectionChecker.DEFAULT_PORT,
    this.timeout = DataConnectionChecker.DEFAULT_TIMEOUT,
  });
  final InternetAddress address;
  final int port;
  final Duration timeout;

  @override
  String toString() => 'AddressCheckOptions($address, $port, $timeout)';
}

/// Helper class that contains the address options and indicates whether
/// opening a socket to it succeeded.
class AddressCheckResult {
  AddressCheckResult(
    this.options,
    // ignore: avoid_positional_boolean_parameters
    this.isSuccess,
  );

  final AddressCheckOptions options;
  final bool isSuccess;

  @override
  String toString() => 'AddressCheckResult($options, $isSuccess)';
}
