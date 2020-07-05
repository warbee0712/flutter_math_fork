import 'dart:io';

import 'dart:typed_data';

import 'package:flutter/services.dart';

Future<void> loadKaTeXFonts() async {
  //https://github.com/flutter/flutter/issues/20907
  if (Directory.current.path.endsWith('/test') || Directory.current.path.endsWith('\\test')) {
    Directory.current = Directory.current.parent;
  }

  final katexMainLoader = FontLoader('KaTeX_Main')
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Main-Regular.ttf'))
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Main-Italic.ttf'))
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Main-Bold.ttf'))
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Main-BoldItalic.ttf'));
  
  final katexMathLoader = FontLoader('KaTeX_Math')
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Math-Italic.ttf'))
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Math-BoldItalic.ttf'));
  
  final katexAMSLoader = FontLoader('KaTeX_AMS')
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_AMS-Regular.ttf'));
  
  final katexCaligraphicLoader = FontLoader('KaTeX_Caligraphic')
    ..addFont(
        getFontData('lib/katex_fonts/fonts/KaTeX_Caligraphic-Regular.ttf'))
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Caligraphic-Bold.ttf'));
  
  final katexFrakturLoader = FontLoader('KaTeX_Fraktur')
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Fraktur-Regular.ttf'))
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Fraktur-Bold.ttf'));
  
  final katexSansSerifLoader = FontLoader('KaTeX_SansSerif')
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_SansSerif-Regular.ttf'))
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_SansSerif-Bold.ttf'))
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_SansSerif-Italic.ttf'));
  
  final katexScriptLoader = FontLoader('KaTeX_Script')
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Script-Regular.ttf'));
  
  final katexTypewriterLoader = FontLoader('KaTeX_Typewriter')
    ..addFont(
        getFontData('lib/katex_fonts/fonts/KaTeX_Typewriter-Regular.ttf'));
  
  final katexSize1Loader = FontLoader('KaTeX_Size1')
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Size1-Regular.ttf'));
  
  final katexSize2Loader = FontLoader('KaTeX_Size2')
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Size2-Regular.ttf'));
  
  final katexSize3Loader = FontLoader('KaTeX_Size3')
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Size3-Regular.ttf'));
  
  final katexSize4Loader = FontLoader('KaTeX_Size4')
    ..addFont(getFontData('lib/katex_fonts/fonts/KaTeX_Size4-Regular.ttf'));

  await Future.wait([
    katexMainLoader.load(),
    katexMathLoader.load(),
    katexAMSLoader.load(),
    katexCaligraphicLoader.load(),
    katexFrakturLoader.load(),
    katexSansSerifLoader.load(),
    katexScriptLoader.load(),
    katexTypewriterLoader.load(),
    katexSize1Loader.load(),
    katexSize2Loader.load(),
    katexSize3Loader.load(),
    katexSize4Loader.load(),
  ]);
}

Future<ByteData> getFontData(String name) => File(name)
    .readAsBytes()
    .then((bytes) => ByteData.view(Uint8List.fromList(bytes).buffer));
