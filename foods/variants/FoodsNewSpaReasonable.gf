concrete FoodsNewSpaReasonable of FoodsNew = FoodsNewSpaBase ** open Prelude, FoodsResSpa in {

  lin
    -- Almost like FoodsNewSpaOvergenerating, but this|that|these|those isn't inlined
    Pred kind qual =
      let addDet : Det -> SS = \d ->
            let np : NP = {s = d.s ! kind.g ++ kind.s ! d.n ;
                           a = agr kind.g d.n} ;
             in {s = np.s ++ copula ! np.a ++ qual.s ! np.a ! Predic} ;
      in addDet this_Det
       | addDet that_Det
       | addDet these_Det
       | addDet those_Det ;
}
