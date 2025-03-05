
import 'package:flutter/services.dart';
import 'package:stumato_march/widgets/text/src/analytics/operation_groups.dart';

///Attention: upto 5 attributes and  32 metrics are only supported in firebase.
class PerformanceTraceLogger {
  static const MethodChannel _channel = MethodChannel('PerformanceTraceLogger');

  static Future<void> abortTrace(String name) async {
    return await _channel.invokeMethod<void>('abortTrace', <String, String?>{'name': name});
  }

  static Future<String?> getAttribute(String name, String attribute) async {
    return await _channel
        .invokeMethod<String?>('getAttribute', <String, String?>{'name': name, 'attribute': attribute});
  }

  static Future<int?> getMetric(String name, String metric) async {
    return await _channel.invokeMethod<int?>('getMetric', <String, String?>{'name': name, 'metric': metric});
  }

  static Future<void> incrementMetric(String name, String metric, {int by = 1}) async {
    return await _channel
        .invokeMethod<void>('incrementMetric', <String, String?>{'name': name, 'metric': metric, 'by': by.toString()});
  }

  static Future<void> setAttribute(String name, String attribute, String value) async {
    return await _channel
        .invokeMethod<void>('setAttribute', <String, String?>{'name': name, 'attribute': attribute, 'value': value});
  }

  static Future<void> setMetric(String name, String metric, int value) async {
    return await _channel
        .invokeMethod<void>('setMetric', <String, String?>{'name': name, 'metric': metric, 'value': value.toString()});
  }

  static Future<void> startTrace(
    String name,
    Map<String, String>? attributes,
    Map<String, int>? metrics, {
    OperationGroups? operationGroupName,
  }) async {
    final operationGroupNameString = operationGroupName?.toUpperSnakeCase();
    return await _channel.invokeMethod<void>('startTrace', <String, dynamic>{
      'name': name,
      'attributes': attributes,
      'metrics': metrics,
      'operationGroupName': operationGroupNameString,
    });
  }

  static Future<void> stopTrace(String name) async {
    return await _channel.invokeMethod<void>('stopTrace', <String, String?>{'name': name});
  }
}
