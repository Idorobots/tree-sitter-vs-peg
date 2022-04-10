module.exports = grammar({
  name: "test",

  rules: {
    test: ($) => repeat($._sexp),

    _sexp: ($) => choice($.list, $.string, $._atom),

    list: ($) => seq('(', repeat($._sexp), ')'),
    string: ($) => seq('"', field('value', /[^"]*/), '"'),
    _atom: ($) => choice($.number, $.symbol),
    number: ($) => /[0-9]+(\.[0-9]+)?/,
    symbol: ($) => /[_@#a-zA-Z0-9\xC0-\xD6\xD8-\xDE\xDF-\xF6\xF8-\xFF:-]+/,
  },
});
