resource ResPidg = {

{- Low-level opers.

-}

  oper

-- Sentences, Clauses,
    PhraseyThing : Type = {s : Str} ;
  
    Tense : Type = {s : Str} ;

-- Verbs and verby things
    VerbyThing : Type = {s : Str} ;

    mkVerbyThing : Str -> VerbyThing ;
    mkVerbyThing str = {s = str} ;

-- Nouns and nouny things.
    NounyThing  : Type = {s : Str} ;

    mkNounyThing : Str -> NounyThing ;
    mkNounyThing str = {s = str} ;


-- Determiners
    --Type
    Determiner : Type = {s : Str} ;

    -- Low-level function to make a determiner
    mkDeterminer : Str -> Determiner ;
    mkDeterminer str = {s = str} ;

}