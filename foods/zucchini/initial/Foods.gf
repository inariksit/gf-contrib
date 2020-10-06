abstract Foods = {
  flags startcat = Comment ;
  cat
    Comment ; Item ; Kind ; Quality ;
  fun
    Is : Item -> Quality -> Comment ; -- Your pizza is vegan
    Has : Item -> Item -> Comment ;   -- Your pizza has pine seeds

    Your : Kind -> Item ;             -- your pizza
    Mass : Kind -> Item ;             -- zucchini
    Plural : Kind -> Item ;           -- pine seeds
    ConjItem :
      Item -> Item -> Item ;          -- zucchini and pine seeds
    Mod : Quality -> Kind -> Kind ;   -- vegan pizza
    Pizza, Lasagna, Risotto : Kind ;
    PineSeed, Mush, Zucchini : Kind ;
    Colorless, Green,
      Indeterminate, Vegan : Quality ;
}
