%first line
connected(new_elmarg,elmarg).
connected(elmarg,ezbet_elnakhl).
connected(ezbet_elnakhl,ain_shams).
connected(ain_shams,elmatareyya).
connected(elmatareyya,helmeyet_elzaitoun).
connected(helmeyet_elzaitoun,hadayeq_elzaitoun).
connected(hadayeq_elzaitoun,saray_elqobba).
connected(saray_elqobba,hammamat_elqobba).
connected(hammamat_elqobba,kobri_elqobba).
connected(kobri_elqobba,manshiet_elsadr).
connected(manshiet_elsadr,eldemerdash).
connected(eldemerdash,ghamra).
connected(ghamra,alshohadaa).
connected(alshohadaa,urabi).
connected(urabi,nasser).
connected(nasser,sadat).
connected(sadat,saad_zaghloul).
connected(saad_zaghloul, alsayyeda_zeinab).
connected(alsayyeda_zeinab,elmalek_elsaleh).
connected(elmalek_elsaleh,margirgis).
connected(margirgis,elzahraa).
connected(elzahraa,dar_elsalam).
connected(dar_elsalam,hadayeq_elmaadi).
connected(hadayeq_elmaadi,maadi).
connected(maadi,thakanat_elmaadi).
connected(thakanat_elmaadi,tora_elbalad).
connected(tora_elbalad,kozzika).
connected(kozzika,tora_elasmant).
connected(tora_elasmant,elmaasara).
connected(elmaasara,hadayeq_helwan).
connected(hadayeq_helwan,wadi_hof).
connected(wadi_hof,helwan_university).
connected(helwan_university,ain_helwan).
connected(ain_helwan,helwan).
%second line
connected(shobra_elkheima,koliet_elzeraa).
connected(koliet_elzeraa,mezallat).
connected(mezallat,khalafawy).
connected(khalafawy,sainte_teresa).
connected(sainte_teresa,road_elfarag).
connected(road_elfarag,massara).
connected(massara,alshohadaa).
connected(alshohadaa,ataba).
connected(ataba,naguib).
connected(naguib,sadat).
connected(sadat,opera).
connected(opera,dokki).
connected(dokki,bohooth).
connected(bohooth,cairo_university).
connected(cairo_university,faisal).
connected(faisal,giza).
connected(giza,omm_elmisryeen).
connected(omm_elmisryeen,sakiat_mekki).
connected(sakiat_mekki,elmounib).


%Solutions

%TASK1

path(Y,Y,N,[]).
path(X,Y,N,Z):-
    connected(X,A),
    path(A, Y,N, Z1),
    M = [ [ X, A ] | Z1],
    lengthh(M,L),
    (  N = 'any' ; L < N  ) ->  Z = [ [ X, A ] | Z1].



% X is conncted to y if connected(X,Y) or connected(Y,X)

fbconnected(X,Y):-
    connected(X,Y);
    connected(Y,X).

% function to get the length of the list

my_len(X,A):-
    my_len(X,A,0).
my_len(X,[],X).
my_len(X,[_|A],C):-
    Z is C+1,
    my_len(X,A,Z).


%TASK2

nstations(S,C):-
    findall(N, fbconnected(S,N), L),
   my_len(C,L).


%TASK3



cost(From, To,N) :-
        Z = [From],
	track(From, To, Z,N).

lengthh([],0).
lengthh([_|T],Var):-
        lengthh(T,Var1),
        Var is Var1+1.

calculateTheCost(Length,N):-
    (Length<8 -> N is 3; Length<16 -> N is 5).
calculateTheCost(_,N):-
    N is 7.

track(To, To, Visitied,N) :-
       lengthh(Visitied,R),
       calculateTheCost(R,N),!.
track(From, To, Visitied,N) :-
        dfs(From,To,Visitied,N),!.

dfs(From,To,Visitied,N):-
        (connected(From, Next); connected(Next, From)),
        not(member(Next, Visitied)),
        track(Next,To,[Next|Visitied],N).






%Task4
checkpath([_])
checkpath([[A,B],[B,C]]):-
    connected(X,Y);
    connected(Y,X).




