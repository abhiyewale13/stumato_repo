

import 'package:stumato_march/widgets/text/src/cred_utils.dart';

/// Operations are made intentionally generic to allow for flexibility in tracing different types of operations.
/// Centrally, each service in DataDog cannot exceed 100 operation groups and 1000 resources per group.
/// You might even see overlaps where a particular trace could be classified under multiple groups.
/// Developers should use their discretion to choose the most appropriate group for their use case.
///
/// Keep iOS, Flutter and Web in sync with this file.
///
/// [IMP] resource names cannot exceed 1000 per operation group.
/// [IMP] operation names cannot exceed 100.
enum OperationGroups {
  /// PAGE_LOAD should be used when you want to trace the performance of loading a page or screen in your application.
  /// This could include the time taken to fetch data from the server, render the UI, etc.
  pageLoad,

  /// RESOURCE_LOAD should be used when you want to trace the performance of any resource loading operation in your application.
  /// This could be used when the other specific operation groups do not apply.
  resourceLoad,

  /// DATABASE_OPERATION should be used when you want to trace the performance of a database operation.
  /// This could include the time taken to execute a query, fetch results, write data, etc.
  databaseOperation,

  /// USER_INTERACTION should be used when you want to trace the performance of a user interaction.
  /// This could include the time taken to respond to a button click, process input, update the UI, etc.
  userInteraction,

  /// BACKGROUND_JOB should be used when you want to trace the performance of a background job or task.
  /// This could include the time taken to execute the job, process data, etc.
  backgroundJob,

  /// Lifecycle-related activities such as fragment and activity lifecycle events.
  lifecycle,

  /// Should be used for navigation related traces, for example user navigates from one screen to another.
  navigationTrace,

  /// Default value for operation group
  /// METHOD_TRACE should be used when you want to trace the performance of a specific method or function in your code.
  /// This could include the time taken to execute the method, process data, return a result, etc.
  methodTrace,

  /// Temporary operation group for all web traces
  webTrace,

  /// Temporary operation group for all Flutter traces
  flutterTrace,
}

/// Converts the given [enumValue] from lower camel case to upper snake case.
extension OperationGroupsExtension on OperationGroups {
  String toUpperSnakeCase() {
    return name.toSnakeCase().toUpperCase();
  }
}
