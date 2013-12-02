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
fu! s:Subatomic256Highlight(group, where, name, decoration, colors)
  exe 'hi ' . a:group .
        \ ' gui' . a:where . '=' . a:colors[a:name][0] .
        \ ' gui=' . a:decoration
  exe 'hi ' . a:group .
        \ ' cterm' . a:where . '=' . a:colors[a:name][1] .
        \ ' cterm=' . a:decoration
endf

"" Keep everything under a function, so we can write cleaner code.
fu! s:Subatomic256Apply()
  "" reset existing colors
  hi clear

  "" subatomic is a dark theme
  set background=dark

  "" all colors
  let colors = {
        \ 'midnight':          [ '#1c1c1c', 234 ],
        \ 'midnight-1':        [ '#5f5f87', 60  ],
        \ 'midnight-2':        [ '#5f5f87', 60  ],
        \ 'midnight-3':        [ '#5f5f87', 60  ],
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
        \ 'full-green':        [ '#00ff00', 40  ],
        \ 'full-blue':         [ '#0000ff', 19  ],
        \ 'full-yellow':       [ '#ffff00', 220 ],
        \ 'full-magenta':      [ '#ff00ff', 165 ],
        \ 'full-cyan':         [ '#00ffff', 45  ],
        \ }

  " bold = keyword, constant, operator
  let groups = [
        \ [ 'Normal',       'bg', 'midnight',       'none' ],
        \ [ 'Normal',       'fg', 'relaxed-white',  'none' ],
        \ [ 'Comment',      'fg', 'mystic-blue',    'none' ],
        \ [ 'String',       'fg', 'jungle-green',   'none' ],
        \ [ 'Number',       'fg', 'victory-blue',   'none' ],
        \ [ 'StorageClass', 'fg', 'victory-blue',   'bold' ],
        \ [ 'Structure',    'fg', 'victory-blue',   'bold' ],
        \ [ 'Type',         'fg', 'victory-blue',   'bold' ],
        \ [ 'TypeDef',      'fg', 'victory-blue',   'bold' ],
        \ [ 'Identifier',   'fg', 'full-white',     'none' ],
        \ [ 'Keyword',      'fg', 'deep-gold',      'bold' ],
        \ [ 'Constant',     'fg', 'full-white',     'bold' ],
        \ [ 'Function',     'fg', 'victory-blue+1', 'none' ],
        \ [ 'Boolean',      'fg', 'victory-blue+1', 'none' ],
        \ [ 'Operator',     'fg', 'deep-gold',      'bold' ],
        \ [ 'VertSplit',    'fg', 'midnight-2',     'none' ],
        \ [ 'Visual',       'bg', 'mystic-blue',    'none' ],
        \ [ 'Visual',       'fg', 'full-white',     'none' ],
        \ [ 'Label',        'fg', 'deep-gold',      'bold' ],
        \ [ 'Define',       'fg', 'deep-gold',      'bold' ],
        \ [ 'Macro',        'fg', 'victory-blue',   'bold' ],
        \ [ 'Conditional',  'fg', 'deep-gold',      'bold' ],
        \ [ 'vimCommand',   'fg', 'deep-gold',      'bold' ],
        \ [ 'Title',        'fg', 'deep-gold',      'bold' ],
        \ [ 'Special',      'fg', 'deep-gold',      'bold' ],
        \ [ 'Statement',    'fg', 'relaxed-white',  'bold' ],
        \ [ 'PreProc',      'fg', 'victory-blue',   'none' ],
        \ [ 'LineNr',       'fg', 'relaxed-white',  'none' ],
        \ ]

  for group in groups
    call s:Subatomic256Highlight(
          \ group[0],
          \ group[1],
          \ group[2],
          \ group[3],
          \ colors
          \ )
  endfor
endf

"" Run the code to set the theme
call s:Subatomic256Apply()
