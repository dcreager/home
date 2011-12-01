" =============================================================================
" File:          autoload/ctrlp/tag.vim
" Description:   Tag file extension
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Init {{{
if exists('g:loaded_ctrlp_tag') && g:loaded_ctrlp_tag
	fini
en
let g:loaded_ctrlp_tag = 1

let s:tag_var = ['ctrlp#tag#init(s:tagfiles)', 'ctrlp#tag#accept',
	\ 'tags', 'tag']

let g:ctrlp_ext_vars = exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
	\ ? add(g:ctrlp_ext_vars, s:tag_var) : [s:tag_var]

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
"}}}
" Utilities {{{
fu! s:times(tagfiles)
	retu map(copy(a:tagfiles), 'getftime(v:val)')
endf

fu! s:nodup(items)
	let dict = {}
	for each in a:items
		cal extend(dict, { each : 0 })
	endfo
	retu keys(dict)
endf

fu! s:concat(lists)
	let lists = []
	for each in a:lists
		cal extend(lists, each)
	endfo
	retu lists
endf

fu! s:findcount(str)
	let [tg, fname] = split(a:str, '\t\+\ze[^\t]\+$')
	let [&l:tags, fname] = [s:ltags, expand(fname, 1)]
	let tgs = taglist('^'.tg.'$')
	if empty(tgs) | retu [0, 0] | en
	let [fnd, ct, pos] = [0, 0, 0]
	for each in tgs
		let ct += 1
		let fulname = fnamemodify(each["filename"], ':p')
		if stridx(fulname, fname) >= 0
			\ && strlen(fname) + stridx(fulname, fname) == strlen(fulname)
			let fnd += 1
			let pos = ct
		en
		if fnd > 1 | brea | en
	endfo
	retu [fnd, pos]
endf
"}}}
" Public {{{
fu! ctrlp#tag#init(tagfiles)
	if empty(a:tagfiles) | retu [] | en
	let tagfiles = sort(s:nodup(a:tagfiles))
	let s:ltags  = join(tagfiles, ',')
	let g:ctrlp_alltags = []
	for each in tagfiles
		let alltags = ctrlp#utils#readfile(each)
		cal extend(g:ctrlp_alltags, alltags)
	endfo
	sy match CtrlPTagFilename '\zs\t.*\ze$'
	hi link CtrlPTagFilename Comment
	retu g:ctrlp_alltags
endf

fu! ctrlp#tag#accept(mode, str)
	cal ctrlp#exit()
	let str = matchstr(a:str, '^[^\t]\+\t\+[^\t]\+\ze\t')
	let [md, tg] = [a:mode, split(str, '^[^\t]\+\zs\t')[0]]
	let fnd = s:findcount(str)
	if fnd[0] == 1
		let cmd = md == 't' ? 'tabe' : md == 'h' ? 'new'
			\ : md == 'v' ? 'vne' : 'ene'
	el
		let cmd = md == 't' ? 'tab stj' : md == 'h' ? 'stj'
			\ : md == 'v' ? 'vert stj' : 'tj'
	en
	let cmd = cmd =~ 'tj\|ene' && &modified ? 'hid '.cmd : cmd
	try
		if fnd[0] == 1
			exe cmd
			let &l:tags = s:ltags
			let tg = tg =~ '^!' ? substitute(tg, '!\(.*\)$', '/^!\1$', '') : tg
			exe fnd[1].'ta' tg
		el
			exe cmd.' '.tg
		en
	cat
		cal ctrlp#msg("Tag not found.")
	endt
endf

fu! ctrlp#tag#id()
	retu s:id
endf
"}}}

" vim:fen:fdl=0:ts=2:sw=2:sts=2
