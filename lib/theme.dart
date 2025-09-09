import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final Color backgroundColor = Color(0xFFFFFFFF); // White
  static final Color brandColor = Color(0xFF8985E9); // Medium Lavender
  static final Color lightBrandColor = Color(0xFF9591EB); // Lavender Blue
  static final Color darkBrandColor = Color(0xFF6E6ABA);
  static final Color successAlert = Color(0xFF12D18E); // Emerald Green
  static final Color warningAlert = Color(0xFFFACC15); // Amber / Golden Yellow
  static final Color errorAlert = Color(0xFFF75555); // Bright Red
  static final Color tabBarBackground = Color(0xFFF5F5F5);
  static final Color white = Colors.white;
  static final Map<String, Color> background = {
    'primary': Color(0XFFF6F5FD), // Ghost White
    'lite': Color(0xFFEEEEEE), // Platinum / Very Light Gray
  };

  static final Map<String, Color> textColor = {
    'dark': Color(0xFF212121), // Almost Black
    'darkLite': Color(0xFF616161), // Dim Gray
    'lite': Colors.white, // White
  };

  static final List<Color> goalColors = [
    Color(0xFF99C5C4), // Light Teal
    Color(0xFF99CCFF), // Baby Blue
    Color(0xFFCCCCFF), // Periwinkle
    Color(0xFFCCFFCC), // Tea Green / Mint
    Color(0xFFFF9899), // Light Coral
    Color(0xFFFF99CC), // Pink
    Color(0xFFFFCC99), // Peach
    Color(0xFFFFCCCC), // Misty Rose
    Color(0xFFCC99FF), // Lavender / Violet
    Color(0xFFCCFF99), // Light Lime Green
    Color(0xFFCCFFFF), // Aqua / Pale Cyan
    Color(0XFFC6A4A4), // Dusty Rose
    Color(0xFFFFFFCC),
    Color(0xFFFFCCFF),
  ];
}

ThemeData primaryTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brandColor),
  textTheme: TextTheme(
    // Headlines
    headlineLarge: GoogleFonts.urbanist(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor['dark'],
    ),
    headlineMedium: GoogleFonts.urbanist(
      fontSize: 22.0,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor['dark'],
    ),
    headlineSmall: GoogleFonts.urbanist(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor['dark'],
    ),

    // Titles
    titleLarge: GoogleFonts.urbanist(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor['dark'],
    ),
    titleMedium: GoogleFonts.urbanist(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor['dark'],
    ),
    titleSmall: GoogleFonts.urbanist(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor['darkLite'],
    ),

    // Body text
    bodyLarge: GoogleFonts.urbanist(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textColor['dark'],
    ),
    bodyMedium: GoogleFonts.urbanist(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textColor['dark'],
    ),
    bodySmall: GoogleFonts.urbanist(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textColor['darkLite'],
    ),

    // Labels (buttons, captions, small text)
    labelLarge: GoogleFonts.urbanist(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor['dark'],
    ),
    labelMedium: GoogleFonts.urbanist(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor['dark'],
    ),
    labelSmall: GoogleFonts.urbanist(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor['darkLite'],
    ),
    displayLarge: GoogleFonts.urbanist(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor['dark'],
    ),
    displayMedium: GoogleFonts.urbanist(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor['lite'],
    ),
  ),
  scaffoldBackgroundColor: AppColors.backgroundColor,
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
    filled: true,
    fillColor: Colors.grey[50],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  ),

  tabBarTheme: TabBarThemeData(
    dividerColor: Colors.transparent,
    indicatorColor: AppColors.brandColor,
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: BoxDecoration(
      color: AppColors.brandColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    labelColor: AppColors.textColor['lite'],
    unselectedLabelColor: AppColors.textColor['dark'],
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
    splashFactory: NoSplash.splashFactory,
    labelStyle: GoogleFonts.urbanist(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    unselectedLabelStyle: GoogleFonts.urbanist(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  // Button Themes
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.brandColor,
      foregroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      textStyle: GoogleFonts.urbanist(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.brandColor,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      textStyle: GoogleFonts.urbanist(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.brandColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      textStyle: GoogleFonts.urbanist(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: AppColors.brandColor.withAlpha(30),
      foregroundColor: AppColors.brandColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      textStyle: GoogleFonts.urbanist(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      side: BorderSide.none,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: AppColors.brandColor,
      backgroundColor: AppColors.background['primary'],
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(12),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.brandColor,
    foregroundColor: Colors.white,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
);
