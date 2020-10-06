--# -path=.:../initial

-- Pretenglish ("Pretend English") concrete syntax
concrete FoodsSoftcorePre of FoodsSoftcore = FoodsEng ** {

  lin
    IsColor item qual = {s = "the color of" ++ item.s ++ "is" ++ qual.s} ;
    HasInside fd ingr = {s = fd.s ++ have ! fd.n ++ ingr.s ++ "inside"} ;
    HasOnTop fd ingr = {s = fd.s ++ have ! fd.n ++ ingr.s ++ "on top"} ;

}
