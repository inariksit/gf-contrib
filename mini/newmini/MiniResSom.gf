resource MiniResSom = open Prelude, Predef in {


--------------------------------------------------------------------------------
-- Nominal morphology

param
  Number = Sg | Pl ;
  Case = Nom | Abs ;
  Gender = Masc | Fem ;
  Person = Per1 | Per2 | Per3 ;

  Inclusion = Excl | Incl ;
  Agreement = Sg1 | Sg2 | Sg3 Gender | Pl1 Inclusion | Pl2 | Pl3 ;



--TODO: more cases (or contracted prepositions)?, determinative (not in mini resource), …
-- Determinativt kii / tii
-- Substantivens determinativa form bildas genom att den bestämda grundformens –a eller subjektsformens –u ersätts med ändelsen –ii som anger att föremålet utgör en gemensam bekant bakgrundsinformation.
-- Den determinativa formen kan även ersätta slutvokalen i de possessiva ändelserna.
  -- Den determinativa ändelsen –kii/–tii används när man vill framhålla att ett bestämt föremål inte bara är allmänt bestämt utan dessutom förväntas vara känt sedan tidigare för den som man talar med.
  -- Det somaliska determinativa morfemet kii/tii har möjligen en något bredare användning, eftersom det markerat att talaren anser att lyssnare borde känna till det som substantivet refererar till.
  -- mundul·kii·sii   -- kii is the morpheme, what is sii?

  NForm = Indef Number -- The base form
        | Def   Number -- With definite article
        | Poss Agreement  -- Added possessive suffix. Mostly based on Def form, but some nouns
                          --  (kinship etc.) use short forms, which are distinct.
        | Numerative ; -- When modified by a number (only distinct for some feminine nouns)


oper
  getAgr : NForm -> Gender -> Agreement = \n,g ->
    case n of { Indef Pl|Def Pl => Pl3 ;
                _               => Sg3 g } ;
  getNum : Agreement -> Number = \a ->
    case a of { Sg1|Sg2|Sg3 _ => Sg ; _ => Pl } ;

  --TODO: can probably make this leaner and have just stems in NForm, if case is regular?
  -- -u for nouns and pronouns, -i for demonstratives -- how about adding the ending in DetCN/MassNP, UsePron and DetCN with &+, and no case in the tables? Wait to see which other forms are needed.
  Noun : Type = {s : NForm => Case => Str ; g : Gender} ;

  CNoun : Type = Noun ** { mod : NForm => Case => Str } ;

  --TODO: figure out some nice minimum number of stems
  mkNoun : (x1,_,_,x4 : Str) -> Gender -> Noun = \a,b,c,d,gender ->
    { s = table { Indef Sg|Numerative => case gender of { Fem => table { Nom => a + "i" ; _ => a } ; Masc => \\_ => a } ;
                  Indef Pl => \\_ => c ;
                  Def   Sg => addCase b [] ;
                  Def   Pl => addCase d [] ;
                  Poss Sg1 => addCase b (case gender of { Fem => "ayd" ; Masc => "ayg" }) ;
                  Poss Sg2 => addCase b (case gender of { Fem => "aad" ; Masc => "aag" }) ;
                  Poss Pl2 => addCase b "iinn" ;
                  Poss Pl3 => addCase b "ood" ;
                  Poss (Sg3 Fem) => addCase b "iis" ;
                  Poss (Sg3 Masc)=> addCase b "eed" ;
                  Poss _ => addCase b ":TODO:Pl1-poss" } ; --check page 40
      g = gender } ;

  addCase : Str -> Str -> Case=>Str = \ilkaha,iis ->
    let dupl : Str -> {p1 : Str ; p2 : Str} = \x -> <x,x> ;
        stems : {p1 : Str ; p2 : Str} = case <ilkaha,iis> of {
                        <ilk + "aha", "i" + is> => dupl (ilk + "ih" + iis) ;
                        <ilk + "aha", ""      > => <ilk + "uh", init ilkaha> ;
                        <magac + "a", ood     > => dupl (magac + ood) ;
                        _                       => dupl (ilkaha+"-"+iis) } ;
     in table { Nom => stems.p1 + "u" ; Abs => stems.p2 + "a" } ;

-------------------------
-- Regular noun paradigms
  nHooyo, nAabbe, nMas, nUl, nGuri, nXayawaan : Str -> Noun ;

  --1) Feminine nouns that end in -o
  nHooyo hooyo =
    mkNoun hooyo (init hooyo + "ada") (hooyo + "oyin") (hooyo + "oyinka") Fem ;

  --2) Masculine nouns that end in -e
  nAabbe aabbe = let aabb = init aabbe in
    mkNoun aabbe (aabb + "aha") (aabb + "ayaal") (aabb + "ayaasha") Masc ;

  -- 3) Masculine, plural with duplication
  nMas mas = let s = last mas in
    mkNoun mas (mas + "ka") (mas + "a" + s) (mas + "a" + s + "ka") Masc ;

  -- 4a) Feminine, plural with ó
  nUl ul = let o  = case last ul of { "i" => "yo" ; _ => "o" } ;
               u  = case last ul of { "l" => init ul ; _ => ul } ;
               sha = allomorph Ta ul ;
               ulood = ul + o + "od" ;
               n = mkNoun ul (u + sha) (ul + o) (ul + "aha") Fem in
    n ** { s = table { Numerative => \\_ => ulood ; x => n.s ! x } } ;

  -- 4b) Masculine, plural with ó, 2 syllables
  nGuri guri = let o = allomorph O guri ;
                   ga = allomorph Ka guri ;
                   gury = case last guri of { -- TODO does this generalise? Or just exception?
                                 "i" => init guri + "y" ;
                                 _   => guri } in
    mkNoun guri (guri + ga) (gury + o) (gury + "aha") Masc ;

  -- 4c) Masculine, plural with -ó, 3 syllables or longer
  nXayawaan x = let ka = allomorph Ka x ;
                    o = allomorph O x ;
                    xo = x + o in
    mkNoun x (x + ka) xo (init xo + "ada") Masc ;


  allomorph : Morpheme -> Str -> Str = \x,stem ->
    case x of {
      O => case last stem of {
                  d@("b"|"d"|"r"|"l"|"m"|"n") => d + "o" ;
                  "c"|"g"|"i"                 => "yo" ; --TODO other sounds?
                  _                           => "o" } ;

      -- Based on the table on page 21--TODO find generalisations in patterns
      Ta => case last stem of {
                   "d"|"c"|"h"|"x"|"q"|"'"|"i"|"y"|"w" => "da" ;
                   "l" => "sha" ;
                   _   => "ta" } ;

      Ka => case stem of {
                   _ + ("g"|"aa"|"i"|"y"|"w") => "ga" ;
                   _ + ("c"|"h"|"x"|"q"|"'")  => "a" ;
                   _ + ("e"|"o")              => "ha" ;
                   _                          => "ka" }
    } ;

  voiced : Str -> Str = \s -> case s of {
    "k" => "g" ;
    "t" => "d" ;
    "p" => "b" ;
     _  => s } ;

  -- don't remember what this was supposed to be
  -- caseForm : (NForm => Str) -> NForm -> Str -> Str = \s,nf,u -> case nf of {
  --   Numerative|Indef _ => s ! nf ;
  --   _                  => glue (s ! nf) u } ;

