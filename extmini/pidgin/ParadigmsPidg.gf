resource ParadigmsPidg = GrammarPidg [N, PN, A, V, V2] **
  open ResPidg in {

oper

{- ParadigmsPidg: functions that construct full paradigms out of small 
  set of sample words. They are all called `mkSomething'.

   Explanation of the conventional structure of Paradigms in bigger grammars
   will follow after the horizontal line. 
   This is all you need for the current ParadigmsPidg.
-}

-- NOUNS

    mkN : Str -> N ;                              -- Type signature
    mkN str = lin N (ResPidg.mkNounyThing str) ;  -- Body of the function

    --You can also write it on one line:
    --mkN' : Str -> N = \str -> lin N (ResPidg.mkNounyThing str) ;

    mkPN : Str -> PN ;
    mkPN str = lin PN (ResPidg.mkNounyThing str) ; --Same mkNounyThing, but wrapped in `lin PN'!

-- VERBS
    mkV : Str -> V ; -- Type signature of the function
    mkV str = lin V (ResPidg.mkVerbyThing str) ;

    mkV2 : Str -> V2 ;
    mkV2 str = lin V2 (ResPidg.mkVerbyThing str) ; 

-- ADJECTIVES
    mkA : Str -> A ; 
    mkA str = lin A (ResPidg.mkNounyThing str) ;





--------------------------------------------------------------------------------
-- The usual structure for Paradigms is a bit more complicated.
-- This is because the files are so big for a full resource grammar.
-- You will do just fine with the structure above, but if you want to 
-- read other files, the following could be useful.
  
 --1. A list of type signatures are separated from their definitions.
   mkSameStr : Str -> Str ; 
   mkOneStringFromTwoAndPutThemInARecord : Str -> Str -> {s : Str} ;


   mkV2' : overload {      -- Overload: many functions have the same name,
     mkV2' : Str -> V2 ;  -- but with different arguments.
     mkV2' : Str -> Str -> V2 ;
   } ;


 --2. The function definitions

    mkSameStr str = str ;

    mkOneStringFromTwoAndPutThemInARecord str1 str2 = {s = str1 ++ str2} ;  

    mkV2' = overload {
      mkV2' : Str -> V2 
       = \str -> lin V2 {s = str} ; -- you can construct it in place...

      mkV2' : Str -> Str -> V2 
       = \str1,str2 -> helperV2 str1 str2  --...or call a helper function!
    } ;                                    --Helper fun can also be from another module.



{- Are you wondering what is `lin Foo'?  For instance: -}
    helperV2 : Str -> Str -> V2
      = \str1,str2 -> lin V2 (mkOneStringFromTwoAndPutThemInARecord str1 str2) ;

{-
This `helperV2' function calls mkOneStringFromTwoAndPutThemInARecord, 
which only creates a {s : Str}.
But we want to make the resulting record to be explicitly of type V2.
V2 is not just any type--it comes from the abstract syntax!
It happens that V2 is defined as VerbyThing, which is just {s : Str}.

But what happens under the hood for categories that are defined in the abstract syntax?
V2 is actually {s : Str ; lock_V2 : {}} , and N is {s:Str ; lock_N:{}}.
So, those two are not actually the same type anymore!
In our helperV2, calling `mkOneStringFromTwoAndPutThemInARecord str1 str2'
creates just a normal {s : Str}.
Wrapping that in `lin V2' creates a {s : Str ; lock_V2 : {}}.
This lock_Foo field is invisible and you as a programmer don't ever have to care about it.
-}
}