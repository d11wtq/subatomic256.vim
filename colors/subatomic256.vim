""" subatomic256.vim: Port of the Emacs subatomic256-theme.

"" Copyright (c) 2013 Chris Corbyn
""
"" Author:  Chris Corbyn <chris@w3style.co.uk>
"" URL:     https://github.com/d11wtq/subatomic256.vim
"" Version: 1.3
""
"" This file is free software: you can redistribute it and/or modify
"" it under the terms of the GNU General Public License as published
"" by the Free Software Foundation, either version 3 of the License,
"" or (at your option) any later version.
""
"" This file is distributed in the hope that it will be useful, but
"" WITHOUT ANY WARRANTY; without even the implied warranty of
"" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
"" General Public License for more details.
""
"" You should have received a copy of the GNU General Public License
"" along with this file.  If not, see <http://www.gnu.org/licenses/>.

" all 256 colors available in 256 color terminals
let palette = {
      \   0: '#000000',   1: '#cd0000',   2: '#00cd00',   3: '#cdcd00',
      \   4: '#0000ee',   5: '#cd00cd',   6: '#00cdcd',   7: '#e5e5e5',
      \   8: '#7f7f7f',   9: '#ff0000',  10: '#00ff00',  11: '#ffff00',
      \  12: '#5c5cff',  13: '#ff00ff',  14: '#00ffff',  15: '#ffffff',
      \  16: '#000000',  17: '#00005f',  18: '#000087',  19: '#0000af',
      \  20: '#0000d7',  21: '#0000ff',  22: '#005f00',  23: '#005f5f',
      \  24: '#005f87',  25: '#005faf',  26: '#005fd7',  27: '#005fff',
      \  28: '#008700',  29: '#00875f',  30: '#008787',  31: '#0087af',
      \  32: '#0087d7',  33: '#0087ff',  34: '#00af00',  35: '#00af5f',
      \  36: '#00af87',  37: '#00afaf',  38: '#00afd7',  39: '#00afff',
      \  40: '#00d700',  41: '#00d75f',  42: '#00d787',  43: '#00d7af',
      \  44: '#00d7d7',  45: '#00d7ff',  46: '#00ff00',  47: '#00ff5f',
      \  48: '#00ff87',  49: '#00ffaf',  50: '#00ffd7',  51: '#00ffff',
      \  52: '#5f0000',  53: '#5f005f',  54: '#5f0087',  55: '#5f00af',
      \  56: '#5f00d7',  57: '#5f00ff',  58: '#5f5f00',  59: '#5f5f5f',
      \  60: '#5f5f87',  61: '#5f5faf',  62: '#5f5fd7',  63: '#5f5fff',
      \  64: '#5f8700',  65: '#5f875f',  66: '#5f8787',  67: '#5f87af',
      \  68: '#5f87d7',  69: '#5f87ff',  70: '#5faf00',  71: '#5faf5f',
      \  72: '#5faf87',  73: '#5fafaf',  74: '#5fafd7',  75: '#5fafff',
      \  76: '#5fd700',  77: '#5fd75f',  78: '#5fd787',  79: '#5fd7af',
      \  80: '#5fd7d7',  81: '#5fd7ff',  82: '#5fff00',  83: '#5fff5f',
      \  84: '#5fff87',  85: '#5fffaf',  86: '#5fffd7',  87: '#5fffff',
      \  88: '#870000',  89: '#87005f',  90: '#870087',  91: '#8700af',
      \  92: '#8700d7',  93: '#8700ff',  94: '#875f00',  95: '#875f5f',
      \  96: '#875f87',  97: '#875faf',  98: '#875fd7',  99: '#875fff',
      \ 100: '#878700', 101: '#87875f', 102: '#878787', 103: '#8787af',
      \ 104: '#8787d7', 105: '#8787ff', 106: '#87af00', 107: '#87af5f',
      \ 108: '#87af87', 109: '#87afaf', 110: '#87afd7', 111: '#87afff',
      \ 112: '#87d700', 113: '#87d75f', 114: '#87d787', 115: '#87d7af',
      \ 116: '#87d7d7', 117: '#87d7ff', 118: '#87ff00', 119: '#87ff5f',
      \ 120: '#87ff87', 121: '#87ffaf', 122: '#87ffd7', 123: '#87ffff',
      \ 124: '#af0000', 125: '#af005f', 126: '#af0087', 127: '#af00af',
      \ 128: '#af00d7', 129: '#af00ff', 130: '#af5f00', 131: '#af5f5f',
      \ 132: '#af5f87', 133: '#af5faf', 134: '#af5fd7', 135: '#af5fff',
      \ 136: '#af8700', 137: '#af875f', 138: '#af8787', 139: '#af87af',
      \ 140: '#af87d7', 141: '#af87ff', 142: '#afaf00', 143: '#afaf5f',
      \ 144: '#afaf87', 145: '#afafaf', 146: '#afafd7', 147: '#afafff',
      \ 148: '#afd700', 149: '#afd75f', 150: '#afd787', 151: '#afd7af',
      \ 152: '#afd7d7', 153: '#afd7ff', 154: '#afff00', 155: '#afff5f',
      \ 156: '#afff87', 157: '#afffaf', 158: '#afffd7', 159: '#afffff',
      \ 160: '#d70000', 161: '#d7005f', 162: '#d70087', 163: '#d700af',
      \ 164: '#d700d7', 165: '#d700ff', 166: '#d75f00', 167: '#d75f5f',
      \ 168: '#d75f87', 169: '#d75faf', 170: '#d75fd7', 171: '#d75fff',
      \ 172: '#d78700', 173: '#d7875f', 174: '#d78787', 175: '#d787af',
      \ 176: '#d787d7', 177: '#d787ff', 178: '#d7af00', 179: '#d7af5f',
      \ 180: '#d7af87', 181: '#d7afaf', 182: '#d7afd7', 183: '#d7afff',
      \ 184: '#d7d700', 185: '#d7d75f', 186: '#d7d787', 187: '#d7d7af',
      \ 188: '#d7d7d7', 189: '#d7d7ff', 190: '#d7ff00', 191: '#d7ff5f',
      \ 192: '#d7ff87', 193: '#d7ffaf', 194: '#d7ffd7', 195: '#d7ffff',
      \ 196: '#ff0000', 197: '#ff005f', 198: '#ff0087', 199: '#ff00af',
      \ 200: '#ff00d7', 201: '#ff00ff', 202: '#ff5f00', 203: '#ff5f5f',
      \ 204: '#ff5f87', 205: '#ff5faf', 206: '#ff5fd7', 207: '#ff5fff',
      \ 208: '#ff8700', 209: '#ff875f', 210: '#ff8787', 211: '#ff87af',
      \ 212: '#ff87d7', 213: '#ff87ff', 214: '#ffaf00', 215: '#ffaf5f',
      \ 216: '#ffaf87', 217: '#ffafaf', 218: '#ffafd7', 219: '#ffafff',
      \ 220: '#ffd700', 221: '#ffd75f', 222: '#ffd787', 223: '#ffd7af',
      \ 224: '#ffd7d7', 225: '#ffd7ff', 226: '#ffff00', 227: '#ffff5f',
      \ 228: '#ffff87', 229: '#ffffaf', 230: '#ffffd7', 231: '#ffffff',
      \ 232: '#080808', 233: '#121212', 234: '#1c1c1c', 235: '#262626',
      \ 236: '#303030', 237: '#3a3a3a', 238: '#444444', 239: '#4e4e4e',
      \ 240: '#585858', 241: '#626262', 242: '#6c6c6c', 243: '#767676',
      \ 244: '#808080', 245: '#8a8a8a', 246: '#949494', 247: '#9e9e9e',
      \ 248: '#a8a8a8', 249: '#b2b2b2', 250: '#bcbcbc', 251: '#c6c6c6',
      \ 252: '#d0d0d0', 253: '#dadada', 254: '#e4e4e4', 255: '#eeeeee',
      \ }

"" Avoid repeating colors by referring to them by name
fu! s:Subatomic256Highlight(dict)
  let command = join([
        \ 'hi ',
        \ a:dict['higroup'],
        \ ' ',
        \ a:dict['vimtype'], a:dict['where'],
        \ '=',
        \ a:dict['color'],
        \ ' ',
        \ a:dict['vimtype'],
        \ '=',
        \ a:dict['style'],
        \ ], '')
  exe command
endf

"" Keep everything under a function, so we can write cleaner code.
fu! s:Subatomic256Apply(palette)
  "" dark background colors
  let darkcolors = {
        \ 'midnight':         234,
        \ 'midnight-1':       61,
        \ 'midnight-2':       240,
        \ 'midnight-3':       233,
        \ 'midnight-4':       234,
        \ 'mystic-blue':      60,
        \ 'mystic-blue+1':    60,
        \ 'victory-blue':     109,
        \ 'victory-blue+1':   110,
        \ 'jungle-green':     149,
        \ 'deep-gold':        214,
        \ 'axiomatic-purple': 177,
        \ 'brick-red':        208,
        \ 'piggy-pink':       218,
        \ 'relaxed-white':    188,
        \ 'cold-mud':         224,
        \ 'sky-blue':         60,
        \
        \ 'full-white':       231,
        \ 'full-black':       232,
        \ 'full-green':       46,
        \ 'full-blue':        19,
        \ }

  "" light background colors
  let lightcolors = {
        \ 'midnight':         255,
        \ 'midnight-1':       61,
        \ 'midnight-2':       240,
        \ 'midnight-3':       231,
        \ 'midnight-4':       253,
        \ 'mystic-blue':      242,
        \ 'mystic-blue+1':    253,
        \ 'victory-blue':     26,
        \ 'victory-blue+1':   24,
        \ 'jungle-green':     28,
        \ 'deep-gold':        196,
        \ 'axiomatic-purple': 91,
        \ 'brick-red':        160,
        \ 'piggy-pink':       201,
        \ 'relaxed-white':    234,
        \ 'cold-mud':         132,
        \ 'sky-blue':         189,
        \
        \ 'full-white':       232,
        \ 'full-black':       231,
        \ 'full-green':       46,
        \ 'full-blue':        45,
        \ }

  " pick the best color palette for the background
  let colors = &background == 'dark' ? darkcolors : lightcolors

  " define colors and styles to be applied
  let groups = [
        \ [ 'Normal',              'bg', 'midnight',         'none'      ],
        \ [ 'Normal',              'fg', 'relaxed-white',    'none'      ],
        \ [ 'ColorColumn',         'bg', 'midnight-3',       'none'      ],
        \ [ 'Comment',             'fg', 'mystic-blue',      'none'      ],
        \ [ 'String',              'fg', 'jungle-green',     'none'      ],
        \ [ 'JavaScriptStrings',   'fg', 'jungle-green',     'none'      ],
        \ [ 'phpStringSingle',     'fg', 'jungle-green',     'none'      ],
        \ [ 'phpStringDouble',     'fg', 'jungle-green',     'none'      ],
        \ [ 'htmlString',          'fg', 'jungle-green',     'none'      ],
        \ [ 'Character',           'fg', 'axiomatic-purple', 'none'      ],
        \ [ 'Number',              'fg', 'victory-blue',     'none'      ],
        \ [ 'Float',               'fg', 'victory-blue+1',   'none'      ],
        \ [ 'Delimiter',           'fg', 'relaxed-white',    'none'      ],
        \ [ 'StorageClass',        'fg', 'victory-blue',     'bold'      ],
        \ [ 'Structure',           'fg', 'victory-blue',     'bold'      ],
        \ [ 'Type',                'fg', 'victory-blue',     'bold'      ],
        \ [ 'Identifier',          'fg', 'full-white',       'none'      ],
        \ [ 'Keyword',             'fg', 'deep-gold',        'none'      ],
        \ [ 'Constant',            'fg', 'full-white',       'bold'      ],
        \ [ 'Function',            'fg', 'victory-blue+1',   'none'      ],
        \ [ 'Boolean',             'fg', 'victory-blue+1',   'none'      ],
        \ [ 'Operator',            'fg', 'deep-gold',        'bold'      ],
        \ [ 'Include',             'fg', 'cold-mud',         'none'      ],
        \ [ 'VertSplit',           'fg', 'midnight-2',       'none'      ],
        \ [ 'Visual',              'bg', 'sky-blue',         'none'      ],
        \ [ 'Visual',              'fg', 'full-white',       'none'      ],
        \ [ 'VisualNOS',           'bg', 'sky-blue',         'none'      ],
        \ [ 'VisualNOS',           'fg', 'full-white',       'none'      ],
        \ [ 'Label',               'fg', 'deep-gold',        'bold'      ],
        \ [ 'Define',              'fg', 'deep-gold',        'bold'      ],
        \ [ 'Macro',               'fg', 'victory-blue',     'bold'      ],
        \ [ 'Conditional',         'fg', 'deep-gold',        'bold'      ],
        \ [ 'LocalVariable',       'fg', 'relaxed-white',    'none'      ],
        \ [ 'vimCommand',          'fg', 'deep-gold',        'bold'      ],
        \ [ 'Title',               'fg', 'deep-gold',        'bold'      ],
        \ [ 'Special',             'fg', 'deep-gold',        'bold'      ],
        \ [ 'Exception',           'fg', 'piggy-pink',       'bold'      ],
        \ [ 'Statement',           'fg', 'relaxed-white',    'bold'      ],
        \ [ 'PreProc',             'fg', 'victory-blue',     'none'      ],
        \ [ 'PreCondit',           'fg', 'relaxed-white',    'none'      ],
        \ [ 'LineNr',              'bg', 'midnight-4',       'none'      ],
        \ [ 'LineNr',              'fg', 'relaxed-white',    'none'      ],
        \ [ 'Cursor',              'bg', 'midnight-2',       'none'      ],
        \ [ 'CursorColumn',        'bg', 'midnight-3',       'none'      ],
        \ [ 'CursorLine',          'bg', 'midnight-3',       'none'      ],
        \ [ 'Search',              'bg', 'relaxed-white',    'none'      ],
        \ [ 'Search',              'fg', 'full-blue',        'bold'      ],
        \ [ 'IncSearch',           'bg', 'midnight-2',       'none'      ],
        \ [ 'IncSearch',           'fg', 'full-green',       'bold'      ],
        \ [ 'MatchParen',          'bg', 'midnight-1',       'none'      ],
        \ [ 'MatchParen',          'fg', 'full-green',       'bold'      ],
        \ [ 'StatusLine',          'bg', 'mystic-blue+1',    'none'      ],
        \ [ 'StatusLine',          'fg', 'relaxed-white',    'bold'      ],
        \ [ 'StatusLineNC',        'bg', 'midnight-2',       'none'      ],
        \ [ 'StatusLineNC',        'fg', 'full-black',       'none'      ],
        \ [ 'Todo',                'bg', 'midnight-1',       'none'      ],
        \ [ 'Todo',                'fg', 'piggy-pink',       'bold'      ],
        \ [ 'Underlined',          'fg', 'relaxed-white',    'underline' ],
        \ [ 'SpecialChar',         'fg', 'brick-red',        'none'      ],
        \ [ 'DefinedName',         'fg', 'relaxed-white',    'none'      ],
        \ [ 'htmlTagName',         'fg', 'relaxed-white',    'none'      ],
        \ [ 'SpecialComment',      'fg', 'axiomatic-purple', 'none'      ],
        \ [ 'Error',               'bg', 'midnight',         'none'      ],
        \ [ 'Error',               'fg', 'piggy-pink',       'bold'      ],
        \ [ 'ErrorMsg',            'fg', 'relaxed-white',    'none'      ],
        \ [ 'WarningMsg',          'fg', 'piggy-pink',       'none'      ],
        \ [ 'NonText',             'fg', 'midnight-1',       'none'      ],
        \ [ 'Tag',                 'fg', 'relaxed-white',    'none'      ],
        \ [ 'PMenu',               'bg', 'mystic-blue',      'none'      ],
        \ [ 'PMenu',               'fg', 'relaxed-white',    'none'      ],
        \ [ 'PMenuSbar',           'fg', 'relaxed-white',    'none'      ],
        \ [ 'PMenuSel',            'bg', 'full-white',       'none'      ],
        \ [ 'PMenuSel',            'fg', 'full-black',       'none'      ],
        \ [ 'PMenuThumb',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'WildMenu',            'bg', 'midnight',         'none'      ],
        \ [ 'WildMenu',            'fg', 'deep-gold',        'bold'      ],
        \ [ 'FoldColumn',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'Folded',              'bg', 'relaxed-white',    'none'      ],
        \ [ 'Folded',              'fg', 'midnight',         'none'      ],
        \ [ 'Directory',           'fg', 'relaxed-white',    'bold'      ],
        \ [ 'ModeMsg',             'fg', 'relaxed-white',    'none'      ],
        \ [ 'MoreMsg',             'fg', 'relaxed-white',    'none'      ],
        \ [ 'Question',            'fg', 'relaxed-white',    'bold'      ],
        \ [ 'SpellBad',            'fg', 'brick-red',        'none'      ],
        \ [ 'SpellCap',            'fg', 'relaxed-white',    'none'      ],
        \ [ 'SpellLocal',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'SpellRare',           'fg', 'relaxed-white',    'none'      ],
        \
        \
        \ [ 'CTagsClass',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'CTagsGlobalConstant', 'fg', 'relaxed-white',    'none'      ],
        \ [ 'CTagsGlobalVariable', 'fg', 'relaxed-white',    'none'      ],
        \ [ 'CTagsImport',         'fg', 'relaxed-white',    'none'      ],
        \ [ 'CTagsMember',         'fg', 'relaxed-white',    'none'      ],
        \ [ 'Debug',               'fg', 'relaxed-white',    'none'      ],
        \ [ 'DiffAdd',             'fg', 'relaxed-white',    'none'      ],
        \ [ 'DiffChange',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'DiffDelete',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'DiffText',            'fg', 'relaxed-white',    'none'      ],
        \ [ 'EnumerationName',     'fg', 'relaxed-white',    'none'      ],
        \ [ 'EnumerationValue',    'fg', 'relaxed-white',    'none'      ],
        \ [ 'Ignore',              'fg', 'relaxed-white',    'none'      ],
        \ [ 'Repeat',              'fg', 'relaxed-white',    'none'      ],
        \ [ 'SignColumn',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'SpecialKey',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'TabLine',             'fg', 'relaxed-white',    'none'      ],
        \ [ 'TabLineFill',         'fg', 'relaxed-white',    'none'      ],
        \ [ 'TabLineSel',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'Typedef',             'fg', 'relaxed-white',    'none'      ],
        \ [ 'Union',               'fg', 'relaxed-white',    'none'      ],
        \ [ 'pythonBuiltin',       'fg', 'relaxed-white',    'none'      ],
        \ ]

  for group in groups
    let vimtypes  = {0: 'gui', 1: 'cterm'}
    let termcolor = colors[group[2]]

    for key in keys(vimtypes)
      call s:Subatomic256Highlight({
            \ 'vimtype': vimtypes[key],
            \ 'where':   group[1],
            \ 'higroup': group[0],
            \ 'color':   key ? termcolor : a:palette[termcolor],
            \ 'style':   group[3]
            \ })
    endfor
  endfor
endf

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = 'subatomic256'

"" Run the code to set the theme
call s:Subatomic256Apply(palette)
