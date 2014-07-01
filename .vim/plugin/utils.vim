function UpdateHeaderDate()
  let save_cursor  = getpos(".")
  let la = "## Last update @@MDATE@@ @@MAUTHOR@@"
  let la = substitute(la, "@@MDATE@@", strftime("%a %b %d %H:%M:%S %Y"), "ge")
  let la = substitute(la, "@@MAUTHOR@@", $EPI_NAME, "ge")
  execute "silent %s,^## Last update.*," . la . ",ge"
  let lu = "** Last update @@MDATE@@ @@MAUTHOR@@"
  let lu = substitute(lu, "@@MDATE@@", strftime("%a %b %d %H:%M:%S %Y"), "ge")
  let lu = substitute(lu, "@@MAUTHOR@@", $EPI_NAME, "ge")
  execute "silent %s,^\*\* Last update.*," . lu . ",ge"
  call setpos('.', save_cursor)
endfunction

function SetHeader()
  let save_cursor  = getpos(".")
  execute "%s,@@FNAME@@," . expand("%:t") . ",ge"
  execute "silent %s,@@HDR_NAME@@," . toupper(substitute(expand("%:t"),'\..*$',  "","ge")) . ",ge"
  execute "%s,@@PNAME@@," . substitute(substitute(expand("%:p"),'/[^/]*$', "","ge"), "^.*/", "", "ge") . ",ge"
  execute "%s,@@FPATH@@," . substitute(expand("%:p"), '/[^/]*$', "", "ge") . ",ge"
  execute "%s,@@AUTHOR@@," . $EPI_NAME . ",ge"
  execute "%s,@@AUTHORMAIL@@," . substitute(tolower($EPI_LOGIN), " ", ".", "ge") . "@epitech.eu,ge"
  execute "%s,@@MAUTHOR@@," . substitute(tolower($EPI_NAME), " ", ".", "ge")
  execute "%s,@@CDATE@@," . strftime("%a %b %d %H:%M:%S %Y") . ",ge"
  call setpos('.', save_cursor)
endfunction

