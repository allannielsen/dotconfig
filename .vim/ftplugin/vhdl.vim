imap <buffer> <C-e>e <Esc>bdwientity <Esc>pa is<CR>end entity ;<Esc>POport (<CR>);<Esc>O
imap <buffer> <C-e>a <Esc>b"zdwiarchitecture <Esc>pa of <Esc>mz?entity<CR>wyw`zpa is<CR>begin<CR>end architecture ;<Esc>"zPO
imap <buffer> <C-e>p <Esc>bywA : process ()<CR>begin<CR>end process ;<Esc>PO<+process body+><Esc>?)<CR>i
imap <buffer> <C-e>q <Esc>mqbywA : process (clk_i, reset_i)<CR>begin<CR>if reset_i = '1' then<CR><+reset-rutine+><CR>elsif clk_i = '1' and clk_i'event then<CR><+process-body+><CR>end if;<CR>end process;<Esc>'q<CR>i
imap <buffer> <C-e>g <Esc>bdwipackage <Esc>pa is<CR><BS>end package ;<Esc>PO    
imap <buffer> <C-e>c case  is<CR>when <+state1+> =><CR><+action1+><CR>when <+state2+> =><CR><+action2+><CR>when others => null;<CR>end case;<Esc>6k$2hi
imap <buffer> <C-e>i if  then<CR><+do_something+>;<CR>elsif <+condition2+> then<CR><+do_something_else+>;<CR>else<CR><+do_something_else+>;<CR>end if;<Esc>6k$4hi
imap <buffer> <C-e>s assert <+expr+> report "<+string+>" severity <+note\|error\|failure+>;<+done+><Esc>0i

imap <buffer> ,, <= 
imap <buffer> .. => 

iabbr dt downto
iabbr sig signal
iabbr gen generate
iabbr ot0 (others => '0')
iabbr ot1 (others => '1')
iabbr sl std_logic
iabbr slv std_logic_vector
iabbr uns unsigned
iabbr toi to_integer
iabbr tos to_unsigned
iabbr tou to_unsigned
imap  <buffer> I: I : in 
imap  <buffer> O: O : out 


set list listchars=tab:»·,trail:·,extends:¿,nbsp:¿
set et

