
concrete FoodsSpa of Foods = open SyntaxSpa, StructuralSpa, ParadigmsSpa in {

  lincat
    Comment = Utt ;
    Item = NP ;
    Kind = CN ;
    Quality = AP ;

  lin
    Pred item quality = mkUtt (mkCl item quality) ;
    This kind = mkNP this_QuantSg kind ;
    That kind = mkNP that_QuantSg kind ;
    These kind = mkNP these_QuantPl kind ;
    Those kind = mkNP those_QuantPl kind ;
    Mod quality kind = mkCN quality kind ;
    Very quality = mkAP very_AdA quality ;
    Wine = mkCN (mkN "vino") ;
    Pizza = mkCN (mkN "pizza") ;
    Cheese = mkCN (mkN "queso") ;
    Fish = mkCN (mkN "pescado") ;
    Fresh = mkAP (mkA "fresco") ;
    Warm = mkAP (mkA "caliente") ;
    Italian = mkAP (mkA "italiano") ;
    Expensive = mkAP (mkA "caro") ;
    Delicious = mkAP (mkA "delicioso") ;
    Boring = mkAP (mkA "aburrido") ;

oper
-- Used in the post https://inariksit.github.io/gf/2018/08/28/gf-gotchas.html#re-export-rgl-opers-in-application-grammar

    -- First try: export ParadigmsSpa and SyntaxSpa opers, use like this:
    -- $ gf
    -- > i -retain FoodsSpa.gf
    -- > cc -one Pred (These (mkCN (mkN "tortilla"))) Delicious
    -- will output "estas tortillas son deliciosas"
    mkN : Str -> N = ParadigmsSpa.mkN ;
    mkCN : N -> CN = SyntaxSpa.mkCN ;

    -- The opers can be called anything. Use like this:
    -- cc -one Pred (These (kind "tortilla")) (qual "vegano")
    -- will output "estas tortillas son veganas"
    kind : Str -> CN = \s -> mkCN (mkN s) ;
    qual : Str -> AP = \s -> mkAP (mkA s) ;
}
