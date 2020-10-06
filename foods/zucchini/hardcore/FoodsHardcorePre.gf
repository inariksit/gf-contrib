-- The Pretenglish ("Pretend English") concrete syntax
concrete FoodsHardcorePre of FoodsHardcore = {

  lin

    IsColor d c = {s = "the color of" ++ d.s ++ "is" ++ c.s} ;
    IsOther d o = {s = d.s ++ "is" ++ o.s} ;
    HasInside d i = {s = d.s ++ "has" ++ i.s ++ "inside"} ;
    HasOnTop d i = {s = d.s ++ "has" ++ i.s ++ "on top"} ;

    -- Coercion functions for Dish
    AnyDishI i = i ;
    AnyDishO o = o ;

    Pizza = ss "your pizza" ;
    Lasagna = ss "your lasagna" ;
    Risotto = ss "your risotto" ;

    -- Coercion functions for Quality
    AnyQualityC c = c ;
    AnyQualityO o = o ;

    Mod q i = {s = q.s ++ i.s} ;

    Zucchini = ss "zucchini" ;
    PineSeeds = ss "pine seeds" ;
    Mush = ss "mush" ;

    Green = ss "green" ;
    Vegan = ss "vegan" ;
    Colorless = ss "colorless" ;
    Indeterminate = ss "indeterminate" ;

  oper
    ss : Str -> {s : Str} = \s -> {s = s} ;
}
