#include <tree_sitter/parser.h>

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 13
#define STATE_COUNT 14
#define LARGE_STATE_COUNT 7
#define SYMBOL_COUNT 16
#define ALIAS_COUNT 0
#define TOKEN_COUNT 9
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 0
#define MAX_ALIAS_SEQUENCE_LENGTH 3
#define PRODUCTION_ID_COUNT 1

enum {
  anon_sym_SQUOTE = 1,
  anon_sym_LPAREN = 2,
  anon_sym_RPAREN = 3,
  anon_sym_DQUOTE = 4,
  aux_sym_string_token1 = 5,
  sym_number = 6,
  sym_symbol = 7,
  sym__comment = 8,
  sym_sexps = 9,
  sym__sexp = 10,
  sym_quote = 11,
  sym_list = 12,
  sym_string = 13,
  sym__atom = 14,
  aux_sym_sexps_repeat1 = 15,
};

static const char * const ts_symbol_names[] = {
  [ts_builtin_sym_end] = "end",
  [anon_sym_SQUOTE] = "'",
  [anon_sym_LPAREN] = "(",
  [anon_sym_RPAREN] = ")",
  [anon_sym_DQUOTE] = "\"",
  [aux_sym_string_token1] = "string_token1",
  [sym_number] = "number",
  [sym_symbol] = "symbol",
  [sym__comment] = "_comment",
  [sym_sexps] = "sexps",
  [sym__sexp] = "_sexp",
  [sym_quote] = "quote",
  [sym_list] = "list",
  [sym_string] = "string",
  [sym__atom] = "_atom",
  [aux_sym_sexps_repeat1] = "sexps_repeat1",
};

static const TSSymbol ts_symbol_map[] = {
  [ts_builtin_sym_end] = ts_builtin_sym_end,
  [anon_sym_SQUOTE] = anon_sym_SQUOTE,
  [anon_sym_LPAREN] = anon_sym_LPAREN,
  [anon_sym_RPAREN] = anon_sym_RPAREN,
  [anon_sym_DQUOTE] = anon_sym_DQUOTE,
  [aux_sym_string_token1] = aux_sym_string_token1,
  [sym_number] = sym_number,
  [sym_symbol] = sym_symbol,
  [sym__comment] = sym__comment,
  [sym_sexps] = sym_sexps,
  [sym__sexp] = sym__sexp,
  [sym_quote] = sym_quote,
  [sym_list] = sym_list,
  [sym_string] = sym_string,
  [sym__atom] = sym__atom,
  [aux_sym_sexps_repeat1] = aux_sym_sexps_repeat1,
};

