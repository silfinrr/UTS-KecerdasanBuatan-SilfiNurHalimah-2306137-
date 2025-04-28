% Fakta dan aturan
gejala('Aphid', ['daun_menguning', 'tanaman_layu']).
gejala('Thrips', ['bercak_hitam']).
gejala('Ulat', ['daun_berlubang']).
gejala('Tungau', ['daun_menguning', 'bercak_hitam']).

% Diagnosa pasti
diagnosa_pasti(GejalaInput, Hama) :-
    gejala(Hama, GejalaHama),
    subset(GejalaHama, GejalaInput).

% Diagnosa kemungkinan
diagnosa_kemungkinan(GejalaInput, Hama, Cocok) :-
    gejala(Hama, GejalaHama),
    findall(G, (member(G, GejalaHama), member(G, GejalaInput)), Cocok),
    length(Cocok, L),
    L > 0,
    L < length(GejalaHama).
