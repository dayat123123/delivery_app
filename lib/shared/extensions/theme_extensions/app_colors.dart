part of 'theme.dart';

const headline1 = TextStyle(fontWeight: FontWeight.w400, fontSize: 16);
const headline2 = TextStyle(fontWeight: FontWeight.w400, fontSize: 14);
const headline3 = TextStyle(fontWeight: FontWeight.w400, fontSize: 12);

abstract class AppColors {
  static const primary = Color.fromARGB(255, 37, 119, 196);

  static const white = Color(0xFFF0F0F0);
  static const black = Color(0xFF171B21);
  static const grey = Colors.grey;
  static const textLight = Color(0xFF35373A);
  static const textSoftLight = Color(0xFF4C5460);
  static const textDark = Color(0xFFCED0D6);
  static const textSoftDark = Color(0xFF6c727f);
  static const textHint = Color(0xFF757575);
  static const textFormFieldBackground = Color(0xFFFBFBFB);
  static const textFormFieldBorder = Color(0xFFD6E4EC);
  static const textFormFieldTextLabel = Color(0xFFB8B8B8);

  static const defaultBorderLight = Color(0xFFD8D8D8);
  static const defaultBorderDark = Color(0xFF202830);

  static const cardBorderGrey = Color(0xFFD9D9D9);
  static const softPrimary = Color(0xFFEEF6F9);

  static const cardBorderGrey2 = Color(0xFF787878);
  static const grayD9 = Color(0xFFD9D9D9);

  static const success = Color.fromARGB(255, 5, 181, 66);
  static const info = Colors.blue;
  static const warning = Color.fromARGB(255, 252, 154, 49);
  static const error = Color.fromARGB(255, 249, 64, 64);

  static const darkerGrey = Color(0xFF6C6C6C);
  static const darkestGrey = Color(0xFF626262);
  static const lighterGrey = Color(0xFF959595);
  static const lightGrey = Color(0xFF5d5d5d);

  static const lighterDark = Color(0xFF272727);
  static const lightDark = Color(0xFF1b1b1b);

  static const backgroundLight = Color(0xFFE5E6E6);
  static const foregroundLight = Color(0xFFececec);
  static const backgroundLightest = Color(0xFFDFE2E2);

  static const backgroundDark = Color.fromARGB(255, 18, 19, 20);
  static const foregroundDark = Color.fromARGB(255, 27, 28, 29);
  static const backgroundDarkest = Color(0xFF191D23);

  // gradient Color dark mode widget
  static const gradientColor1dark = Color.fromRGBO(36, 37, 39, 1.0);
  static Color gradientColor2dark = Colors.grey[900]!;

  // gradient Color light mode widget
  static const gradientColor1light = Colors.grey;
  static Color gradientColor2light = const Color.fromRGBO(201, 204, 211, 1.0);
}
