abstract FoodsHardcore = {
  flags startcat = Comment ;
  cat
    Comment ;
    Dish ; InsideDish ; OnTopDish ;
    Ingredient ;
    Quality ; ColorQuality ; OtherQuality ;
  fun

    IsColor : Dish -> ColorQuality -> Comment ;
    IsOther : Dish -> OtherQuality -> Comment ;
    HasInside : InsideDish -> Ingredient -> Comment ;
    HasOnTop : OnTopDish -> Ingredient -> Comment ;

    -- Coercion functions for Dish
    AnyDishI : InsideDish -> Dish ;
    AnyDishO : OnTopDish -> Dish ;

    Pizza : OnTopDish ;
    Lasagna, Risotto : InsideDish ;

    -- Coercion functions for Quality
    AnyQualityC : ColorQuality -> Quality ;
    AnyQualityO : OtherQuality -> Quality ;

    Mod : Quality -> Ingredient -> Ingredient ;

    Zucchini, PineSeeds, Mush : Ingredient ;
    Green : ColorQuality ;
    Vegan, Colorless, Indeterminate : OtherQuality ;
}
