concrete FoodsNewSpaBase of FoodsNew = open Prelude, FoodsResSpa in {

  lincat
    Item = NP ;
    Kind = CN ;
    Quality = AP ;

  lin
    Mod q k = k ** {
      s = \\n =>
         let adj = q.s ! {g=k.g; n=n} ! Attrib ;
             noun = k.s ! n
          in case q.isPre of {
               True  => adj ++ noun ;
               False => noun ++ adj }
      } ;
    Wine = cn "vino" Masc ;
    Cheese = cn "queso" Masc ;
    Fish = cn "pescado" Masc ;
    Pizza = cn "pizza" Fem ;
    Very q = q ** {s = \\a,p => "muy" ++ q.s ! a ! p} ;
    Fresh = ap "fresco" False ;
    Delicious = ap "delicioso" False ;
    Italian = ap "italiano" False ;
    Vegan = ap "vegano" False ;
    Good = ap "bueno" True ;
}
