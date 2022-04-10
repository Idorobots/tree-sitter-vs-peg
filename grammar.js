const PARENS_LEFT = "(";
const PARENS_RIGHT = ")";

module.exports = grammar({
  name: "test",

  rules: {
    sexp: ($) => $._sexp,

    _sexp: ($) => choice($.atom, $.list),

    atom: ($) => /[_@a-zA-Z0-9\xC0-\xD6\xD8-\xDE\xDF-\xF6\xF8-\xFF:-]+/,
    list: ($) => seq(PARENS_LEFT, repeat($._sexp), PARENS_RIGHT),
  },
});
