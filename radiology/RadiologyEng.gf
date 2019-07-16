concrete RadiologyEng of Radiology =
  open Prelude, SyntaxEng, ParadigmsEng,
  LexiconEng, (G=GrammarEng), (E=ExtendEng) in {

  lincat
    Statement,
    Description = S ;
    Descriptions = [S] ;

    Organ = NP ;

    Property = NP ;
    Descriptor = AP ;

  lin
    Pred org desc = mkS (SyntaxEng.mkAdv noPrep (mkNP (mkDet (E.GenNP org)))) desc ; -- "the heart's color is black"
    Describe prop desc = mkS (mkCl prop desc) ;

    BaseDescription = G.BaseS ;
    ConsDescription = G.ConsS ;
    ConjDescription = G.ConjS and_Conj ;

    Heart = mkNP heart_N ;
    Spleen = mkNP (mkN "spleen") ;

    Size = mkNP (mkN "size") ;
    Color = mkNP (mkN "color") ;

    Black = mkAP black_A ;
    Green = mkAP green_A ;

    Small = mkAP small_A ;
    Normal = mkAP (mkA "normal") ;
    Widened = mkAP (mkA "widened") ;
    Microscopic = mkAP (mkA "microscopic") ;

    mm int = mkAP <int : AdA> mm_A ;
    mmLessThan int = mkAP <cc2 {s="<"} int : AdA> mm_A ;

oper
   mm_A : A = mkA "mm" "mm" "mm" "mm" ;
}
