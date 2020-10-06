concrete FoodsEng of Foods = {

  lincat
    Kind = LinKind ;
    Item = LinItem ;
  lin
    -- : Item -> Quality -> Comment ;
    Is item quality = {s = item.s ++ copula ! item.n ++ quality.s} ;

    -- : Item -> Item -> Comment ;
    Has food ingrds = {s = food.s ++ have ! food.n ++ ingrds.s} ;

    -- : Kind -> Item ;
    Your kind = {s = "your" ++ kind.s ! Sg ; n = Sg} ;
    Mass kind = {s = kind.s ! Sg ; n = Sg} ;
    Plural kind = {s = kind.s ! Pl ; n = Pl} ;

    -- : Item -> Item -> Item ;
    ConjItem item1 item2 = {s = item1.s ++ "and" ++ item2.s ; n = Pl} ;

    -- : Quality -> Kind -> Kind ;
    Mod quality kind = {s = \\n => quality.s ++ kind.s ! n} ;

    -- : Kind
    Pizza = mkKind "pizza" ;
    Lasagna = mkKind "lasagna" ;
    Risotto = mkKind "risotto" ;
    PineSeed = mkKind "pine seed" ;
    Mush = mkKind "mush" ;
    Zucchini = mkKind "zucchini" ;

    -- : Quality
    Colorless = mkQuality "colorless" ;
    Green = mkQuality "green" ;
    Indeterminate = mkQuality "indeterminate" ;
    Vegan = mkQuality "vegan" ;

  param
    Number = Sg | Pl ;
  oper
    LinItem : Type = {s : Str ; n : Number} ;
    LinKind : Type = {s : Number => Str} ;

    mkKind : Str -> LinKind = \mush ->
      let mushes : Str = case mush of {
            _ + ("s"|"sh"|"ch") => mush + "es" ;
            _                   => mush + "s"
            } ;
      in {s = table {Sg => mush ; Pl => mushes}} ;

    mkQuality : Str -> {s : Str} = \green -> {s = green} ;

    Verb : Type = Number => Str ;
    mkVerb : (sg, pl : Str) -> Verb = \sg,pl -> table {Sg => sg ; Pl => pl} ;

    copula : Verb = mkVerb "is" "are" ;
    have : Verb = mkVerb "has" "have" ;
}
