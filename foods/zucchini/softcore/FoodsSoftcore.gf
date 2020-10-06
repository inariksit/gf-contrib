--# -path=.:../initial

abstract FoodsSoftcore = Foods ** {
  flags startcat=Comment ;
  fun
    IsColor : Item -> Quality -> Comment ;
    HasInside,
      HasOnTop : Item -> Item -> Comment ;
}
