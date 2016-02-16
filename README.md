# PeopleOnBus-Inference
## Progetto corso Programmazione Dichiarativa

Si consideri un tragitto percorso da un autobus. Si può considerare il tempo trascorso durante il
tragitto come discretizzato. Ovvero come se il tragitto fosse composto da una successione di punti
significativi (per es. le fermate).
Identifichiamo i punti significativi con i numeri P = {1,2,3,...,K}. Vi sono punti "significativi" di
due tipi:
*) le fermate (un insieme di punti F sottoinsieme di P)
*) i checkpoint (l'insieme dei punti che non sono fermate: C = P - F)
Alle fermate l'autobus si ferma e possono salire e/o scendere delle persone. I checkpoint non sono
fermate e nessuno può salire o scendere, ma tra due fermate consecutive ci possono essere uno o più
checkpoint.
Supponiamo di rappresentare anche le persone come numeri interi e che per ogni istante j in C sia
Xj l'insieme (incognito) delle persone a bordo dell'autobus. Per semplicità supponiamo anche che se
una persona scende, poi non risale più.
Supponiamo anche che per ogni checkpoint k in C si sappia che l'insieme delle persone Xk è
incluso in un insieme Yk. (Ovvero Yk e' una stima per eccesso di quali siano le persone a
bordo: Yk include sicuramente tutti quelli che sono a bordo ma potrebbe contenerne anche altri
"estranei").
Si noti che se j, ed h, sono due checkpoint tra due fermate consecutive (cioè tra j e h non c'è alcuna
fermata) allora necessariamente Xj = Xh, inoltre Yj include Xj e Yh include Xh. Ma Yj e Yh
possono essere diversi.
Problema consiste nel determinare tutti gli insiemi Xj incogniti (per ogni j in C) conoscendo solo gli
insiemi Yr (per ogni r in C). Dato che ci potrebbe essere piu' di una sola soluzione (per esempio
la soluzione banale in cui tutti gli Xj sono vuoti e' ammissibile), si vuole identificare la soluzione
che minimizza le cardinalità degli insiemi Yj-Xj. Ovvero quella "ottimista" che considera che le
stime siano più affidabili possibile.

Viene fornita una soluzione al problema sia in linguaggio ASP (Answer Set Programming) sia in CLP (Constraints Logic Programming).
