
import 'package:eshop/src/app/presentation/theme/color_theme.dart';
import 'package:eshop/src/app/presentation/utils/consts.dart';
import 'package:flutter/material.dart';

enum DeviceSize {
  mobile,
  tablet,
  desktop,
  window,
}

class AppTheme {

  //* ------------------ Button Style ------------------

  static final buttonStyle = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: kPadding * 3, vertical: kPadding),
    ),
    elevation: MaterialStateProperty.all(0),
    fixedSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(55),
      ),
    ),
  );

  
    //* ------------------ Light Theme ------------------

  ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: kBackgroundColor,
      iconTheme: IconThemeData(color: kBlackColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    cardColor: kWhiteColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: kPrimaryColor,
      onPrimary: kPrimaryColor,
      secondary: kSecondaryColor,
      onSecondary: kPrimaryColor,
      secondaryContainer: kPrimaryColor,
      surface: kLighterGreyColor,
      onSurface: kWhiteColor,
      error: kRedColor,
      onError: kRedColor,
      background: kWhiteColor,
      onBackground: Colors.black,
    ),
   
    elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
    textButtonTheme: TextButtonThemeData(style: buttonStyle),
    outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
    textTheme: TextTheme(
      //     //* ------------------ Headlines ------------------

      displayLarge: _getResponsiveTextStyle(57, 45, 32, false),
      displayMedium: _getResponsiveTextStyle(
        45,
        32,
        28,
        false,
      ),
      displaySmall: _getResponsiveTextStyle(
        36,
        24,
        18,
        false,
      ),
      headlineLarge: _getResponsiveTextStyle(
        32,
        32,
        32,
        false,
      ),
      headlineMedium: _getResponsiveTextStyle(
        28,
        28,
        28,
        false,
      ),
      headlineSmall: _getResponsiveTextStyle(
        24,
        26,
        24,
        false,
      ),

      //     //* ------------------ Body Text ------------------

      bodyLarge: _getResponsiveTextStyle(
        20,
        16,
        16,
        false,
      ),
      bodyMedium: _getResponsiveTextStyle(
        14,
        14,
        14,
        false,
      ),
      bodySmall: _getResponsiveTextStyle(
        12,
        12,
        14,
        false,
      ),

      //     //* ------------------ Button Text ------------------

      labelLarge: _getResponsiveTextStyle(
        14,
        15,
        14,
        false,
      ),

      //     //* ------------------ OverLine Text ------------------

      labelMedium: _getResponsiveTextStyle(
        16,
        16,
        14,
        false,
      ),
      labelSmall: _getResponsiveTextStyle(
        14,
        14,
        12,
        false,
      ),

      titleLarge: _getResponsiveTextStyle(
        20,
        20,
        20,
        false,
      ),
      titleMedium: _getResponsiveTextStyle(
        16,
        9,
        16,
        false,
      ),
      titleSmall: _getResponsiveTextStyle(
        14,
        9,
        14,
        false,
      ),
    ),
  );

  //* ------------------ Dark Theme ------------------
  ThemeData dark = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: kDarkCardColor,
      iconTheme: IconThemeData(color: kWhiteColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: kWhiteColor,
    cardColor: kDarkBackgroundColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: kPrimaryColor,
      onPrimary: kPrimaryColor,
      secondary: kWhiteColor,
      onSecondary: kWhiteColor,
      surface: kDarkBackgroundColor,
      onSurface: kDarkCardColor,
      error: kRedColor,
      onError: kRedColor,
      background: kDarkBackgroundColor,
      onBackground: kDarkGreyColor,
    ),
    
  
      
      
       useMaterial3: true,
  );

  static isMobile({BuildContext? context}) {
    return getDeviceSize(context: context) == DeviceSize.mobile;
  }

  static isDesktop({BuildContext? context}) {
    return getDeviceSize(context: context) == DeviceSize.desktop;
  }

  static isTablet({BuildContext? context}) {
    return getDeviceSize(context: context) == DeviceSize.tablet;
  }

  static isWindow({BuildContext? context}) {
    return getDeviceSize(context: context) == DeviceSize.window;
  }

  static DeviceSize getDeviceSize({BuildContext? context}) {
    final width = context != null
        ? MediaQuery.of(context).size.width
        // ignore: deprecated_member_use
        : MediaQueryData.fromView(WidgetsBinding.instance.window).size.width;
    if (width < 600) {
      return DeviceSize.mobile;
    } else if (width < 1000) {
      return DeviceSize.tablet;
    } else if (width < 1920) {
      return DeviceSize.desktop;
    } else {
      return DeviceSize.window;
    }
  }

  static TextStyle _getResponsiveTextStyle(double desktopSize,
      double tabletSize, double mobileSize, bool? isDarkMode) {
    return TextStyle(
      color: kWhiteColor,
      fontSize: getDeviceSize() == DeviceSize.desktop ||
              getDeviceSize() == DeviceSize.window
          ? desktopSize
          : getDeviceSize() == DeviceSize.tablet
              ? tabletSize
              : mobileSize,
      height: 1.1,
      fontWeight: FontWeight.w600,
    );
  }
}
