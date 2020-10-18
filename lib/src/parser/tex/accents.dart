const nonStretchyAccents = {
  '\\acute',
  '\\grave',
  '\\ddot',
  '\\tilde',
  '\\bar',
  '\\breve',
  '\\check',
  '\\hat',
  '\\vec',
  '\\dot',
  '\\mathring',
};

const shiftyAccents = {
  '\\widehat',
  '\\widetilde',
  '\\widecheck',
};

const accentCommandMapping = {
  '\\acute': '\u00B4',
  '\\grave': '\u0060',
  '\\ddot': '\u00A8',
  '\\tilde': '\u007E',
  '\\bar': '\u00AF',
  '\\breve': '\u02D8',
  '\\check': '\u02C7',
  '\\hat': '\u005E',
  '\\vec': '\u2192',
  '\\dot': '\u02D9',
  '\\mathring': '\u02da',
  '\\widecheck': '\u02c7',
  '\\widehat': '\u005e',
  '\\widetilde': '\u007e',
  '\\overrightarrow': '\u2192',
  '\\overleftarrow': '\u2190',
  '\\Overrightarrow': '\u21d2',
  '\\overleftrightarrow': '\u2194',
  // '\\overgroup': '\u',
  // '\\overlinesegment': '\u',
  '\\overleftharpoon': '\u21bc',
  '\\overrightharpoon': '\u21c0',
  "\\'": '\u00b4',
  '\\`': '\u0060',
  '\\^': '\u005e',
  '\\~': '\u007e',
  '\\=': '\u00af',
  '\\u': '\u02d8',
  '\\.': '\u02d9',
  '\\"': '\u00a8',
  '\\r': '\u02da',
  '\\H': '\u02dd',
  '\\v': '\u02c7',
  // '\\textcircled': '\u',

  '\\overline': '\u00AF',
};

const textUnicodeAccentMapping = {
  '\\`': '\u0300',
  '\\"': '\u0308',
  '\\~': '\u0303',
  '\\=': '\u0304',
  "\\'": '\u0301',
  '\\u': '\u0306',
  '\\v': '\u030c',
  '\\^': '\u0302',
  '\\.': '\u0307',
  '\\r': '\u030a',
  '\\H': '\u030b',
  // '\\textcircled': '\u',
};

const accentUnderMapping = {
  '\\underleftarrow': '\u2190',
  '\\underrightarrow': '\u2192',
  '\\underleftrightarrow': '\u2194',
  '\\undergroup': '\u23e0',
  // '\\underlinesegment',
  '\\utilde': '\u007e',

  '\\underline': '\u00af'
};
