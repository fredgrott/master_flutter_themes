



abstract class ThemeService {

  Future<void> init();

  Future<T> load<T>(String key, T defaultValue);

  
  Future<void> save<T>(String key, T value);

  Map<String, dynamic> getAll();

  Future<void> putAll(
    Map<String, dynamic> values, {
      bool clearExisting = true,
  });

  
  
  Future<void> clearAll();
}