param
  Morpheme = O | Ka | Ta ;

oper

   --TODO: make patterns actually adjusted to Somali, these are just copied from elsewhere
   v : pattern Str = #("a" | "e" | "i" | "o" | "u") ;
   vv : pattern Str = #("aa" | "ee" | "ii" | "oo" | "uu") ;
   c : pattern Str = #("m" | "n" | "p" | "b" | "t" | "d" | "k" | "g" | "f" | "v" | "s" | "h" | "l" | "j" | "r" | "z" | "c" | "q" | "y") ;
   lmnr : pattern Str = #("l" | "m" | "n" | "r") ;
   kpt : pattern Str = #("k" | "p" | "t") ;
   gbd : pattern Str = #("g" | "b" | "d") ;


  -- Smart paradigm
  --Substantiv som slutar på –o/–ad är så gott som alltid feminina, t.ex. qaáddo sked, bisád katt.
  --Substantiv som slutar på –e är så gott som alltid maskulina, t.ex. dúbbe hammare, fúre nyckel.
  -- För övriga ord säger ordets form dessvärre väldigt lite om ordets genus. Däremot kan betoningens plats i ordet väldigt ofta avslöja ordets genus. Man kan alltså i flesta fall höra vilket genus ett substantiv har.


  mkN = overload {

   mkN : Str -> Noun = mkN1 ;
   mkN : Str -> Gender -> Noun = \n,g ->
     mkN1 n ** { g = g }
  } ;

  mkN1 : Str -> Noun = \n -> case n of {
      _ + "ad" => nUl n ;
      _ + "e" => nAabbe n ;
      _ + "o" => nHooyo n ;
      _ + "r" => nGuri n ;
      #c + #v + #c | #c + #v + #v + #c | #v + #c  => nMas n ;
      _ => nXayawaan n } ;

  BaseNP : Type = {
    a : Agreement ;
    isPron : Bool ;
    stm : Bool => Str ;
    sp : Str } ;

  NP : Type = BaseNP ** { s : Case => Str } ;
  useN : Noun -> CNoun ** BaseNP = \n -> n **
    { mod = \\_,_ => [] ; a = Sg3 n.g ; stm = stmarker (Sg3 n.g) ;
      isPron = False ; sp = []} ;
