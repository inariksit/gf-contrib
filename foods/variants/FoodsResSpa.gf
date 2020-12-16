resource FoodsResSpa = open Prelude, Predef in {

  param
    Number   = Sg | Pl ;
    Gender   = Masc | Fem ;
    Position = Attrib | Predic ;

  oper
    NP : Type = {s : Str ; a : Agr} ;
    CN : Type = {s : Number => Str ; g : Gender} ;
    AP : Type = {s : Agr => Position => Str ; isPre : Bool} ;
    Agr : Type = {g : Gender ; n : Number} ;

    agr : Gender -> Number -> Agr = \g,n -> {g=g ; n=n} ;

    -- Two ways of making NPs. They make a difference in how overgenerating variants are.

    -- 1) Create a type Det, combine it later with CN to form NP.
    Det : Type = {s : Gender => Str; n : Number} ;

    mkDet : Str -> Str -> Number -> Det = \m,f,n ->
      {s = table {Masc => m ; Fem => f} ; n = n} ;
    this_Det  : Det = mkDet "este"  "esta"  Sg ;
    that_Det  : Det = mkDet "ese"   "esa"   Sg ;
    these_Det : Det = mkDet "estos" "estas" Pl ;
    those_Det : Det = mkDet "esos"  "esas"  Pl ;

    -- 2) Create a function that takes CN directly and return a NP.
    detFun : Str -> Str -> Number -> CN -> NP = \ese,esa,num,kind ->
      let this = case kind.g of {Masc => ese ; Fem => esa} ;
      in {s = this ++ kind.s ! num ;
          a = {g = kind.g ; n = num} } ;

    thisFun  : CN -> NP = detFun "este" "esta"   Sg ;
    thatFun  : CN -> NP = detFun "ese"   "esa"   Sg ;
    theseFun : CN -> NP = detFun "estos" "estas" Pl ;
    thoseFun : CN -> NP = detFun "esos"  "esas"  Pl ;

    ap : Str -> Bool -> AP = \bueno,isPre ->
      let buen = tk 1 bueno in
      {s = \\a,p => case <a.g,a.n,p> of {
         <Masc,Sg,Attrib> => if_then_Str isPre buen bueno ;
         <Masc,Sg,Predic> => bueno ;
         <Masc,Pl> => bueno + "s" ;
         <Fem,Sg> => buen + "a" ;
         <Fem,Pl> => buen + "as"} ;
       isPre = isPre} ;

    cn : Str -> Gender -> CN = \pizza,fem ->
      {s = table {Sg => pizza ; Pl => pizza + "s"} ;
       g = fem} ;

    copula : Agr => Str = table {
      {n = Sg} => "es" ;
      {n = Pl} => "son" } ;

}
