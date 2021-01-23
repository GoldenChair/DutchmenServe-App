import 'package:flutter/material.dart';

// ThemeData basicTheme() {
//   TextTheme _basicTextTheme(TextTheme base) {
//     return base.copyWith(
//       headline5: base.headline5.copyWith(
//         fontFamily: '',
//         fontSize: 22,
//         color: Colors.black,
//       )
//     );
//   }
// }

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

ThemeData basicTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      color: Color(0xff002A4E),
      iconTheme: IconThemeData(color: Color(0xfff9f9f9)),
      textTheme: TextTheme(
        headline6: TextStyle(
          // color: Color(0xff95C1DC),
          color: Color(0xfff9f9f9),
          fontSize: 23,
          fontWeight: FontWeight.w800,
          // fontFamily: 'Raleway',
        ),
      ),
      brightness: Brightness.dark,
    ),
    primarySwatch: white,
    brightness: Brightness.light,
    primaryColor: Color(0xffffffff),
    primaryColorBrightness: Brightness.light,
    primaryColorLight: Color(0xffe6e6e6),
    primaryColorDark: Color(0xff4d4d4d),
    accentColor: Color(0xff161837),
    accentColorBrightness: Brightness.light,
    canvasColor: Color(0xfffafafa),
    scaffoldBackgroundColor: Color(0xffFFE400),
    bottomAppBarColor: Color(0xffffffff),
    cardColor: Color(0xffffffff),
    dividerColor: Color(0xff002A4E),
    highlightColor: Color(0x66bcbcbc),
    splashColor: Color(0xffc7c7c7),
    selectedRowColor: Color(0xfff44336), // dk what this does
    unselectedWidgetColor: Color(0xff525252),
    disabledColor: Color(0xffcbcbcb),
    buttonColor: Color(0xff002A4E),
    toggleableActiveColor: Color(0xff206090),
    secondaryHeaderColor: Color(0xfff44336), // dk
    textSelectionColor: Color(0xfff9f9f9),
    cursorColor: Color(0xff002A4E),
    textSelectionHandleColor: Color(0xff206090),
    backgroundColor: Color(0xffcccccc),
    dialogBackgroundColor: Color(0xffffffff),
    indicatorColor: Color(0xfff9f9f9),
    hintColor: Colors.grey[700],
    errorColor: Color(0xffd32f2f),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      minWidth: 88.0,
      height: 36.0,
      padding:
          EdgeInsets.only(top: 15.0, bottom: 15.0, left: 25.0, right: 25.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff000000),
          width: 0.0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(45.0)),
      ),
      alignedDropdown: false,
      buttonColor: Color(0xff002A4E),
      disabledColor: Color(0xffcbcbcb),
      highlightColor: Color(0xff206090),
      splashColor: Color(0x1f000000),
      colorScheme: ColorScheme(
        primary: Color(0xff002A4E),
        primaryVariant: Color(0xfff9f9f9),
        secondary: Color(0xff206090),
        secondaryVariant: Color(0xff002A4E),
        surface: Color(0xff002A4E),
        background: Color(0xff002A4E),
        error: Color(0xffd32f2f),
        onPrimary: Color(0xff002A4E),
        onSecondary: Color(0xffffffff),
        onSurface: Color(0xff002A4E),
        onBackground: Color(0xff002A4E),
        onError: Color(0xffffffff),
        brightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0x8a000000),
        fontSize: 96.0,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
      headline2: TextStyle(
        color: Color(0x8a000000),
        fontSize: 60.0,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
      headline3: TextStyle(
        color: Color(0x8a000000),
        fontSize: 48.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline4: TextStyle(
        color: Color(0x8a000000),
        fontSize: 34.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline5: TextStyle(
        color: Color(0xdd000000),
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
      headline6: TextStyle(
        color: Color(0xdd000000),
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        color: Color(0xdd000000),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: TextStyle(
        color: Color(0xdd000000),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0xdd000000),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      caption: TextStyle(
        color: Color(0x8a000000),
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Color(0xff95C1DC),
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      subtitle2: TextStyle(
        color: Color(0xff000000),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Color(0xff000000),
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
    ),
    primaryTextTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0x8a000000),
        fontSize: 96.0,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
      headline2: TextStyle(
        color: Color(0x8a000000),
        fontSize: 60.0,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
      headline3: TextStyle(
        color: Color(0x8a000000),
        fontSize: 48.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline4: TextStyle(
        color: Color(0x8a000000),
        fontSize: 34.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline5: TextStyle(
        color: Color(0xdd000000),
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
      headline6: TextStyle(
        color: Color(0xdd000000),
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        color: Color(0xdd000000),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: TextStyle(
        color: Color(0xdd000000),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0xdd000000),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      caption: TextStyle(
        color: Color(0x8a000000),
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Color(0xff95C1DC),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      subtitle2: TextStyle(
        color: Color(0xff000000),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Color(0xff000000),
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
    ),
    accentTextTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xb3ffffff),
        fontSize: 96.0,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
      headline2: TextStyle(
        color: Color(0xb3ffffff),
        fontSize: 60.0,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
      headline3: TextStyle(
        color: Color(0xb3ffffff),
        fontSize: 48.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline4: TextStyle(
        color: Color(0xb3ffffff),
        fontSize: 34.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      headline5: TextStyle(
        color: Color(0xffffffff),
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
      headline6: TextStyle(
        color: Color(0xffffffff),
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        color: Color(0xffffffff),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: TextStyle(
        color: Color(0xffffffff),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        color: Color(0xffffffff),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      caption: TextStyle(
        color: Color(0xb3ffffff),
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      button: TextStyle(
        color: Color(0xff95C1DC),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      subtitle2: TextStyle(
        color: Color(0xffffffff),
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
      overline: TextStyle(
        color: Color(0xffffffff),
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color(0xdd000000),
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      helperStyle: TextStyle(
        color: Color(0xdd000000),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      hintStyle: TextStyle(
        color: Color(0xdd000000),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      errorStyle: TextStyle(
        color: Color(0xdd000000),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      errorMaxLines: null,
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      isDense: false,
      contentPadding:
          EdgeInsets.only(top: 12.0, bottom: 12.0, left: 0.0, right: 0.0),
      isCollapsed: false,
      prefixStyle: TextStyle(
        color: Color(0xdd000000),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      suffixStyle: TextStyle(
        color: Color(0xdd000000),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      counterStyle: TextStyle(
        color: Color(0xdd000000),
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      filled: false,
      fillColor: Color(0x00000000),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff000000),
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff000000),
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff000000),
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff000000),
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff000000),
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xff000000),
          width: 1.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    ),
    iconTheme: IconThemeData(
      color: Color(0xff206090),
      opacity: 1.0,
      size: 24.0,
    ),
    primaryIconTheme: IconThemeData(
      color: Color(0xff206090),
      opacity: 1.0,
      size: 24.0,
    ),
    accentIconTheme: IconThemeData(
      color: Color(0xff95C1DC),
      opacity: 1.0,
      size: 24.0,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xffa8b7f1),
      inactiveTrackColor: Color(0xffe0e4f4),
      disabledActiveTrackColor: Color(0x524d4d4d),
      disabledInactiveTrackColor: Color(0x1f4d4d4d),
      activeTickMarkColor: Color(0xfff7f7f7),
      inactiveTickMarkColor: Color(0xffc0c7d3),
      disabledActiveTickMarkColor: Color(0x1fe6e6e6),
      disabledInactiveTickMarkColor: Color(0x1f4d4d4d),
      thumbColor: Color(0xff3f51b5),
      disabledThumbColor: Color(0x524d4d4d),
      thumbShape: RoundSliderThumbShape(),
      overlayColor: Color(0xfff2f2f2),
      valueIndicatorColor: Color(0xffffeb3b),
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      showValueIndicator: ShowValueIndicator.always,
      valueIndicatorTextStyle: TextStyle(
        color: Color(0xff000000),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Color(0xff000000),
      unselectedLabelColor: Color(0xb2000000),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Color(0xff95C1DC),
      brightness: Brightness.light,
      deleteIconColor: Color(0xff000000),
      disabledColor: Color(0x0c000000),
      labelPadding:
          EdgeInsets.only(top: 0.0, bottom: 0.0, left: 8.0, right: 8.0),
      labelStyle: TextStyle(
        color: Color(0xde000000),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      padding: EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 4.0),
      secondaryLabelStyle: TextStyle(
        color: Color(0xff95C1DC),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      secondarySelectedColor: Color(0xff002A4E),
      selectedColor: Color(0xffffeb3b),
      shape: StadiumBorder(
          side: BorderSide(
        color: Color(0xff000000),
        width: 0.0,
        style: BorderStyle.none,
      )),
    ),
    dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0.0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    )),
  );
}
