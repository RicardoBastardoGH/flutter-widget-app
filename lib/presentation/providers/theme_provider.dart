import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores para el tema
final colorListProvider = Provider((ref) => colorList);

// Boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Color
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Para objetos y clases / AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>( 
  ((ref) => ThemeNotifier())
);


// controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme>{
  
  // STATE = Estado = Nueva instancia de AppTheme 
  ThemeNotifier(): super(AppTheme()) ;

  void toggleDarkMode() => {
    state = state.copyWith(isDarkMode: !state.isDarkMode)
  };  

  void changeColorIndex(int colorIndex) => {
    state = state.copyWith(selectedColor: colorIndex)
  };
  // void changeColorIndex(int colorIndex) => state = state.changeColorIndex(colorIndex);

}

