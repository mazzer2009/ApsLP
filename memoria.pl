make_list(N,[]):-
		N=<0,
		!.
make_list(N,[N|Rest]):-
		N>0,
		N2 is N - 1,
		make_list(N2,Rest).

make_list_zero(N,[]):-
		N=<0,
		!.
make_list_zero(N, [0|Rest]):-
		N>0,
		N2 is N-1,
		make_list_zero(N2,Rest).


geraLista(Tamanho,L):- 
		make_list(Tamanho,L).

random(L,Final):- random_permutation(L,Final).
			 

acertou(Element1,Element2):- Element2==Element1.

finalLista(Tamanho,ListaFinal,ListaZero):-
		  geraLista(Tamanho,Lista1),
		  geraLista(Tamanho,Lista2),
		  append(Lista1,Lista2,Lista3),
		  random(Lista3,ListaFinal),
		  TamanhoZero is Tamanho * 2,
		  make_list_zero(TamanhoZero,ListaZero).

replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]):- I > -1, NI is I-1, replace(T, NI, X, R), !.




compara(Pos1,Pos2,Elem,Elem2,ListaFinal,ListaZero,ListaReplace):-
							Elem\==Elem2,
							write('Errou'),nl,
							memoria(ListaFinal,ListaZero).

compara(Pos1,Pos2,Elem,Elem2,ListaFinal,ListaZero,ListaReplace):- Pos1\==Pos2, Elem == Elem2, 
										replace(ListaZero,Pos1,Elem,Listarep), 
										replace(Listarep,Pos2,Elem2,ListaReplace),
										write('Acertou'),nl,
										%write(ListaReplace), 
										memoria(ListaFinal,ListaReplace).

inicializacao(Tamanho,ListaFinal,ListaZero):-
		  write('\nDigite o tamanho da lista: '),
		  read(Tamanho),
		  finalLista(Tamanho,ListaFinal,ListaZero).


memoria(ListaFinal,ListaZero):- ListaFinal == ListaZero,nl,write('FIM'),nl,write(ListaZero),nl.
memoria(ListaFinal,ListaZero):-
		  write(ListaZero),nl,
		  write('\nDigite uma posicao: '),
		  read(Pos1),
		  nth0(Pos1, ListaFinal, Elem),
		  write('Elemento: '), write(Elem),nl,
		  write('\nDigite uma posicao: '),
		  read(Pos2),
		  nth0(Pos2, ListaFinal, Elem2),
		  write('Elemento: '), write(Elem2),nl,
		  compara(Pos1,Pos2,Elem,Elem2,ListaFinal,ListaZero,ListaZeroNova).
		  %write(ListaZeroNova).


jogo(J):- inicializacao(Tamanho,ListaFinal,ListaZero),
		  memoria(ListaFinal,ListaZero).
		  %write('\n'),
		  %write(ListaFinal).	