--------------------------------------------------------------------------------
-- Pronouns, prepositions

-- Prepositionen u dras obligatoriskt samman med föregående pronomen
-- så att /a/ + /u/ > /oo/.

-- Negationen má `inte' skrivs samman med en föregående preposition.
--------------------------------------------------------------------------------
-- Adjectives

param
  AForm = AIndef Number | ADef Number Case ; ---- TODO: past tense

oper

 -- Komparativ
 -- För att uttrycka motsvarigheten till svenskans komparativ placerar man på somaliska helt enkelt prepositionen ká 'från, av, än' framför adjektivet i fråga. Adjektivet får ingen ändelse.
 -- Shan waa ay ká yar tahay siddéed. Fem är mindre än åtta.
 -- Superlativ
 -- Motsvarigheten till svenskans superlativ bildas med prepositionsklustret ugú som till sin betydelse närmast motsvarar svenskans allra, t.ex.
 -- ugu horrayntii (det att komma) allra först

  Adjective : Type = { s : AForm => Str } ;

  mkA : Str -> Adjective = \yar ->
    let ga = allomorph Ka yar ;
        gu = init ga + "u" ;
        yaryar = duplicate yar
    in { s = table {
           AIndef Sg => yar ;
           AIndef Pl => yaryar ;
           ADef Sg Abs => yar + ga ;
           ADef Pl Abs => yaryar + ga ;
           ADef Sg Nom => yar + gu ;
           ADef Pl Nom => yaryar + gu }
       } ;

  duplicate : Str -> Str = \yar -> case yar of {
    "dheer" => "dhaadheer" ;
    "weyn"  => "waaweyn" ; -- TODO eventually handle irregular adjectives elsewhere
    y@#c + a@#v + r@#c + _ => y + a + r + yar ;
    g@#c + aa@#vv      + _ => g + aa + yar ; --TODO: proper patterns
    _                      => yar + ":plural" } ;

--------------------------------------------------------------------------------
-- Verb

param
   VForm =
     VInf
   | VPres Agreement Bool
   | VNegPast
   | VPast Agreement
   | VFut -- agreement comes from auxiliary
   | VRel -- "som är/har/…" TODO is this used in other verbs?
   | VImp Number ; -- TODO negation

-- TODO:
-- tre aspekter (enkel, progressiv, habituell),
-- fem modus (indikativ, imperativ, konjunktiv, kontiditonalis, optativ)

oper


  Verb : Type = { s : VForm => Str } ;

  Verb2 : Type = Verb ** { c2 : Str } ;

  mkVerb : (x1,x2 : Str) -> Verb = \ark,qaat ->
    let stems : {p1 : Str ; p2 : Str} = case ark of {
          a + r@#c + k@#c => <ark + "i", a + r + a + voiced k> ;
          yar + "ee"      => <ark + "n", yar + "ey"> ;
          _               => <ark + "n", ark> } ;
        arki = stems.p1 ;
        arag = stems.p2 ;
        arkin = case last arki of { "n" => arki ; _ => arki + "n" } ;
        t : Str = case arag of {
               _ + ("i"|"y") => "s" ;
               _             => "t" } ;
        ay : Str = case ark of {
               _ + ("i"|"e") => "ey" ;
               _             => "ay" } ;
        n : Str = case arag of {
               _ + #v => "nn" ;
               _      => "n" } ;
   in { s = table {
          VPres (Sg1|Sg3 Masc) pol
                        => qaat + if_then_Str pol "aa" "o" ;
          VPres (Sg2|Sg3 Fem) pol
                        => arag + t + if_then_Str pol "aa" "o" ;
          VPres (Pl1 _) pol
                        => arag + n + if_then_Str pol "aa" "o"  ;
          VPres Pl2 pol => arag + t + "aan" ;
          VPres Pl3 pol => qaat + "aan" ;

          VPast (Sg1|Sg3 Masc)
                        => qaat + ay ;
          VPast (Sg2|Sg3 Fem)
                        => arag + t + ay ;
          VPast (Pl1 _) => arag + n + ay ;
          VPast Pl2     => arag + t + "een" ; -- kari+seen, (sug|joogsa|qaada)+teen
          VPast Pl3     => qaat + "een" ;

          VImp Sg          => arag ;
          VImp Pl          => qaat + "a" ; -- TODO: allomorphs, page 86 in Saeed
          VInf             => arki ;
          VNegPast         => arkin ;
          _  => "TODO" }
      } ;

-------------------------
-- Regular verb paradigms

  cSug, cKari, cYaree, cJoogso, cQaado : Str -> Verb ;

  cSug sug = mkVerb sug sug ; -- TODO: stem/dictionary form of verbs with consonant clusters?

  cKari, cYaree = \kari -> mkVerb kari (kari+"y") ;

  cJoogso joogso =
    let joogsa = init joogso + "a" ;
     in mkVerb joogsa (joogsa + "d") ;

  cQaado qaado =
    let qaa = drop 2 qaado
     in mkVerb (qaa + "da") (qaa + "t") ;

  -- Smart paradigms
  mkV : Str -> Verb = \s -> case s of {
    _ + #c + #c + "o" => cJoogso s ;
    _           + "o" => cQaado s ; ----
    _           + "i" => cKari s ;
    _          + "ee" => cYaree s ;
    _                 => cSug s
    } ;


    mkV2 : Str -> Verb2 = \s -> mkV s ** { c2 = [] } ;
------------------
-- Irregular verbs

  copula : Verb = {
    s = table {
          VPres Sg1 pol    => if_then_Str pol "ahay" "ihi" ;
          VPres Sg2 pol    => if_then_Str pol "tahay" "ihid" ;
          VPres (Sg3 Masc) pol => if_then_Str pol "yahay" "aha" ;
          VPres (Sg3 Fem)  pol => if_then_Str pol "tahay" "aha" ;
          VPres (Pl1 _) pol => if_then_Str pol "nahay" "ihin" ;
          VPres Pl2 pol     => if_then_Str pol "tihiin" "ihidin" ;
          VPres Pl3 pol     => if_then_Str pol "yihiin" "aha" ;

          VPast (Sg1|Sg3 Masc)
                          => "ahaa" ;
          VPast (Sg2|Sg3 Fem)
                          => "ahayd" ;
          VPast (Pl1 _)   => "ahayn" ;
          VPast Pl2       => "ahaydeen" ;
          VPast Pl3       => "ahaayeen" ;
          VNegPast        => "ahi" ;
          VRel => "ah" ;
          _    => "TODO:copula" }
     } ;
   -- I somaliskan används inte något kopulaverb motsvarande svenskans är mellan
   -- två substantivfraser som utgör subjekt respektive predikatsfyllnad.
   -- Observera också att kopulaverbet vara alltid hamnar efter det adjektiv
 -- som utgör predikatsfyllnaden.
  -- TODO: add negation forms
  have_V : Verb = {
    s = table {
          VPres Sg1 _      => "leeyahay" ;
          VPres Sg2 _      => "leedahay" ;
          VPres (Sg3 Fem) _ => "leedahay" ;
          VPres (Sg3 Masc)_ => "leeyahay" ;
          VPres (Pl1 _) _  => "leenahay" ;
          VPres Pl2     _  => "leedihiin" ;
          VPres Pl3     _  => "leeyihiin" ;
          VPast x          => "l" + copula.s ! VPast x ;
          VRel => "leh" ;
          _    => "TODO:have_V" } ;
    } ;
-- Till VERBFRASEN ansluter sig
-- · satstypsmarkörer (waa, ma...),
-- · subjekts-pronomenet la man,
-- · objektspronomenen,
-- · prepositionerna och
-- · riktnings-adverben soó (mot en plats/person), sií (bort frånen plats/person), wadá tillsammans (mot en gemensam punkt), kalá iväg, isär (bort från en gemensam punkt).
-- Riktningsadverben har ibland en mycket konkret betydelse, men många gånger är betydelsen mera abstrakt.

-- Till satsmarkörerna, dvs. både fokusmarkörerna och satstypsmarkörerna ansluter sig
-- subjektspronomenen aan, aad, uu, ay, aynu, men inte la (man).

{- I 1 och 2 person används i princip alltid det korta subjektspronomet i påståendesatser.
I 3 person utelämnas däremot oftast det korta subjektspronomenet uu han eller ay hon, de efter satsmarkören waa om predikatet består av adjektiv + yahay / tahay / yihiin är.
Även i satser med andra verb i predikatet utelämnas det korta subjekts- pronomenet i 3 person någon gång ibland.
-}


------------------
-- satstypsmarkörer

stmarker : Agreement -> Bool => Str = \agr ->
  case agr of {
    Sg3 Masc => table { True => "wuu" ; False => "muu" } ;
    _        => table { True => "way" ; False => "may" }
   } ;
}
