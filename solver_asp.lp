{xj(J,P):checkpoint(J),person(P)}:-yj(J,P).

:-xj(J,P),checkpoint(J),person(P),J==I+1,checkpoint(I),not xj(I,P).
:-xj(J,P),checkpoint(J),person(P),J==I-1,checkpoint(I),not xj(I,P).

#maximize{xj(J,P):checkpoint(J),person(P)}.
#hide.
#show xj/2.