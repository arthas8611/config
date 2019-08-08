"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap <D-1> #<Space>
autocmd Filetype markdown inoremap <D-2> ##<Space>
autocmd Filetype markdown inoremap <D-3> ###<Space>
autocmd Filetype markdown inoremap <D-4> ####<Space>
autocmd Filetype markdown inoremap <D-5> #####<Space>
autocmd Filetype markdown inoremap ,l --------<Enter>
autocmd Filetype markdown inoremap ,fr \frac{}{<++>}<++><Esc>F{hi
autocmd Filetype markdown inoremap ,sq \sqrt{}<++><Esc>F{li
autocmd Filetype markdown inoremap ,9 ()<++><Esc>F(li
autocmd Filetype markdown inoremap ,[ []<++><Esc>F[li
autocmd Filetype markdown inoremap ,{ {}<++><Esc>F{li
autocmd Filetype markdown inoremap ,' ^{'}
