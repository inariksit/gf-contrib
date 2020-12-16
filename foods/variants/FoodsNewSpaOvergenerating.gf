concrete FoodsNewSpaOvergenerating of FoodsNew = FoodsNewSpaBase ** open Prelude, FoodsResSpa in {

  lin
    Pred kind qual =
      let det : Det = this_Det | that_Det | these_Det | those_Det ;
          np : NP = {s = det.s ! kind.g ++ kind.s ! det.n ;
                     a = agr kind.g det.n} ;
       in {s = np.s ++ copula ! np.a ++ qual.s ! np.a ! Predic} ;
}
