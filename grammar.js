module.exports = grammar({
  name: "test",

  rules: {
    test: ($) => $._sexp,

    _sexp: ($) => choice($.list, $.string, $.atom),

    list: ($) => seq('(', repeat($._sexp), ')'),
    string: ($) => seq('"', field('value', /[^"]*/), '"'),
    atom: ($) => /[_@#a-zA-Z0-9\xC0-\xD6\xD8-\xDE\xDF-\xF6\xF8-\xFF:-]+/,
  },
});
