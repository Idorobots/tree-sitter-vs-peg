#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 13
#define STATE_COUNT 12
#define LARGE_STATE_COUNT 6
#define SYMBOL_COUNT 13
#define ALIAS_COUNT 0
#define TOKEN_COUNT 7
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 1
#define MAX_ALIAS_SEQUENCE_LENGTH 3
#define PRODUCTION_ID_COUNT 2

enum {
  anon_sym_LPAREN = 1,
  anon_sym_RPAREN = 2,
  anon_sym_DQUOTE = 3,
  aux_sym_string_token1 = 4,
  sym_number = 5,
  sym_symbol = 6,
  sym_test = 7,
  sym__sexp = 8,
  sym_list = 9,
  sym_string = 10,
  sym__atom = 11,
  aux_sym_test_repeat1 = 12,
};

static const char * const ts_symbol_names[] = {
  [ts_builtin_sym_end] = "end",
  [anon_sym_LPAREN] = "(",
  [anon_sym_RPAREN] = ")",
  [anon_sym_DQUOTE] = "\"",
  [aux_sym_string_token1] = "string_token1",
  [sym_number] = "number",
  [sym_symbol] = "symbol",
  [sym_test] = "test",
  [sym__sexp] = "_sexp",
  [sym_list] = "list",
  [sym_string] = "string",
  [sym__atom] = "_atom",
  [aux_sym_test_repeat1] = "test_repeat1",
};

static const TSSymbol ts_symbol_map[] = {
  [ts_builtin_sym_end] = ts_builtin_sym_end,
  [anon_sym_LPAREN] = anon_sym_LPAREN,
  [anon_sym_RPAREN] = anon_sym_RPAREN,
  [anon_sym_DQUOTE] = anon_sym_DQUOTE,
  [aux_sym_string_token1] = aux_sym_string_token1,
  [sym_number] = sym_number,
  [sym_symbol] = sym_symbol,
  [sym_test] = sym_test,
  [sym__sexp] = sym__sexp,
  [sym_list] = sym_list,
  [sym_string] = sym_string,
  [sym__atom] = sym__atom,
  [aux_sym_test_repeat1] = aux_sym_test_repeat1,
};

static const TSSymbolMetadata ts_symbol_metadata[] = {
  [ts_builtin_sym_end] = {
    .visible = false,
    .named = true,
  },
  [anon_sym_LPAREN] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_RPAREN] = {
    .visible = true,
    .named = false,
  },
  [anon_sym_DQUOTE] = {
    .visible = true,
    .named = false,
  },
  [aux_sym_string_token1] = {
    .visible = false,
    .named = false,
  },
  [sym_number] = {
    .visible = true,
    .named = true,
  },
  [sym_symbol] = {
    .visible = true,
    .named = true,
  },
  [sym_test] = {
    .visible = true,
    .named = true,
  },
  [sym__sexp] = {
    .visible = false,
    .named = true,
  },
  [sym_list] = {
    .visible = true,
    .named = true,
  },
  [sym_string] = {
    .visible = true,
    .named = true,
  },
  [sym__atom] = {
    .visible = false,
    .named = true,
  },
  [aux_sym_test_repeat1] = {
    .visible = false,
    .named = false,
  },
};

enum {
  field_value = 1,
};

static const char * const ts_field_names[] = {
  [0] = NULL,
  [field_value] = "value",
};

static const TSFieldMapSlice ts_field_map_slices[PRODUCTION_ID_COUNT] = {
  [1] = {.index = 0, .length = 1},
};

static const TSFieldMapEntry ts_field_map_entries[] = {
  [0] =
    {field_value, 1},
};

static const TSSymbol ts_alias_sequences[PRODUCTION_ID_COUNT][MAX_ALIAS_SEQUENCE_LENGTH] = {
  [0] = {0},
};

static const uint16_t ts_non_terminal_alias_map[] = {
  0,
};

static inline bool sym_symbol_character_set_1(int32_t c) {
  return (c < '_'
    ? (c < ':'
      ? (c < '-'
        ? c == '#'
        : c <= '-')
      : (c <= ':' || (c >= '@' && c <= 'Z')))
    : (c <= '_' || (c < 216
      ? (c < 192
        ? (c >= 'a' && c <= 'z')
        : c <= 214)
      : (c <= 246 || (c >= 248 && c <= 255)))));
}

static inline bool sym_symbol_character_set_2(int32_t c) {
  return (c < '_'
    ? (c < '0'
      ? (c < '-'
        ? c == '#'
        : c <= '-')
      : (c <= ':' || (c >= '@' && c <= 'Z')))
    : (c <= '_' || (c < 216
      ? (c < 192
        ? (c >= 'a' && c <= 'z')
        : c <= 214)
      : (c <= 246 || (c >= 248 && c <= 255)))));
}

