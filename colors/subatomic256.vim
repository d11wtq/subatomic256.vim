""" subatomic256.vim: Port of the Emacs subatomic256-theme.

"" Copyright (c) 2013 Chris Corbyn
""
"" Author:  Chris Corbyn <chris@w3style.co.uk>
"" URL:     https://github.com/d11wtq/subatomic256.vim
"" Version: 1.0
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
fu! s:Subatomic256Apply()
  "" reset existing colors
  hi clear

  "" dark background colors
  let darkcolors = {
        \ 'midnight':          [ '#1c1c1c', 234 ],
        \ 'midnight-1':        [ '#5f5f87', 61  ],
        \ 'midnight-2':        [ '#5f5f87', 240 ],
        \ 'midnight-3':        [ '#5f5f87', 233 ],
        \ 'midnight-4':        [ '#1c1c1c', 234 ],
        \ 'mystic-blue':       [ '#5f5f87', 60  ],
        \ 'victory-blue':      [ '#87afaf', 109 ],
        \ 'victory-blue+1':    [ '#87afd7', 110 ],
        \ 'jungle-green':      [ '#afd75f', 149 ],
        \ 'undergrowth-green': [ '#87af5f', 107 ],
        \ 'deep-gold':         [ '#ffaf00', 214 ],
        \ 'axiomatic-purple':  [ '#af5faf', 177 ],
        \ 'brick-red':         [ '#d7875f', 208 ],
        \ 'piggy-pink':        [ '#ffd7d7', 218 ],
        \ 'relaxed-white':     [ '#d7d7d7', 188 ],
        \ 'cold-mud':          [ '#d7afaf', 224 ],
        \
        \ 'full-white':        [ '#ffffff', 231 ],
        \ 'full-black':        [ '#000000', 232 ],
        \ 'full-red':          [ '#ff0000', 160 ],
        \ 'full-green':        [ '#00ff00', 46  ],
        \ 'full-blue':         [ '#0000ff', 19  ],
        \ 'full-yellow':       [ '#ffff00', 220 ],
        \ 'full-magenta':      [ '#ff00ff', 165 ],
        \ 'full-cyan':         [ '#00ffff', 45  ],
        \ }

  "" light background colors
  let lightcolors = {
        \ 'midnight':          [ '#d7d7d7', 188 ],
        \ 'midnight-1':        [ '#5f5f87', 61  ],
        \ 'midnight-2':        [ '#5f5f87', 240 ],
        \ 'midnight-3':        [ '#ffffff', 231 ],
        \ 'midnight-4':        [ '#d7d7d7', 251 ],
        \ 'mystic-blue':       [ '#5f875f', 65  ],
        \ 'victory-blue':      [ '#005fd7', 26  ],
        \ 'victory-blue+1':    [ '#005f87', 24  ],
        \ 'jungle-green':      [ '#008700', 23  ],
        \ 'undergrowth-green': [ '#87af5f', 107 ],
        \ 'deep-gold':         [ '#d75f00', 166 ],
        \ 'axiomatic-purple':  [ '#8700af', 91  ],
        \ 'brick-red':         [ '#d7875f', 160 ],
        \ 'piggy-pink':        [ '#ff00ff', 201 ],
        \ 'relaxed-white':     [ '#1c1c1c', 234 ],
        \ 'cold-mud':          [ '#d7afaf', 132 ],
        \
        \ 'full-white':        [ '#000000', 232 ],
        \ 'full-black':        [ '#ffffff', 231 ],
        \ 'full-red':          [ '#ff0000', 160 ],
        \ 'full-green':        [ '#00ff00', 46  ],
        \ 'full-blue':         [ '#00ffff', 45  ],
        \ 'full-yellow':       [ '#ffff00', 220 ],
        \ 'full-magenta':      [ '#ff00ff', 165 ],
        \ 'full-cyan':         [ '#00ffff', 45  ],
        \ }

  " pick the best color palette for the background
  let colors = &background == 'dark' ? darkcolors : lightcolors

  " define colors and styles to be applied
  let groups = [
        \ [ 'Normal',              'bg', 'midnight',         'none'      ],
        \ [ 'Normal',              'fg', 'relaxed-white',    'none'      ],
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
        \ [ 'Visual',              'bg', 'mystic-blue',      'none'      ],
        \ [ 'Visual',              'fg', 'full-white',       'none'      ],
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
        \ [ 'Cursor',              'fg', 'relaxed-white',    'none'      ],
        \ [ 'CursorColumn',        'bg', 'midnight-3',       'none'      ],
        \ [ 'CursorLine',          'bg', 'midnight-3',       'none'      ],
        \ [ 'Search',              'bg', 'relaxed-white',    'none'      ],
        \ [ 'Search',              'fg', 'full-blue',        'bold'      ],
        \ [ 'IncSearch',           'bg', 'midnight-2',       'none'      ],
        \ [ 'IncSearch',           'fg', 'full-green',       'bold'      ],
        \ [ 'MatchParen',          'bg', 'midnight-2',       'none'      ],
        \ [ 'MatchParen',          'fg', 'full-green',       'bold'      ],
        \ [ 'StatusLine',          'bg', 'mystic-blue',      'none'      ],
        \ [ 'StatusLine',          'fg', 'relaxed-white',    'bold'      ],
        \ [ 'StatusLineNC',        'bg', 'midnight-2',       'none'      ],
        \ [ 'StatusLineNC',        'fg', 'relaxed-white',    'none'      ],
        \ [ 'Todo',                'bg', 'midnight-1',       'none'      ],
        \ [ 'Todo',                'fg', 'piggy-pink',       'bold'      ],
        \ [ 'Underlined',          'fg', 'relaxed-white',    'underline' ],
        \ [ 'SpecialChar',         'fg', 'brick-red',        'none'      ],
        \ [ 'DefinedName',         'fg', 'relaxed-white',    'none'      ],
        \ [ 'htmlTagName',         'fg', 'relaxed-white',    'none'      ],
        \ [ 'SpecialComment',      'fg', 'axiomatic-purple', 'none'      ],
        \ [ 'Error',               'fg', 'piggy-pink',       'bold'      ],
        \ [ 'ErrorMsg',            'fg', 'relaxed-white',    'none'      ],
        \ [ 'WarningMsg',          'fg', 'piggy-pink',       'none'      ],
        \ [ 'NonText',             'fg', 'relaxed-white',    'none'      ],
        \ [ 'Tag',                 'fg', 'relaxed-white',    'none'      ],
        \ [ 'PMenu',               'bg', 'mystic-blue',      'none'      ],
        \ [ 'PMenu',               'fg', 'relaxed-white',    'none'      ],
        \ [ 'PMenuSbar',           'fg', 'relaxed-white',    'none'      ],
        \ [ 'PMenuSel',            'bg', 'full-white',       'none'      ],
        \ [ 'PMenuSel',            'fg', 'full-black',       'none'      ],
        \ [ 'PMenuThumb',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'WildMenu',            'bg', 'midnight-1',       'none'      ],
        \ [ 'WildMenu',            'fg', 'relaxed-white',    'none'      ],
        \ [ 'FoldColumn',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'Folded',              'bg', 'relaxed-white',    'none'      ],
        \ [ 'Folded',              'fg', 'midnight',         'none'      ],
        \ [ 'Directory',           'fg', 'relaxed-white',    'bold'      ],
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
        \ [ 'ModeMsg',             'fg', 'relaxed-white',    'none'      ],
        \ [ 'MoreMsg',             'fg', 'relaxed-white',    'none'      ],
        \ [ 'Question',            'fg', 'relaxed-white',    'none'      ],
        \ [ 'Repeat',              'fg', 'relaxed-white',    'none'      ],
        \ [ 'SignColumn',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'SpecialKey',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'SpellBad',            'fg', 'relaxed-white',    'none'      ],
        \ [ 'SpellCap',            'fg', 'relaxed-white',    'none'      ],
        \ [ 'SpellLocal',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'SpellRare',           'fg', 'relaxed-white',    'none'      ],
        \ [ 'TabLine',             'fg', 'relaxed-white',    'none'      ],
        \ [ 'TabLineFill',         'fg', 'relaxed-white',    'none'      ],
        \ [ 'TabLineSel',          'fg', 'relaxed-white',    'none'      ],
        \ [ 'Typedef',             'fg', 'relaxed-white',    'none'      ],
        \ [ 'Union',               'fg', 'relaxed-white',    'none'      ],
        \ [ 'VisualNOS',           'fg', 'relaxed-white',    'none'      ],
        \ [ 'pythonBuiltin',       'fg', 'relaxed-white',    'none'      ],
        \ ]

  for group in groups
    let vimtypes = {0: 'gui', 1: 'cterm'}

    for key in keys(vimtypes)
      call s:Subatomic256Highlight({
            \ 'vimtype': vimtypes[key],
            \ 'where':   group[1],
            \ 'higroup': group[0],
            \ 'color':   colors[group[2]][key],
            \ 'style':   group[3]
            \ })
    endfor
  endfor
endf

"" Run the code to set the theme
call s:Subatomic256Apply()
