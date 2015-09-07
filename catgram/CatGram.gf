abstract CatGram = {

  flags startcat = Phr ;

  cat 
    S ; NP ; Phr ;

  fun
    MkPhr        : S -> Phr ;
    Prove        : NP -> NP -> S ;
    Conjecture   : NP -> NP -> S ;
    Walk         : NP -> S ;
    Sleep        : NP -> S ;
    Marcel       : NP ;
    Completeness : NP ;
    AndVP        : (NP -> S) -> (NP -> S) -> (NP -> S) ;
    AndV2        : (NP -> NP -> S) -> (NP -> NP -> S) -> (NP -> NP -> S) ;


}