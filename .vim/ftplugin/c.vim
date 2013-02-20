" my old c mappings

inoremap ;f <ESC>^"axx"bd$i<TAB>for (int <ESC>"apa = 0; <ESC>"apa < <ESC>"bpa; <ESC>"apa++) {<LF>}<ESC>O
inoremap ;w <ESC>^d$awhile (<ESC>pa) {<LF>}<ESC>O
inoremap ;s <ESC>^d$astruct <ESC>pa {<LF>};<ESC>O
inoremap ;m int main()<LF>{<LF>#<LF>return 0;<LF>}<LF><ESC>?#<LF>cl<TAB>
inoremap ;u using namespace std;<LF>
inoremap ;e #include "euler.h"<LF>
inoremap ;d <ESC>ebv/[ ;*/+-\)]<LF>hyOcerr << "<ESC>pa: " << <ESC>pa << endl;<ESC>
inoremap ;i <ESC>^d$i#include <<ESC>pa><ESC>o
inoremap ;c <ESC>^d$aif (<ESC>pa) {<LF>}<ESC>O

nnoremap ;f ^"axx"bd$i<TAB>for (int <ESC>"apa = 0; <ESC>"apa < <ESC>"bpa; <ESC>"apa++) {<LF>}<ESC>O
nnoremap ;w ^d$awhile (<ESC>pa) {<LF>}<ESC>O
nnoremap ;s ^d$astruct <ESC>pa {<LF>};<ESC>O
nnoremap ;m iint main()<LF>{<LF>#<LF>return 0;<LF>}<LF><ESC>?#<LF>cl<TAB>
nnoremap ;u iusing namespace std;<LF>
nnoremap ;e i#include "euler.h"<LF>
nnoremap ;d ebv/[ ;*/+-\)]<LF>hyOcerr << "<ESC>pa: " << <ESC>pa << endl;<ESC>
nnoremap ;i ^d$i#include <<ESC>pa><ESC>o
nnoremap ;c ^d$aif (<ESC>pa) {<LF>}<ESC>O
nnoremap <C-C> I//<ESC>
nnoremap <C-X> ^xx
nnoremap Q <ESC>?^{<LF>
