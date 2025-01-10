import 'package:lvb_earth_admin/imports/imports.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Outfit',
  useMaterial3: true,
  primaryColor: AppColors.primaryColor,
  // Deep blue from your logo
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  // Clean background
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  ).copyWith(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    onPrimary: Colors.white,
    background: AppColors.backgroundColor,
    surface: AppColors.surfaceColor,
    error: AppColors.errorColor,
    onError: AppColors.onErrorColor,
    onSurface: AppColors.primaryTextColor,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: 'Outfit',
      color: AppColors.primaryTextColor,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Outfit',
      color: AppColors.primaryTextColor,
      fontSize: 18,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Outfit',
      color: AppColors.secondaryTextColor,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Outfit',
      color: AppColors.tertiaryTextColor,
      fontSize: 14,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Outfit',
      color: AppColors.captionTextColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadowColor: AppColors.shadowColor,
      elevation: 4,
      textStyle: const TextStyle(
        fontFamily: 'Outfit',
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.focusedBorderColor, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.borderColor, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.errorBorderColor, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    labelStyle: TextStyle(
      color: AppColors.primaryTextColor,
      fontFamily: 'Outfit',
    ),
    errorStyle: TextStyle(
      color: AppColors.errorColor,
      fontFamily: 'Outfit',
      fontSize: 12,
    ),
  ),
);
