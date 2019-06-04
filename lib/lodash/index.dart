import 'dart:core';

dynamic get(Map map, String propertyChain, Object defaultValue) {
  List<String> properties = propertyChain.split(new RegExp("."));
  dynamic result = map;
  while(properties.length > 0) {
    String property = properties.removeAt(0);
    if(property != null) {
      if(result != null) {
        result = result[property];
      }
    }
  }
  if(defaultValue != null && result == null) return defaultValue;
  return result;
}