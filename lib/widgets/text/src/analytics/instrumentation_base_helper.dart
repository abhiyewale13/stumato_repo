// ignore_for_file: avoid-dynamic
mixin InstrumentationBaseHelper {
  final Map<String, dynamic> _commonAttributes = <String, dynamic>{};

  void addCommonAttribute(String key, dynamic value) {
    _commonAttributes[key] = value;
  }

  Map<String, dynamic> get commonAttributes => _commonAttributes;

  void addCommonAttributes(Map<String, dynamic> attributes) {
    _commonAttributes.addAll(attributes);
  }

  void flushCommonAttributes() {
    _commonAttributes.clear();
  }

  void tagEvent(String eventName, {Map<String, dynamic>? attributes});
}
