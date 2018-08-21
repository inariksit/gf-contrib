concrete MiniGrammarSom of MiniGrammar = open MiniResSom, Prelude in {


  lincat
    Utt = {s : Str} ;
    -- Adv = Adverb ;
    -- Pol = {s : Str ; b : Bool} ;
    
    -- S  = {s : Str} ;
    -- Cl = {s : Bool => Str} ;
    -- VP = {verb : GVerb ; compl : Str} ;
    AP = Adjective ;
    CN = Noun ** { adj : NForm => Str } ;
    NP = {s : Str ; a : Agreement} ;
    -- Pron = {s : Case => Str ; a : Agreement} ;
    Det = {s : Str ; sp : Gender => Str ; n : Number ; d : Defi} ;
    -- Conj = {s : Str} ;
    -- Prep = {s : Str} ;
    -- V = Verb ;
    -- V2 = Verb2 ;
    A = Adjective ;
    N = Noun ;
    -- PN = ProperName ;

  lin
--    UttS s = s ;
    UttNP np = np ;
{-
    UsePresCl pol cl = {
      s = pol.s ++ cl.s ! pol.b
      } ;
    PredVP np vp = {
      s = \\b =>
           np.s ! Nom 
	++ case <b, np.a, vp.verb.isAux> of {
	    <True, Agr Sg Per1,_> => vp.verb.s ! PresSg1 ;
	    <True, Agr Sg Per3,_> => vp.verb.s ! VF PresSg3 ;
	    <True, _          ,_> => vp.verb.s ! PresPl ;
	    <False, Agr Sg Per1,True>  => vp.verb.s ! PresSg1 ++ "not" ;
	    <False, Agr Sg Per3,True>  => vp.verb.s ! VF PresSg3 ++ "not" ;
	    <False, _          ,True>  => vp.verb.s ! PresPl ++ "not" ;
	    <False, Agr Sg Per3,False> => "does not" ++ vp.verb.s ! VF Inf ;
	    <False, _          ,False> => "do not" ++ vp.verb.s ! VF Inf
	    }
        ++ vp.compl ;
      } ;
      
    UseV v = {
      verb = verb2gverb v ;
      compl = []
      } ;
    ComplV2 v2 np = {
      verb = verb2gverb v2 ;
      compl = v2.c ++ np.s ! Acc
      } ;
    UseAP ap = {
      verb = be_GVerb ;
      compl = ap.s
      } ;
    AdvVP vp adv =
      vp ** {compl = vp.compl ++ adv.s} ;
      -}
    DetCN det cn = let nf = NF det.n det.d in {
      s = (cn.s ! nf) ++ det.s ++ cn.adj ! nf ;
      a = getAgr det.n cn.g
      } ;
    -- UsePN pn = {
    --   s = \\_ => pn.s ;
    --   a = Agr Sg Per3
    --   } ;
    -- UsePron p =
    --   p ;
    MassNP cn = {
      s = cn.s ! NF Sg Indef ++ cn.adj ! NF Sg Indef ;
      a = Sg3 cn.g 
      } ;
    a_Det = {s = "" ; sp = \\_ => "TODO:a_Det" ; n = Sg ; d = Indef} ;
    aPl_Det = a_Det ** { n = Pl } ;
    
    -- This is actually this/these; just to test stuff
    the_Det = { s = BIND ++ "n" ; -- To be glued onto the definite form of noun
               sp = table { Fem => "tan" ; Masc => "kan" } ; -- tani, kani for DetNP
                n = Sg ; d = Def } ;
    thePl_Det = { s = "" ; sp = \\_ => "kuwan" ; n = Pl ; d = Def } ;
    UseN n = n ** { adj = \\_ => [] } ;

-- Bestämdhetskongruens
-- När ett substantiv binds som attribut till ett annat substantiv med hjälp av den attributiva kortformen ah som är av kopulaverbet yahay är, då måste båda substantiven vara antingen obestämda eller bestämda. Man kan alltså säga att de kongruerar med avseende på bestämdhet, t.ex.
    AdjCN ap cn = cn ** {
      s = cn.s ;
      adj = table {NF n Def => glue (ap.s ! n) "ga:(correct allomorph)" ; --TODO right allomorph
                   Poss a   => ap.s ! getNum a ;
                   x        => ap.s ! Sg}
      } ;

    PositA a = a ;

{-    PrepNP prep np = {s = prep.s ++ np.s ! Acc} ;

    CoordS conj a b = {s = a.s ++ conj.s ++ b.s} ;
    
    PPos  = {s = [] ; b = True} ;
    PNeg  = {s = [] ; b = False} ;

    and_Conj = {s = "and"} ;
    or_Conj = {s = "or"} ;

    every_Det = {s = "every" ; n = Sg} ;

    in_Prep = {s = "in"} ;
    on_Prep = {s = "on"} ;
    with_Prep = {s = "with"} ;

    i_Pron = {
      s = table {Nom => "I" ; Acc => "me"} ;
      a = Agr Sg Per1
      } ;
    youSg_Pron = {
      s = \\_ => "you" ;
      a = Agr Sg Per2
      } ;
    he_Pron = {
      s = table {Nom => "he" ; Acc => "him"} ;
      a = Agr Sg Per3
      } ;
    she_Pron = {
      s = table {Nom => "she" ; Acc => "her"} ;
      a = Agr Sg Per3
      } ;
    we_Pron = {
      s = table {Nom => "we" ; Acc => "us"} ;
      a = Agr Pl Per1
      } ;
    youPl_Pron = {
      s = \\_ => "you" ;
      a = Agr Pl Per2
      } ;
    they_Pron = {
      s = table {Nom => "they" ; Acc => "them"} ;
      a = Agr Pl Per2
      } ;
-}
}
