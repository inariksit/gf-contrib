concrete RadiologyEng of Radiology =
  open Prelude, SyntaxEng, ParadigmsEng,
  LexiconEng, (G=GrammarEng), (E=ExtendEng), (R=ResEng) in {

  lincat
    Statement = S ;
    Description = {s : R.CPolarity => S} ;
    Descriptions2,
    Descriptions3 = {s : R.CPolarity => [S]} ;

    Organ,
    DualOrgan = OrganType ;

    Property = NP ;
    Descriptor = AP ;

  lin
    Pred org descn = mkS (topicAdv org) (descn.s ! positivePol.p) ; -- "the heart's size is normal"
    PredNeg org descn = mkS (topicAdv org) (descn.s ! negativePol.p) ;
    Describe descr prop _ = {s = \\p => mkS (pol p) (mkCl prop descr)} ;

    Desc2 d1 d2 = {s = \\p => G.BaseS (d1.s ! p) (d2.s ! p)} ;
--    Desc3 d1 d2 d3 = {s = \\p => G.ConsS (d3.s ! p) (Desc2 d2 d1)} ;
    Desc2as3 d = d ;
    ConjDesc2 descs = {s = \\p => G.ConjS and_Conj (descs.s ! p)} ;
--    ConjDesc3 =

    AggregateProperty2 dr p q _ _ = {s = \\pl => mkS (pol pl) (mkCl (prop2 p q) dr)} ;

    Both org = org ** {s = mkCN (mkA "both") org.s} ;
    Left org = {s = mkCN (mkA "left") org.s ; pl = False} ;
    Right org = {s = mkCN (mkA "right") org.s ; pl = False} ;

    Heart = organ heart_N ;
    Spleen = organ (mkN "spleen") ;

    Kidney = dualorgan (mkN "kidney") ;
    Ovary = dualorgan (mkN "ovary") ;

    Size = mkNP (mkN "size") ;
    Location = mkNP (mkN "location") ;

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

  prop2 : NP -> NP -> NP = \p1,p2 ->
    G.ConjNP and_Conj (G.BaseNP p1 p2) ;

  mm_A : A = mkA "mm" "mm" "mm" "mm" ;

  OrganType : Type = {s : CN ; pl : Bool} ;

  organ : N -> OrganType = \n -> {
    s = mkCN n ; pl = False
    } ;
  dualorgan : N -> OrganType = \n ->
    organ n ** {pl = True} ;

  topicAdv : OrganType -> Adv = \org ->
    SyntaxEng.mkAdv noPrep (mkNP (mkDet (E.GenNP (orgNP org))))
    where {
     orgNP : OrganType -> NP = \org ->
        case org.pl of {
          True => mkNP aPl_Det org.s ;
          False => mkNP org.s }
      } ;

  pol : R.CPolarity -> Pol = \p -> case p of {
    R.CPos => positivePol ;
    R.CNeg _ => negativePol
  } ;
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
    -- Normal_Size_Location,
    -- Abnormal_Size_Location,
    mm_Size,
    mm_lessThan_Size = ss "proof object" ;

}