static bool ts_lex(TSLexer *lexer, TSStateId state) {
  START_LEXER();
  eof = lexer->eof(lexer);
  switch (state) {
    case 0:
      if (eof) ADVANCE(2);
      if (lookahead == '"') ADVANCE(5);
      if (lookahead == '(') ADVANCE(3);
      if (lookahead == ')') ADVANCE(4);
      if (lookahead == '\t' ||
          lookahead == '\n' ||
          lookahead == '\r' ||
          lookahead == ' ') SKIP(0)
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(8);
      if (sym_symbol_character_set_1(lookahead)) ADVANCE(10);
      END_STATE();
    case 1:
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(9);
      END_STATE();
    case 2:
      ACCEPT_TOKEN(ts_builtin_sym_end);
      END_STATE();
    case 3:
      ACCEPT_TOKEN(anon_sym_LPAREN);
      END_STATE();
    case 4:
      ACCEPT_TOKEN(anon_sym_RPAREN);
      END_STATE();
    case 5:
      ACCEPT_TOKEN(anon_sym_DQUOTE);
      END_STATE();
    case 6:
      ACCEPT_TOKEN(aux_sym_string_token1);
      if (lookahead == '\t' ||
          lookahead == '\n' ||
          lookahead == '\r' ||
          lookahead == ' ') ADVANCE(6);
      if (lookahead != 0 &&
          lookahead != '"') ADVANCE(7);
      END_STATE();
    case 7:
      ACCEPT_TOKEN(aux_sym_string_token1);
      if (lookahead != 0 &&
          lookahead != '"') ADVANCE(7);
      END_STATE();
    case 8:
      ACCEPT_TOKEN(sym_number);
      if (lookahead == '.') ADVANCE(1);
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(8);
      if (sym_symbol_character_set_1(lookahead)) ADVANCE(10);
      END_STATE();
    case 9:
      ACCEPT_TOKEN(sym_number);
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(9);
      END_STATE();
    case 10:
      ACCEPT_TOKEN(sym_symbol);
      if (sym_symbol_character_set_2(lookahead)) ADVANCE(10);
      END_STATE();
    default:
      return false;
  }
}

static const TSLexMode ts_lex_modes[STATE_COUNT] = {
  [0] = {.lex_state = 0},
  [1] = {.lex_state = 0},
  [2] = {.lex_state = 0},
  [3] = {.lex_state = 0},
  [4] = {.lex_state = 0},
  [5] = {.lex_state = 0},
  [6] = {.lex_state = 0},
  [7] = {.lex_state = 0},
  [8] = {.lex_state = 0},
  [9] = {.lex_state = 6},
  [10] = {.lex_state = 0},
  [11] = {.lex_state = 0},
};

static const uint16_t ts_parse_table[LARGE_STATE_COUNT][SYMBOL_COUNT] = {
  [0] = {
    [ts_builtin_sym_end] = ACTIONS(1),
    [anon_sym_LPAREN] = ACTIONS(1),
    [anon_sym_RPAREN] = ACTIONS(1),
    [anon_sym_DQUOTE] = ACTIONS(1),
    [sym_number] = ACTIONS(1),
    [sym_symbol] = ACTIONS(1),
  },
  [1] = {
    [sym_test] = STATE(10),
    [sym__sexp] = STATE(4),
    [sym_list] = STATE(4),
    [sym_string] = STATE(4),
    [sym__atom] = STATE(4),
    [aux_sym_test_repeat1] = STATE(4),
    [ts_builtin_sym_end] = ACTIONS(3),
    [anon_sym_LPAREN] = ACTIONS(5),
    [anon_sym_DQUOTE] = ACTIONS(7),
    [sym_number] = ACTIONS(9),
    [sym_symbol] = ACTIONS(9),
  },
  [2] = {
    [sym__sexp] = STATE(2),
    [sym_list] = STATE(2),
    [sym_string] = STATE(2),
    [sym__atom] = STATE(2),
    [aux_sym_test_repeat1] = STATE(2),
    [ts_builtin_sym_end] = ACTIONS(11),
    [anon_sym_LPAREN] = ACTIONS(13),
    [anon_sym_RPAREN] = ACTIONS(11),
    [anon_sym_DQUOTE] = ACTIONS(16),
    [sym_number] = ACTIONS(19),
    [sym_symbol] = ACTIONS(19),
  },
  [3] = {
    [sym__sexp] = STATE(5),
    [sym_list] = STATE(5),
    [sym_string] = STATE(5),
    [sym__atom] = STATE(5),
    [aux_sym_test_repeat1] = STATE(5),
    [anon_sym_LPAREN] = ACTIONS(5),
    [anon_sym_RPAREN] = ACTIONS(22),
    [anon_sym_DQUOTE] = ACTIONS(7),
    [sym_number] = ACTIONS(24),
    [sym_symbol] = ACTIONS(24),
  },
  [4] = {
    [sym__sexp] = STATE(2),
    [sym_list] = STATE(2),
    [sym_string] = STATE(2),
    [sym__atom] = STATE(2),
    [aux_sym_test_repeat1] = STATE(2),
    [ts_builtin_sym_end] = ACTIONS(26),
    [anon_sym_LPAREN] = ACTIONS(5),
    [anon_sym_DQUOTE] = ACTIONS(7),
    [sym_number] = ACTIONS(28),
    [sym_symbol] = ACTIONS(28),
  },
  [5] = {
    [sym__sexp] = STATE(2),
    [sym_list] = STATE(2),
    [sym_string] = STATE(2),
    [sym__atom] = STATE(2),
    [aux_sym_test_repeat1] = STATE(2),
    [anon_sym_LPAREN] = ACTIONS(5),
    [anon_sym_RPAREN] = ACTIONS(30),
    [anon_sym_DQUOTE] = ACTIONS(7),
    [sym_number] = ACTIONS(28),
    [sym_symbol] = ACTIONS(28),
  },
};

