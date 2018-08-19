abstract CatGram = {

<<<<<<< HEAD
  flags startcat = Phr ;

  cat 
    S ; NP ; Phr ;

  fun
    MkPhr        : S -> Phr ;
=======
  flags startcat = S ;

  cat 
    S ; NP ; 
    Cat ; Obj Cat ;

  fun
>>>>>>> upstream/master
    Prove        : NP -> NP -> S ;
    Conjecture   : NP -> NP -> S ;
    Walk         : NP -> S ;
    Sleep        : NP -> S ;
    Marcel       : NP ;
    Completeness : NP ;
<<<<<<< HEAD
=======
    Small        : NP -> NP ;
  --  And          : (X : Cat) -> Obj X -> Obj X  ;
>>>>>>> upstream/master
    AndVP        : (NP -> S) -> (NP -> S) -> (NP -> S) ;
    AndV2        : (NP -> NP -> S) -> (NP -> NP -> S) -> (NP -> NP -> S) ;


}