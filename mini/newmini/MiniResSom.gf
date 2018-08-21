resource MiniResSom = open Prelude in {

param
  Number = Sg | Pl ;
  Case = Nom | Acc ;
  Gender = Masc | Fem ;
  Person = Per1 | Per2 | Per3 ;

  Inclusion = Excl | Incl ;
  Agreement = Sg1 | Sg2 | Sg3 Gender | Pl1 Inclusion | Pl2 | Pl3 ;

  Defi = Def | Indef ;
  NForm = NF Number Defi | Numerative | Poss Agreement ;
  --TODO: cases (or contracted prepositions)?, focus markers

  VForm = Inf | PresSg3 ;

oper
  getAgr : Number -> Gender -> Agreement = \n,g ->
    case n of { Sg => Sg3 g ; Pl => Pl3 } ;
  getNum : Agreement -> Number = \a ->
    case a of { Sg1|Sg2|Sg3 _ => Sg ; _ => Pl } ;

  Noun : Type = {s : NForm => Str ; g : Gender} ;



  -- Den determinativa ändelsen –kii/–tii används när man vill framhålla att ett bestämt föremål inte bara är allmänt bestämt utan dessutom förväntas vara känt sedan tidigare för den som man talar med.
  -- Det somaliska determinativa morfemet kii/tii har möjligen en något bredare användning, eftersom det markerat att talaren anser att lyssnare borde känna till det som substantivet refererar till.
  -- mundul·kii·sii   -- kii is the morpheme, what is sii?
  mkNoun : (x1,_,_,x4 : Str) -> Gender -> Noun = \a,b,c,d,gender ->
    { s = table { NF Sg Indef => a ;
                  NF Sg Def   => b ;
                  NF Pl Indef => c ;
                  NF Pl Def   => d ;
                  Numerative  => a ;
                  Poss Sg1 => b + case gender of { Fem => "yda" ; Masc => "yga" } ;
                  Poss Sg2 => b + case gender of { Fem => "ada" ; Masc => "aga" } ;
                  Poss _ => b + ":TODO:poss" } ; --check page 40
      g = gender } ;



  -- Regular noun paradigms
  nHooyo, nAabbe, nMas, nUl, nGuri, nXayawaan : Str -> Noun ;

  --1) Feminine nouns that end in -o
  nHooyo hooyo =
    mkNoun hooyo (init hooyo + "ada") (hooyo + "oyin") (hooyo + "oyinka") Fem ;

  --2) Masculine nouns that end in -e
  nAabbe aabbe = let aabb = init aabbe in
    mkNoun aabbe (aabb + "aaha") (aabb + "ayaal") (aabb + "ayaásha") Masc ;

  -- 3) Masculine, plural with duplication
  nMas mas = let s = last mas in
    mkNoun mas (mas + "ka") (mas + "a" + s) (mas + "a" + s + "ka") Masc ;

  -- 4a) Feminine, plural with ó 
  nUl ul = let o  = case last ul of { "i" => "yo" ; _ => "o" } ;
               u  = case last ul of { "l" => init ul ; _ => ul } ;
               sha = allomorph Ta ul ;
               ulood = ul + o + "od" ;
               n = mkNoun ul (u + sha) (ul + o) (ul + "aha") Fem in
    n ** { s = table { Numerative => ulood ; x => n.s ! x } } ;

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
                  "c"|"g"                     => "yo" ; --TODO other sounds?
                  _                           => "o" } ;

      -- Based on the table on page 21--TODO find generalisations in patterns
      Ta => case last stem of {
                   "d"|"c"|"h"|"x"|"q"|"'"|"i"|"y"|"w" => "da" ;
                   "l" => "sha" ;
                   _   => "ta" } ;

      Ka => case stem of {
                   _ + "g"|"aa"|"i"|"y"|"w" => "ga" ;
                   _ + "c"|"h"|"x"|"q"|"'"  => "a" ;
                   _ + "e"|"o"              => "ha" ;
                   _                        => "ka" }
    } ;

param Morpheme = O | Ka | Ta ;

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

  mkN : Str -> Noun = \n -> case n of {

      _ + "d" => nUl n ;
      _ + "e" => nAabbe n ;
      _ + "o" => nHooyo n ;
      #c + #v + #c | #c + #v + #v + #c | #v + #c  => nMas n ;
      _ => nXayawaan n 
   } ;


--------------------------------------------------------------------------------
oper

 -- Komparativ
 -- För att uttrycka motsvarigheten till svenskans komparativ placerar man på somaliska helt enkelt prepositionen ká 'från, av, än' framför adjektivet i fråga. Adjektivet får ingen ändelse.
 -- Shan waa ay ká yar tahay siddéed. Fem är mindre än åtta.
 -- Superlativ
 -- Motsvarigheten till svenskans superlativ bildas med prepositionsklustret ugú som till sin betydelse närmast motsvarar svenskans allra, t.ex.
 -- ugu horrayntii (det att komma) allra först

  Adjective : Type = { s : Number => Str } ;

  mkA : Str -> Adjective = \yar ->
    { s = table { Sg => yar ; Pl => duplicate yar } } ;

  duplicate : Str -> Str = \yar -> case yar of {
    y@#c + a@#v + r@#c + _ => y + a + r + yar ;
    g@#c + aa@#vv      + _ => g + aa + yar ; --TODO: proper patterns
    _                      => yar + ":plural" } ;
--------------------------------------------------------------------------------
-- oper

--   Verb : Type = { s : VForm => Str } ;

-- Negationen má `inte' skrivs samman med en föregående preposition.
-- Prepositionen u dras obligatoriskt samman med föregående pronomen så att /a/ + /u/ > /oo/.


}
