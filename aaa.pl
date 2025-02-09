% Medical diagnosis expert system
:- dynamic yes/1, no/1.

% Main diagnosis predicate
check :-
    checkfor(Disease),
    write('I believe you have '),
    write(Disease),
    nl,
    undo.

% Disease definition
checkfor(cold) :- cold.

% Cold symptoms check
cold :-
    checkSymptom(runny_nose),
    checkSymptom(headache),
    checkSymptom(sore_throat),
    nl.

% Ask questions about symptoms
askQuestion(Question) :-
    write('Do you have the symptom '),
    write(Question),
    write('? (yes/no): '),
    read(Reply),
    nl,
    ( (Reply == yes ; Reply == y)
    ->  assert(yes(Question))
    ;   assert(no(Question)), fail).

% Check if symptom exists
checkSymptom(S) :-
    (yes(S)
    ->  true
    ;   (no(S)
        ->  fail
        ;   askQuestion(S))).

% Clean up the knowledge base
undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.

% Example query
% ?- check.
