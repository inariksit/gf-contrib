-- This is the original grammar

concrete FoodsOldSpa of FoodsOld = open Prelude,FoodsResSpa in {

  lincat
    Item = NP ;
    Kind = CN ;
    Quality = AP ;

  lin
    Pred item qual = {
      s = item.s ++ copula ! item.a ++ qual.s ! item.a ! Predic} ;

    -- : Kind -> Item
    This  = detFun "este"  "esta"  Sg ;
    That  = detFun "ese"   "esa"   Sg ;
    These = detFun "estos" "estas" Pl ;
    Those = detFun "esos"  "esas"  Pl ;

    -- : Quality -> Kind -> Kind
    Mod q k = k ** {
      s = \\n =>
         let adj = q.s ! {g=k.g; n=n} ! Attrib ;
             noun = k.s ! n
          in case q.isPre of {
               True  => adj ++ noun ;
               False => noun ++ adj }
      } ;

    -- : Kind
    Wine = cn "vino" Masc ;
    Cheese = cn "queso" Masc ;
    Fish = cn "pescado" Masc ;
    Pizza = cn "pizza" Fem ;

    -- : Quality -> Quality
    Very q = q ** {s = \\a,p => "muy" ++ q.s ! a ! p} ;

    -- : Quality
    Fresh = ap "fresco" False ;
    Delicious = ap "delicioso" False ;
    Italian = ap "italiano" False ;
    Vegan = ap "vegano" False ;
    Good = ap "bueno" True ;

}
