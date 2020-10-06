--# -path=.:../initial

concrete FoodsSoftcoreEng of FoodsSoftcore = FoodsEng ** {

  lin
    IsColor             = Is ;
    HasInside, HasOnTop = Has ;
}
