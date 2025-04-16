import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores para el tema
final colorListProvider = Provider((ref) => colorList);

// Boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Color
final selectedColorProvider = StateProvider<int>((ref) => 0);



