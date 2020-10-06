--# -path=.:../initial
-- Pretenglish ("Pretend English") concrete syntax
concrete FoodsPre of Foods = {
 lincat
    Kind = LinKind ;
    Item = LinItem ;
    Quality = LinQuality ;
  lin
    -- : Item -> Quality -> Comment ;
    Is item quality =
      let theColorOf : Str = case quality.q of {
            Color => "the color of" ;
            Other => [] } ;
          is : Str = case quality.q of {
            Color => "is" ; -- the color of pine seeds *is* green
            Other => copula ! item.n
            } ;
       in {s = theColorOf ++ item.s ++ is ++ quality.s} ;

    -- : Item -> Item -> Comment ;
    Has food ingrds =
      let place : Str = case food.d of {
            Inside => "inside" ;
            OnTop  => "on top" ;
            NotADish => [] }
       in {s = food.s ++ have ! food.n ++ ingrds.s ++ place} ;

    -- : Kind -> Item ;
    Your kind = {s = "your" ++ kind.s ! Sg ; n = Sg ; d = kind.d} ;
    Mass kind = {s = kind.s ! Sg ; n = Sg ; d = kind.d} ;
    Plural kind = {s = kind.s ! Pl ; n = Pl ; d = kind.d} ;

    -- : Item -> Item -> Item ;
    ConjItem item1 item2 = item1 ** {s = item1.s ++ "and" ++ item2.s ; n = Pl} ;

    -- : Quality -> Kind -> Kind ;
    Mod quality kind = kind ** {s = \\n => quality.s ++ kind.s ! n} ;

    -- : Kind
    Pizza = mkKind "pizza" OnTop ;
    Lasagna = mkKind "lasagna" Inside ;
    Risotto = mkKind "risotto" Inside ;
    PineSeed = mkKind "pine seed" ;
    Mush = mkKind "mush" ;
    Zucchini = mkKind "zucchini" ;

    -- : Quality
    Colorless = mkQuality "colorless" ;
    Green = mkQuality "green" Color ;
    Indeterminate = mkQuality "indeterminate" ;
    Vegan = mkQuality "vegan" ;

  param
    Number = Sg | Pl ;
    DishType = Inside | OnTop | NotADish ;
    QualType = Color | Other ;

  oper
    LinItem : Type = {s : Str ; n : Number ; d : DishType} ;
    LinKind : Type = {s : Number => Str ; d : DishType} ;
    LinQuality : Type = {s : Str ; q : QualType} ;

    mkKind = overload {
      mkKind : Str -> DishType -> LinKind = \s,d -> mkN s ** {d = d} ;
      mkKind : Str -> LinKind = \s -> mkN s ** {d = NotADish}
      } ;

    -- Morphological paradigm
    mkN : Str -> {s : Number => Str} = \mush ->
      let mushes : Str = case mush of {
            _ + ("s"|"sh"|"ch") => mush + "es" ;
            _                   => mush + "s"
            } ;
      in {s = table {Sg => mush ; Pl => mushes}} ;

    mkQuality = overload {
      mkQuality : Str -> QualType -> LinQuality = \s,q -> {s = s ; q = q} ;
      mkQuality : Str -> LinQuality = \s -> {s = s ; q = Other}
      } ;

    -- Unchanged from FoodsEng
    Verb : Type = Number => Str ;
    mkVerb : (sg, pl : Str) -> Verb = \sg,pl -> table {Sg => sg ; Pl => pl} ;

    copula : Verb = mkVerb "is" "are" ;
    have : Verb = mkVerb "has" "have" ;
}
