import 'package:flutter/material.dart';

class FWt {
  static FontWeight extraLight = FontWeight.w200;
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;
}

class Styles {
  static Text extraLight(
    String text, {
    double? fs,
    String? ff,
    Color? c,
    double? ls,
    TextAlign? al,
    double? h,
    bool strike = false,
    int? lns,
    bool underline = false,
    TextOverflow? ov,
  }) {
    return Text(
      text,
      textAlign: al ?? TextAlign.left,
      maxLines: lns,
      overflow: ov,
      softWrap: true,
      style: TextStyle(
        fontFamily: ff,
        fontSize: fs ?? 18,
        fontWeight: FWt.regular,
        color: c,
        letterSpacing: ls,
        height: h,
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
      ),
    );
  }

  static Text light(
    String text, {
    double? fs,
    String? ff,
    Color? c,
    double? ls,
    TextAlign? al,
    double? h,
    bool strike = false,
    int? lns,
    bool underline = false,
    TextOverflow? ov,
  }) {
    return Text(
      text,
      textAlign: al ?? TextAlign.left,
      maxLines: lns,
      overflow: ov,
      softWrap: true,
      style: TextStyle(
        fontFamily: ff,
        fontSize: fs ?? 18,
        fontWeight: FWt.regular,
        color: c,
        letterSpacing: ls,
        height: h,
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
      ),
    );
  }

  static Text regular(
    String text, {
    double? fs,
    String? ff,
    Color? c,
    double? ls,
    TextAlign? al,
    double? h,
    bool strike = false,
    int? lns,
    bool underline = false,
    TextOverflow? ov,
  }) {
    return Text(
      text,
      textAlign: al ?? TextAlign.left,
      maxLines: lns,
      overflow: ov,
      softWrap: true,
      style: TextStyle(
        fontFamily: ff,
        fontSize: fs ?? 18,
        fontWeight: FWt.regular,
        color: c,
        letterSpacing: ls,
        height: h,
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
      ),
    );
  }

  static Text semiBold(
    String text, {
    double? fs,
    String? ff,
    Color? c,
    double? ls,
    TextAlign? al,
    double? h,
    bool strike = false,
    int? lns,
    bool underline = false,
    TextOverflow? ov,
  }) {
    return Text(
      text,
      textAlign: al ?? TextAlign.left,
      maxLines: lns,
      overflow: ov,
      softWrap: true,
      style: TextStyle(
        fontFamily: ff,
        fontSize: fs ?? 18,
        fontWeight: FWt.regular,
        color: c,
        letterSpacing: ls,
        height: h,
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
      ),
    );
  }

  static Text bold(
    String text, {
    double? fs,
    String? ff,
    Color? c,
    TextOverflow? ov,
    TextAlign? al,
    double? h,
    double? ls,
    bool strike = false,
    bool underline = false,
    int? lns,
  }) {
    return Text(
      text,
      textAlign: al ?? TextAlign.left,
      maxLines: lns,
      overflow: ov,
      style: TextStyle(
        fontFamily: ff,
        fontSize: fs ?? 16,
        fontWeight: FWt.semiBold,
        color: c,
        height: h,
        letterSpacing: ls,
        decoration: underline
            ? TextDecoration.underline
            : strike
                ? TextDecoration.lineThrough
                : TextDecoration.none,
      ),
    );
  }

  static Text extraBold(String text,
      {double? fs,
      Color? c,
      double? ls,
      String? ff,
      TextAlign? al,
      bool? strike = false,
      int? lns,
      TextOverflow? ov,
      double? line}) {
    return Text(
      text,
      textAlign: al ?? TextAlign.left,
      maxLines: lns,
      overflow: ov,
      style: TextStyle(
        fontFamily: ff,
        fontSize: fs ?? 16,
        letterSpacing: ls,
        fontWeight: FWt.bold,
        color: c,
      ),
    );
  }

  static Text black(
    String text, {
    double? fs,
    Color? c,
    TextAlign? al,
    int? lns,
    bool strike = false,
    TextOverflow? ov,
  }) {
    return Text(
      text,
      textAlign: al ?? TextAlign.left,
      maxLines: lns,
      overflow: ov,
      style: TextStyle(
        fontFamily: 'Nunito',
        fontSize: fs ?? 16,
        fontWeight: FWt.extraBold,
        color: c,
        decoration: strike ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}
