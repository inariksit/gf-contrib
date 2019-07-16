concrete RadiologyEng of Radiology =
  open Prelude, SyntaxEng, ParadigmsEng,
  LexiconEng, (G=GrammarEng), (E=ExtendEng), (R=ResEng) in {

  lincat
    Statement = S ;
    Description = {s : S ; adv : Adv} ;

    Organ,
    DualOrgan = OrganType ;

    Property = CN ;
    Descriptor = AP ;

  lin
    Pred org descn = mkS (topicAdv org) descn.s ; -- "the heart's size is normal"
    PredAdv org descn = mkS (mkCl (orgNP org) descn.adv) ;

    DescribePos descr prop proof = {
        s = mkS (lin Adv proof)
                (mkS (mkCl (mkNP prop) descr)) ;
        adv = SyntaxEng.mkAdv with_Prep (mkNP (mkCN descr prop)) } ;
    DescribeNeg descr prop proof = {
        s = mkS (lin Adv proof)
                (mkS negativePol (mkCl (mkNP prop) descr)) ;
        adv = SyntaxEng.mkAdv (mkPrep "not with") (mkNP (mkCN descr prop))} ;

    Desc2 d1 d2 = d1 ** {
      s = G.ConjS and_Conj (G.BaseS d1.s d2.s) ;
      adv = G.ConjAdv and_Conj (G.BaseAdv d1.adv d2.adv)} ;

    Desc3 d1 d2 d3 = {
      s = G.ConjS and_Conj (G.ConsS d3.s
                                    (G.BaseS d1.s d2.s)
                            ) ;
      adv = G.ConjAdv and_Conj (G.ConsAdv d3.adv (G.BaseAdv d2.adv d1.adv))} ;

    AggregateProperty2Pos dr p q pr1 pr2 = {
      s = aggregateProperty dr p q pr1 pr2 positivePol ;
      adv = SyntaxEng.mkAdv with_Prep (mkNP (mkCN dr (prop2 p q)))
      } ;

    AggregateProperty2Neg dr p q pr1 pr2 = {
      s = aggregateProperty dr p q pr1 pr2 negativePol ;
      adv = SyntaxEng.mkAdv (mkPrep "not with") (mkNP (mkCN dr (prop2 p q)))
      } ;

    Both org = org ** {s = mkCN (mkA "both") org.s} ;
    Left org = {s = mkCN (mkA "left") org.s ; pl = False} ;
    Right org = {s = mkCN (mkA "right") org.s ; pl = False} ;

    Heart = organ heart_N ;
    Spleen = organ (mkN "spleen") ;

    Kidney = dualorgan (mkN "kidney") ;
    Ovary = dualorgan (mkN "ovary") ;

    Size = mkCN (mkN "size") ;
    Location = mkCN (mkN "location") ;

    Lateral = mkAP (mkA "lateral") ;
    External = mkAP (mkA "external") ;

    Small = mkAP small_A ;
    Normal = mkAP (mkA "normal") ;
    Abnormal = mkAP (mkA "abnormal") ;
    Widened = mkAP (mkA "widened") ;
    Microscopic = mkAP (mkA "microscopic") ;

    mm int = mkAP (lin AdA int) mm_A ;
    mmLessThan int = mkAP (lin AdA (cc2 {s="<"} int)) mm_A ;

oper

  prop2 : CN -> CN -> CN = \p1,p2 ->
    G.ConjCN and_Conj (G.BaseCN p1 p2) ;

  mm_A : A = mkA "mm" "mm" "mm" "mm" ;

  OrganType : Type = {s : CN ; pl : Bool} ;

  organ : N -> OrganType = \n -> {
    s = mkCN n ; pl = False
    } ;
  dualorgan : N -> OrganType = \n ->
    organ n ** {pl = True} ;

  topicAdv : OrganType -> Adv = \org ->
    SyntaxEng.mkAdv noPrep (mkNP (mkDet (E.GenNP (orgNP org)))) ;

  orgNP : OrganType -> NP = \org ->
    case org.pl of {
      True => mkNP aPl_Det org.s ;
      False => mkNP org.s } ;

  aggregateProperty : Descriptor -> (p1, p2 : Property)
                      -> (pr1, pr2 : SS)
                      -> Pol
                      -> S ;
  aggregateProperty dr p q pr1 pr2 pol =
    mkS (lin Adv (cc2 pr1 pr2))
        (mkS pol (mkCl (plNP (prop2 p q)) dr)) ;

  plNP : CN -> NP = \cn ->
    let sgnp : NP = mkNP cn ;
        plnp : NP = mkNP aPl_Det cn ;
     in sgnp ** {a = plnp.a} ;

lin

-- proof objects
    Small_Size,
    Widened_Size,
    Microscopic_Size,
    Normal_Size,
    Abnormal_Size,
    Lateral_Location,
    External_Location,
    Normal_Location,
    Abnormal_Location,
    mm_Size,
    mm_lessThan_Size = ss "" ;

}