static const TSSymbolMetadata ts_symbol_metadata[] = {
  [ts_builtin_sym_end] = {
    .visible = false,
    .named = true,
  },
  [anon_sym_SQUOTE] = {
    .visible = true,
    .named = false,
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
  [sym__comment] = {
    .visible = false,
    .named = true,
  },
  [sym_sexps] = {
    .visible = true,
    .named = true,
  },
  [sym__sexp] = {
    .visible = false,
    .named = true,
  },
  [sym_quote] = {
    .visible = true,
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
  [aux_sym_sexps_repeat1] = {
    .visible = false,
    .named = false,
  },
};

static const TSSymbol ts_alias_sequences[PRODUCTION_ID_COUNT][MAX_ALIAS_SEQUENCE_LENGTH] = {
  [0] = {0},
};

static const uint16_t ts_non_terminal_alias_map[] = {
  0,
};

static inline bool sym_symbol_character_set_1(int32_t c) {
  return (c < '^'
    ? (c < '*'
      ? (c < '#'
        ? c == '!'
        : c <= '#')
      : (c <= ':' || (c >= '<' && c <= 'Z')))
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
      if (eof) ADVANCE(1);
      if (lookahead == '"') ADVANCE(5);
      if (lookahead == '\'') ADVANCE(2);
      if (lookahead == '(') ADVANCE(3);
      if (lookahead == ')') ADVANCE(4);
      if (lookahead == ';') ADVANCE(13);
      if (lookahead == '\t' ||
          lookahead == '\n' ||
          lookahead == '\r' ||
          lookahead == ' ') SKIP(0)
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(9);
      if (('!' <= lookahead && lookahead <= '#') ||
          ('*' <= lookahead && lookahead <= 'Z') ||
          lookahead == '^' ||
          lookahead == '_' ||
          ('a' <= lookahead && lookahead <= 'z') ||
          (192 <= lookahead && lookahead <= 214) ||
          (216 <= lookahead && lookahead <= 246) ||
          (248 <= lookahead && lookahead <= 255)) ADVANCE(12);
      END_STATE();
    case 1:
      ACCEPT_TOKEN(ts_builtin_sym_end);
      END_STATE();
    case 2:
      ACCEPT_TOKEN(anon_sym_SQUOTE);
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
      if (lookahead == '\n') ADVANCE(8);
      if (lookahead == '"') ADVANCE(13);
      if (lookahead != 0) ADVANCE(6);
      END_STATE();
    case 7:
      ACCEPT_TOKEN(aux_sym_string_token1);
      if (lookahead == ';') ADVANCE(6);
      if (lookahead == '\t' ||
          lookahead == '\n' ||
          lookahead == '\r' ||
          lookahead == ' ') ADVANCE(7);
      if (lookahead != 0 &&
          lookahead != '"') ADVANCE(8);
      END_STATE();
    case 8:
      ACCEPT_TOKEN(aux_sym_string_token1);
      if (lookahead != 0 &&
          lookahead != '"') ADVANCE(8);
      END_STATE();
    case 9:
      ACCEPT_TOKEN(sym_number);
      if (lookahead == '.') ADVANCE(11);
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(9);
      if (sym_symbol_character_set_1(lookahead)) ADVANCE(12);
      END_STATE();
    case 10:
      ACCEPT_TOKEN(sym_number);
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(10);
      if (sym_symbol_character_set_1(lookahead)) ADVANCE(12);
      END_STATE();
    case 11:
      ACCEPT_TOKEN(sym_symbol);
      if (('0' <= lookahead && lookahead <= '9')) ADVANCE(10);
      if (sym_symbol_character_set_1(lookahead)) ADVANCE(12);
      END_STATE();
    case 12:
      ACCEPT_TOKEN(sym_symbol);
      if (sym_symbol_character_set_1(lookahead)) ADVANCE(12);
      END_STATE();
    case 13:
      ACCEPT_TOKEN(sym__comment);
      if (lookahead != 0 &&
          lookahead != '\n') ADVANCE(13);
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
  [9] = {.lex_state = 0},
  [10] = {.lex_state = 0},
  [11] = {.lex_state = 7},
  [12] = {.lex_state = 0},
  [13] = {.lex_state = 0},
};

static const uint16_t ts_parse_table[LARGE_STATE_COUNT][SYMBOL_COUNT] = {
  [0] = {
    [ts_builtin_sym_end] = ACTIONS(1),
    [anon_sym_SQUOTE] = ACTIONS(1),
    [anon_sym_LPAREN] = ACTIONS(1),
    [anon_sym_RPAREN] = ACTIONS(1),
    [anon_sym_DQUOTE] = ACTIONS(1),
    [sym_number] = ACTIONS(1),
    [sym_symbol] = ACTIONS(1),
    [sym__comment] = ACTIONS(3),
  },
  [1] = {
    [sym_sexps] = STATE(12),
    [sym__sexp] = STATE(4),
    [sym_quote] = STATE(4),
    [sym_list] = STATE(4),
    [sym_string] = STATE(4),
    [sym__atom] = STATE(4),
    [aux_sym_sexps_repeat1] = STATE(4),
    [ts_builtin_sym_end] = ACTIONS(5),
    [anon_sym_SQUOTE] = ACTIONS(7),
    [anon_sym_LPAREN] = ACTIONS(9),
    [anon_sym_DQUOTE] = ACTIONS(11),
    [sym_number] = ACTIONS(13),
    [sym_symbol] = ACTIONS(13),
    [sym__comment] = ACTIONS(3),
  },
  [2] = {
    [sym__sexp] = STATE(2),
    [sym_quote] = STATE(2),
    [sym_list] = STATE(2),
    [sym_string] = STATE(2),
    [sym__atom] = STATE(2),
    [aux_sym_sexps_repeat1] = STATE(2),
    [ts_builtin_sym_end] = ACTIONS(15),
    [anon_sym_SQUOTE] = ACTIONS(17),
    [anon_sym_LPAREN] = ACTIONS(20),
    [anon_sym_RPAREN] = ACTIONS(15),
    [anon_sym_DQUOTE] = ACTIONS(23),
    [sym_number] = ACTIONS(26),
    [sym_symbol] = ACTIONS(26),
    [sym__comment] = ACTIONS(3),
  },
  [3] = {
    [sym__sexp] = STATE(5),
    [sym_quote] = STATE(5),
    [sym_list] = STATE(5),
    [sym_string] = STATE(5),
    [sym__atom] = STATE(5),
    [aux_sym_sexps_repeat1] = STATE(5),
    [anon_sym_SQUOTE] = ACTIONS(7),
    [anon_sym_LPAREN] = ACTIONS(9),
    [anon_sym_RPAREN] = ACTIONS(29),
    [anon_sym_DQUOTE] = ACTIONS(11),
    [sym_number] = ACTIONS(31),
    [sym_symbol] = ACTIONS(31),
    [sym__comment] = ACTIONS(3),
  },
  [4] = {
    [sym__sexp] = STATE(2),
    [sym_quote] = STATE(2),
    [sym_list] = STATE(2),
    [sym_string] = STATE(2),
    [sym__atom] = STATE(2),
    [aux_sym_sexps_repeat1] = STATE(2),
    [ts_builtin_sym_end] = ACTIONS(33),
    [anon_sym_SQUOTE] = ACTIONS(7),
    [anon_sym_LPAREN] = ACTIONS(9),
    [anon_sym_DQUOTE] = ACTIONS(11),
    [sym_number] = ACTIONS(35),
    [sym_symbol] = ACTIONS(35),
    [sym__comment] = ACTIONS(3),
  },
  [5] = {
    [sym__sexp] = STATE(2),
    [sym_quote] = STATE(2),
    [sym_list] = STATE(2),
    [sym_string] = STATE(2),
    [sym__atom] = STATE(2),
    [aux_sym_sexps_repeat1] = STATE(2),
    [anon_sym_SQUOTE] = ACTIONS(7),
    [anon_sym_LPAREN] = ACTIONS(9),
    [anon_sym_RPAREN] = ACTIONS(37),
    [anon_sym_DQUOTE] = ACTIONS(11),
    [sym_number] = ACTIONS(35),
    [sym_symbol] = ACTIONS(35),
    [sym__comment] = ACTIONS(3),
  },
  [6] = {
    [sym__sexp] = STATE(7),
    [sym_quote] = STATE(7),
    [sym_list] = STATE(7),
    [sym_string] = STATE(7),
    [sym__atom] = STATE(7),
    [anon_sym_SQUOTE] = ACTIONS(7),
    [anon_sym_LPAREN] = ACTIONS(9),
    [anon_sym_DQUOTE] = ACTIONS(11),
    [sym_number] = ACTIONS(39),
    [sym_symbol] = ACTIONS(39),
    [sym__comment] = ACTIONS(3),
  },
};

static const uint16_t ts_small_parse_table[] = {
  [0] = 3,
    ACTIONS(3), 1,
      sym__comment,
    ACTIONS(43), 2,
      sym_number,
      sym_symbol,
    ACTIONS(41), 5,
      ts_builtin_sym_end,
      anon_sym_SQUOTE,
      anon_sym_LPAREN,
      anon_sym_RPAREN,
      anon_sym_DQUOTE,
  [15] = 3,
    ACTIONS(3), 1,
      sym__comment,
    ACTIONS(47), 2,
      sym_number,
      sym_symbol,
    ACTIONS(45), 5,
      ts_builtin_sym_end,
      anon_sym_SQUOTE,
      anon_sym_LPAREN,
      anon_sym_RPAREN,
      anon_sym_DQUOTE,
  [30] = 3,
    ACTIONS(3), 1,
      sym__comment,
    ACTIONS(51), 2,
      sym_number,
      sym_symbol,
    ACTIONS(49), 5,
      ts_builtin_sym_end,
      anon_sym_SQUOTE,
      anon_sym_LPAREN,
      anon_sym_RPAREN,
      anon_sym_DQUOTE,
  [45] = 3,
    ACTIONS(3), 1,
      sym__comment,
    ACTIONS(55), 2,
      sym_number,
      sym_symbol,
    ACTIONS(53), 5,
      ts_builtin_sym_end,
      anon_sym_SQUOTE,
      anon_sym_LPAREN,
      anon_sym_RPAREN,
      anon_sym_DQUOTE,
  [60] = 2,
    ACTIONS(57), 1,
      aux_sym_string_token1,
    ACTIONS(59), 1,
      sym__comment,
  [67] = 2,
    ACTIONS(3), 1,
      sym__comment,
    ACTIONS(61), 1,
      ts_builtin_sym_end,
  [74] = 2,
    ACTIONS(3), 1,
      sym__comment,
    ACTIONS(63), 1,
      anon_sym_DQUOTE,
};

static const uint32_t ts_small_parse_table_map[] = {
  [SMALL_STATE(7)] = 0,
  [SMALL_STATE(8)] = 15,
  [SMALL_STATE(9)] = 30,
  [SMALL_STATE(10)] = 45,
  [SMALL_STATE(11)] = 60,
  [SMALL_STATE(12)] = 67,
  [SMALL_STATE(13)] = 74,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, SHIFT_EXTRA(),
  [5] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_sexps, 0),
  [7] = {.entry = {.count = 1, .reusable = true}}, SHIFT(6),
  [9] = {.entry = {.count = 1, .reusable = true}}, SHIFT(3),
  [11] = {.entry = {.count = 1, .reusable = true}}, SHIFT(11),
  [13] = {.entry = {.count = 1, .reusable = false}}, SHIFT(4),
  [15] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_sexps_repeat1, 2),
  [17] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_sexps_repeat1, 2), SHIFT_REPEAT(6),
  [20] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_sexps_repeat1, 2), SHIFT_REPEAT(3),
  [23] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_sexps_repeat1, 2), SHIFT_REPEAT(11),
  [26] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_sexps_repeat1, 2), SHIFT_REPEAT(2),
  [29] = {.entry = {.count = 1, .reusable = true}}, SHIFT(8),
  [31] = {.entry = {.count = 1, .reusable = false}}, SHIFT(5),
  [33] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_sexps, 1),
  [35] = {.entry = {.count = 1, .reusable = false}}, SHIFT(2),
  [37] = {.entry = {.count = 1, .reusable = true}}, SHIFT(9),
  [39] = {.entry = {.count = 1, .reusable = false}}, SHIFT(7),
  [41] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_quote, 2),
  [43] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_quote, 2),
  [45] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_list, 2),
  [47] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_list, 2),
  [49] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_list, 3),
  [51] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_list, 3),
  [53] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_string, 3),
  [55] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_string, 3),
  [57] = {.entry = {.count = 1, .reusable = false}}, SHIFT(13),
  [59] = {.entry = {.count = 1, .reusable = false}}, SHIFT_EXTRA(),
  [61] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
  [63] = {.entry = {.count = 1, .reusable = true}}, SHIFT(10),
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
