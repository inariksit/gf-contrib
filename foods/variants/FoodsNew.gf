-- (c) 2009 Aarne Ranta under LGPL

abstract FoodsNew = {
  flags startcat = Comment ;
  cat
    Comment ; Item ; Kind ; Quality ;
  fun
    Pred : Kind -> Quality -> Comment ;
 --  No funs of type  Kind -> Item. Dets will be variants in Pred.
    Mod : Quality -> Kind -> Kind ;
    Wine, Cheese, Fish, Pizza : Kind ;
    Very : Quality -> Quality ;
    Fresh, Good, Italian, Delicious, Vegan : Quality ;
}