static const uint16_t ts_small_parse_table[] = {
  [0] = 2,
    ACTIONS(34), 2,
      sym_number,
      sym_symbol,
    ACTIONS(32), 4,
      ts_builtin_sym_end,
      anon_sym_LPAREN,
      anon_sym_RPAREN,
      anon_sym_DQUOTE,
  [11] = 2,
    ACTIONS(38), 2,
      sym_number,
      sym_symbol,
    ACTIONS(36), 4,
      ts_builtin_sym_end,
      anon_sym_LPAREN,
      anon_sym_RPAREN,
      anon_sym_DQUOTE,
  [22] = 2,
    ACTIONS(42), 2,
      sym_number,
      sym_symbol,
    ACTIONS(40), 4,
      ts_builtin_sym_end,
      anon_sym_LPAREN,
      anon_sym_RPAREN,
      anon_sym_DQUOTE,
  [33] = 1,
    ACTIONS(44), 1,
      aux_sym_string_token1,
  [37] = 1,
    ACTIONS(46), 1,
      ts_builtin_sym_end,
  [41] = 1,
    ACTIONS(48), 1,
      anon_sym_DQUOTE,
};

static const uint32_t ts_small_parse_table_map[] = {
  [SMALL_STATE(6)] = 0,
  [SMALL_STATE(7)] = 11,
  [SMALL_STATE(8)] = 22,
  [SMALL_STATE(9)] = 33,
  [SMALL_STATE(10)] = 37,
  [SMALL_STATE(11)] = 41,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_test, 0),
  [5] = {.entry = {.count = 1, .reusable = true}}, SHIFT(3),
  [7] = {.entry = {.count = 1, .reusable = true}}, SHIFT(9),
  [9] = {.entry = {.count = 1, .reusable = false}}, SHIFT(4),
  [11] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_test_repeat1, 2),
  [13] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_test_repeat1, 2), SHIFT_REPEAT(3),
  [16] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_test_repeat1, 2), SHIFT_REPEAT(9),
  [19] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_test_repeat1, 2), SHIFT_REPEAT(2),
  [22] = {.entry = {.count = 1, .reusable = true}}, SHIFT(6),
  [24] = {.entry = {.count = 1, .reusable = false}}, SHIFT(5),
  [26] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_test, 1),
  [28] = {.entry = {.count = 1, .reusable = false}}, SHIFT(2),
  [30] = {.entry = {.count = 1, .reusable = true}}, SHIFT(7),
  [32] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_list, 2),
  [34] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_list, 2),
  [36] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_list, 3),
  [38] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_list, 3),
  [40] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_string, 3, .production_id = 1),
  [42] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_string, 3, .production_id = 1),
  [44] = {.entry = {.count = 1, .reusable = true}}, SHIFT(11),
  [46] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
  [48] = {.entry = {.count = 1, .reusable = true}}, SHIFT(8),
};

#ifdef __cplusplus
extern "C" {
#endif
#ifdef _WIN32
#define extern __declspec(dllexport)
#endif

extern const TSLanguage *tree_sitter_test(void) {
  static const TSLanguage language = {
    .version = LANGUAGE_VERSION,
    .symbol_count = SYMBOL_COUNT,
    .alias_count = ALIAS_COUNT,
    .token_count = TOKEN_COUNT,
    .external_token_count = EXTERNAL_TOKEN_COUNT,
    .state_count = STATE_COUNT,
    .large_state_count = LARGE_STATE_COUNT,
    .production_id_count = PRODUCTION_ID_COUNT,
    .field_count = FIELD_COUNT,
    .max_alias_sequence_length = MAX_ALIAS_SEQUENCE_LENGTH,
    .parse_table = &ts_parse_table[0][0],
    .small_parse_table = ts_small_parse_table,
    .small_parse_table_map = ts_small_parse_table_map,
    .parse_actions = ts_parse_actions,
    .symbol_names = ts_symbol_names,
    .field_names = ts_field_names,
    .field_map_slices = ts_field_map_slices,
    .field_map_entries = ts_field_map_entries,
    .symbol_metadata = ts_symbol_metadata,
    .public_symbol_map = ts_symbol_map,
    .alias_map = ts_non_terminal_alias_map,
    .alias_sequences = &ts_alias_sequences[0][0],
    .lex_modes = ts_lex_modes,
    .lex_fn = ts_lex,
  };
  return &language;
}
#ifdef __cplusplus
}
#endif
