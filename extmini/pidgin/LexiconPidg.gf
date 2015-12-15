concrete LexiconPidg of Lexicon = GrammarPidg ** open ParadigmsPidg in {

lin
  man_N = mkN "man"  ;
  woman_N = mkN "woman"  ;
  house_N = mkN "house" ;
  tree_N = mkN "tree" ;

  big_A = mkA "big" ;
  small_A = mkA "small" ;
  green_A = mkA "green" ;

  walk_V = mkV "walk" ;
  sleep_V = mkV "sleep"  ;
  arrive_V = mkV "arrive" ;

  love_V2 = mkV2 "love" ;
  look_V2 = mkV2 "look" ;
  please_V2 = mkV2 "please" ;

  --TODO write your own mkVS/mkVQ 
  -- believe_VS = mkVS "believe" ;
  -- know_VS = mkVS "know" ;
  -- wonder_VQ = mkVQ "wonder" ;

  john_PN = mkPN "John" ;
  mary_PN = mkPN "Mary" ;


}