
import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

const Color lightPrimaryColor = Color(0xFF1E1E1E);
const Color lightAccentColor = Color(0xFF1E5185);

// Dark theme
const Color darkPrimaryColor = Color(0xFF121212);
const Color darkAccentColor = Color(0xFF18216C);
const Color darkBackgroundColor = Color(0xFF1F1F1F);
const Color darkCanvasColor = Color(0xFF242424);
const Color darkCardColor = Color(0xFF272727);
const Color darkDividerColor = Color(0xFF545454);

// Black theme
const Color blackPrimaryColor = Color(0xFF000000);
const Color blackAccentColor = Color(0xFFFFFFFF);
const Color kButtonColor = Color(0xffF89500);
const Color kChatIconBg = Color(0x50F89500);
const Color kChatPageBg = Color(0xFFE5E5E5);
const Color kLightGreyBg = Color(0xffF5F5F5);
const colors = [
  Color(0xffff6767),
  Color(0xff66e0da),
  Color(0xfff5a2d9),
  Color(0xfff0c722),
  Color(0xff6a85e5),
  Color(0xfffd9a6f),
  Color(0xff92db6e),
  Color(0xff73b8e5),
  Color(0xfffd7590),
  Color(0xffc78ae5),
];
Color getUserAvatarNameColor(types.User user) {
  final index = user.id.hashCode % colors.length;
  return colors[index];
}

String getUserName(types.User user) =>
    '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim();
