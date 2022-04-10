module.exports = grammar({
  name: "test",

  rules: {
    sexps: ($) => repeat($._sexp),

    _sexp: ($) => choice($.quote, $.list, $.string, $._atom),

    quote: ($) => seq("'", $._sexp),
    list: ($) => seq('(', repeat($._sexp), ')'),
    string: ($) => seq('"',  /[^"]*/, '"'),
    _atom: ($) => choice($.number, $.symbol),
    number: ($) => /[0-9]+(\.[0-9]+)?/,
    symbol: ($) => /[_@#a-zA-Z0-9\xC0-\xD6\xD8-\xDE\xDF-\xF6\xF8-\xFF:=><+*\/?!^-]+/,
    _comment: ($) => token(seq(';', /[^\n]*/)),
  },

  extras: ($) => [$._comment, /\s/],
});
