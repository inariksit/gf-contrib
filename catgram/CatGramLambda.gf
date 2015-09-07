concrete CatGramLambda of CatGram = {

  lincat
    S, NP = Str ;

  lin
    Prove x y    = "(\\x y . prove' x y)" ++ x ++ y;
    Walk x       =  "(\\x . walk' x )" ++ x;
    Marcel       = "marcel'" ;
    Completeness = "completeness'" ;
    That s       = "That" ++ "(" ++ s ++ ")" ;



}