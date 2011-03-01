syntax clear
syntax case match
"syntax match Signal   /\(^\|\W\)\u\w\+x[CRSDTA][NP]\?Z\?B\?[IO]\?\($\|\W\)/ contains=SigReset,SigClock,SigTest,SigData,SigStatus
syntax match Signal   /\u\w\+x[CRSDTA][NP]\?Z\?B\?[IO]\?/ contains=SigReset,SigClock,SigTest,SigData,SigStatus
syntax match SigReset /\u\w\+xRB\?[IO]\?/ contained
syntax match SigClock /\u\w\+xC[IO]\?/ contained
syntax match SigTest /\u\w\+xTB\?[IOPN]\?/ contained
syntax match SigData /\u\w\+xD[IOPN]\?/ contained
syntax match SigStatus /\u\w\+xSB\?[IOPN]\?/ contained

highlight Comment ctermfg=LightBlue guifg=LightBlue

highlight SigReset  guifg=Red
highlight SigClock  guifg=Green
highlight SigTest   guifg=#D0A000
highlight SigData   guifg=#404040
highlight SigStatus guifg=Magenta

"highlight SigReset ctermfg=Red guifg=Red
"highlight SigClock ctermfg=Green guifg=Green
"highlight SigTest ctermfg=Yellow guifg=Yellow
"highlight SigData ctermfg=Darkgray guifg=Darkgray
"highlight SigStatus ctermfg=Blue guifg=Blue

