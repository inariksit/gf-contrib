module MiniLang where

import PGF hiding (Tree)
----------------------------------------------------
-- automatic translation from GF to Haskell
----------------------------------------------------

class Gf a where
  gf :: a -> Expr
  fg :: Expr -> a

newtype GString = GString String  deriving Show

instance Gf GString where
  gf (GString x) = mkStr x
  fg t =
    case unStr t of
      Just x  ->  GString x
      Nothing -> error ("no GString " ++ show t)

newtype GInt = GInt Int  deriving Show

instance Gf GInt where
  gf (GInt x) = mkInt x
  fg t =
    case unInt t of
      Just x  ->  GInt x
      Nothing -> error ("no GInt " ++ show t)

newtype GFloat = GFloat Double  deriving Show

instance Gf GFloat where
  gf (GFloat x) = mkFloat x
  fg t =
    case unFloat t of
      Just x  ->  GFloat x
      Nothing -> error ("no GFloat " ++ show t)

----------------------------------------------------
-- below this line machine-generated
----------------------------------------------------

data GA =
   Gbad_A 
 | Gbig_A 
 | Gblack_A 
 | Gblue_A 
 | Gclean_A 
 | Gclever_A 
 | Gcold_A 
 | Gdirty_A 
 | Ggood_A 
 | Ggreen_A 
 | Gheavy_A 
 | Ghot_A 
 | Gnew_A 
 | Gold_A 
 | Gready_A 
 | Gred_A 
 | Gsmall_A 
 | Gwarm_A 
 | Gwhite_A 
 | Gyellow_A 
 | Gyoung_A 
  deriving Show

data GAP = GPositA GA 
  deriving Show

data GAdv =
   GPrepNP GPrep GNP 
 | Galready_Adv 
 | Gnow_Adv 
  deriving Show

data GCN =
   GAdjCN GAP GCN 
 | GUseN GN 
  deriving Show

data GCl = GPredVP GNP GVP 
  deriving Show

data GConj =
   Gand_Conj 
 | Gor_Conj 
  deriving Show

data GDet =
   GaPl_Det 
 | Ga_Det 
 | Gevery_Det 
 | GthePl_Det 
 | Gthe_Det 
  deriving Show

data GN =
   Ganimal_N 
 | Gapple_N 
 | Gbaby_N 
 | Gbeer_N 
 | Gbike_N 
 | Gbird_N 
 | Gblood_N 
 | Gboat_N 
 | Gbook_N 
 | Gboy_N 
 | Gbread_N 
 | Gcar_N 
 | Gcat_N 
 | Gchild_N 
 | Gcity_N 
 | Gcloud_N 
 | Gcomputer_N 
 | Gcow_N 
 | Gdog_N 
 | Gfire_N 
 | Gfish_N 
 | Gflower_N 
 | Gfriend_N 
 | Ggirl_N 
 | Ggrammar_N 
 | Ghorse_N 
 | Ghouse_N 
 | Glanguage_N 
 | Gman_N 
 | Gmilk_N 
 | Gmusic_N 
 | Griver_N 
 | Gsea_N 
 | Gship_N 
 | Gstar_N 
 | Gtrain_N 
 | Gtree_N 
 | Gwater_N 
 | Gwine_N 
 | Gwoman_N 
  deriving Show

data GNP =
   GDetCN GDet GCN 
 | GMassNP GCN 
 | GUsePN GPN 
 | GUsePron GPron 
  deriving Show

data GPN =
   Gjohn_PN 
 | Gparis_PN 
  deriving Show

data GPol =
   GPNeg 
 | GPPos 
  deriving Show

data GPrep =
   Gin_Prep 
 | Gon_Prep 
 | Gwith_Prep 
  deriving Show

data GPron =
   Ghe_Pron 
 | Gi_Pron 
 | Gshe_Pron 
 | Gthey_Pron 
 | Gwe_Pron 
 | GyouPl_Pron 
 | GyouSg_Pron 
  deriving Show

data GS =
   GCoordS GConj GS GS 
 | GUsePresCl GPol GCl 
  deriving Show

data GUtt =
   GUttNP GNP 
 | GUttS GS 
  deriving Show

data GV =
   Gcome_V 
 | Ggo_V 
 | Gjump_V 
 | Glive_V 
 | Gplay_V 
 | Grun_V 
 | Gsleep_V 
 | Gswim_V 
 | Gtravel_V 
 | Gwalk_V 
  deriving Show

data GV2 =
   Gbreak_V2 
 | Gbuy_V2 
 | Gdrink_V2 
 | Geat_V2 
 | Gfind_V2 
 | Gkill_V2 
 | Glove_V2 
 | Gread_V2 
 | Gsee_V2 
 | Gteach_V2 
 | Gunderstand_V2 
 | Gwait_V2 
  deriving Show

data GVP =
   GAdvVP GVP GAdv 
 | GComplV2 GV2 GNP 
 | GReflV2 GV2 
 | GUseAP GAP 
 | GUseV GV 
  deriving Show


instance Gf GA where
  gf Gbad_A = mkApp (mkCId "bad_A") []
  gf Gbig_A = mkApp (mkCId "big_A") []
  gf Gblack_A = mkApp (mkCId "black_A") []
  gf Gblue_A = mkApp (mkCId "blue_A") []
  gf Gclean_A = mkApp (mkCId "clean_A") []
  gf Gclever_A = mkApp (mkCId "clever_A") []
  gf Gcold_A = mkApp (mkCId "cold_A") []
  gf Gdirty_A = mkApp (mkCId "dirty_A") []
  gf Ggood_A = mkApp (mkCId "good_A") []
  gf Ggreen_A = mkApp (mkCId "green_A") []
  gf Gheavy_A = mkApp (mkCId "heavy_A") []
  gf Ghot_A = mkApp (mkCId "hot_A") []
  gf Gnew_A = mkApp (mkCId "new_A") []
  gf Gold_A = mkApp (mkCId "old_A") []
  gf Gready_A = mkApp (mkCId "ready_A") []
  gf Gred_A = mkApp (mkCId "red_A") []
  gf Gsmall_A = mkApp (mkCId "small_A") []
  gf Gwarm_A = mkApp (mkCId "warm_A") []
  gf Gwhite_A = mkApp (mkCId "white_A") []
  gf Gyellow_A = mkApp (mkCId "yellow_A") []
  gf Gyoung_A = mkApp (mkCId "young_A") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "bad_A" -> Gbad_A 
      Just (i,[]) | i == mkCId "big_A" -> Gbig_A 
      Just (i,[]) | i == mkCId "black_A" -> Gblack_A 
      Just (i,[]) | i == mkCId "blue_A" -> Gblue_A 
      Just (i,[]) | i == mkCId "clean_A" -> Gclean_A 
      Just (i,[]) | i == mkCId "clever_A" -> Gclever_A 
      Just (i,[]) | i == mkCId "cold_A" -> Gcold_A 
      Just (i,[]) | i == mkCId "dirty_A" -> Gdirty_A 
      Just (i,[]) | i == mkCId "good_A" -> Ggood_A 
      Just (i,[]) | i == mkCId "green_A" -> Ggreen_A 
      Just (i,[]) | i == mkCId "heavy_A" -> Gheavy_A 
      Just (i,[]) | i == mkCId "hot_A" -> Ghot_A 
      Just (i,[]) | i == mkCId "new_A" -> Gnew_A 
      Just (i,[]) | i == mkCId "old_A" -> Gold_A 
      Just (i,[]) | i == mkCId "ready_A" -> Gready_A 
      Just (i,[]) | i == mkCId "red_A" -> Gred_A 
      Just (i,[]) | i == mkCId "small_A" -> Gsmall_A 
      Just (i,[]) | i == mkCId "warm_A" -> Gwarm_A 
      Just (i,[]) | i == mkCId "white_A" -> Gwhite_A 
      Just (i,[]) | i == mkCId "yellow_A" -> Gyellow_A 
      Just (i,[]) | i == mkCId "young_A" -> Gyoung_A 


      _ -> error ("no A " ++ show t)

instance Gf GAP where
  gf (GPositA x1) = mkApp (mkCId "PositA") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "PositA" -> GPositA (fg x1)


      _ -> error ("no AP " ++ show t)

instance Gf GAdv where
  gf (GPrepNP x1 x2) = mkApp (mkCId "PrepNP") [gf x1, gf x2]
  gf Galready_Adv = mkApp (mkCId "already_Adv") []
  gf Gnow_Adv = mkApp (mkCId "now_Adv") []

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "PrepNP" -> GPrepNP (fg x1) (fg x2)
      Just (i,[]) | i == mkCId "already_Adv" -> Galready_Adv 
      Just (i,[]) | i == mkCId "now_Adv" -> Gnow_Adv 


      _ -> error ("no Adv " ++ show t)

instance Gf GCN where
  gf (GAdjCN x1 x2) = mkApp (mkCId "AdjCN") [gf x1, gf x2]
  gf (GUseN x1) = mkApp (mkCId "UseN") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AdjCN" -> GAdjCN (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "UseN" -> GUseN (fg x1)


      _ -> error ("no CN " ++ show t)

instance Gf GCl where
  gf (GPredVP x1 x2) = mkApp (mkCId "PredVP") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "PredVP" -> GPredVP (fg x1) (fg x2)


      _ -> error ("no Cl " ++ show t)

instance Gf GConj where
  gf Gand_Conj = mkApp (mkCId "and_Conj") []
  gf Gor_Conj = mkApp (mkCId "or_Conj") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "and_Conj" -> Gand_Conj 
      Just (i,[]) | i == mkCId "or_Conj" -> Gor_Conj 


      _ -> error ("no Conj " ++ show t)

instance Gf GDet where
  gf GaPl_Det = mkApp (mkCId "aPl_Det") []
  gf Ga_Det = mkApp (mkCId "a_Det") []
  gf Gevery_Det = mkApp (mkCId "every_Det") []
  gf GthePl_Det = mkApp (mkCId "thePl_Det") []
  gf Gthe_Det = mkApp (mkCId "the_Det") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "aPl_Det" -> GaPl_Det 
      Just (i,[]) | i == mkCId "a_Det" -> Ga_Det 
      Just (i,[]) | i == mkCId "every_Det" -> Gevery_Det 
      Just (i,[]) | i == mkCId "thePl_Det" -> GthePl_Det 
      Just (i,[]) | i == mkCId "the_Det" -> Gthe_Det 


      _ -> error ("no Det " ++ show t)

instance Gf GN where
  gf Ganimal_N = mkApp (mkCId "animal_N") []
  gf Gapple_N = mkApp (mkCId "apple_N") []
  gf Gbaby_N = mkApp (mkCId "baby_N") []
  gf Gbeer_N = mkApp (mkCId "beer_N") []
  gf Gbike_N = mkApp (mkCId "bike_N") []
  gf Gbird_N = mkApp (mkCId "bird_N") []
  gf Gblood_N = mkApp (mkCId "blood_N") []
  gf Gboat_N = mkApp (mkCId "boat_N") []
  gf Gbook_N = mkApp (mkCId "book_N") []
  gf Gboy_N = mkApp (mkCId "boy_N") []
  gf Gbread_N = mkApp (mkCId "bread_N") []
  gf Gcar_N = mkApp (mkCId "car_N") []
  gf Gcat_N = mkApp (mkCId "cat_N") []
  gf Gchild_N = mkApp (mkCId "child_N") []
  gf Gcity_N = mkApp (mkCId "city_N") []
  gf Gcloud_N = mkApp (mkCId "cloud_N") []
  gf Gcomputer_N = mkApp (mkCId "computer_N") []
  gf Gcow_N = mkApp (mkCId "cow_N") []
  gf Gdog_N = mkApp (mkCId "dog_N") []
  gf Gfire_N = mkApp (mkCId "fire_N") []
  gf Gfish_N = mkApp (mkCId "fish_N") []
  gf Gflower_N = mkApp (mkCId "flower_N") []
  gf Gfriend_N = mkApp (mkCId "friend_N") []
  gf Ggirl_N = mkApp (mkCId "girl_N") []
  gf Ggrammar_N = mkApp (mkCId "grammar_N") []
  gf Ghorse_N = mkApp (mkCId "horse_N") []
  gf Ghouse_N = mkApp (mkCId "house_N") []
  gf Glanguage_N = mkApp (mkCId "language_N") []
  gf Gman_N = mkApp (mkCId "man_N") []
  gf Gmilk_N = mkApp (mkCId "milk_N") []
  gf Gmusic_N = mkApp (mkCId "music_N") []
  gf Griver_N = mkApp (mkCId "river_N") []
  gf Gsea_N = mkApp (mkCId "sea_N") []
  gf Gship_N = mkApp (mkCId "ship_N") []
  gf Gstar_N = mkApp (mkCId "star_N") []
  gf Gtrain_N = mkApp (mkCId "train_N") []
  gf Gtree_N = mkApp (mkCId "tree_N") []
  gf Gwater_N = mkApp (mkCId "water_N") []
  gf Gwine_N = mkApp (mkCId "wine_N") []
  gf Gwoman_N = mkApp (mkCId "woman_N") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "animal_N" -> Ganimal_N 
      Just (i,[]) | i == mkCId "apple_N" -> Gapple_N 
      Just (i,[]) | i == mkCId "baby_N" -> Gbaby_N 
      Just (i,[]) | i == mkCId "beer_N" -> Gbeer_N 
      Just (i,[]) | i == mkCId "bike_N" -> Gbike_N 
      Just (i,[]) | i == mkCId "bird_N" -> Gbird_N 
      Just (i,[]) | i == mkCId "blood_N" -> Gblood_N 
      Just (i,[]) | i == mkCId "boat_N" -> Gboat_N 
      Just (i,[]) | i == mkCId "book_N" -> Gbook_N 
      Just (i,[]) | i == mkCId "boy_N" -> Gboy_N 
      Just (i,[]) | i == mkCId "bread_N" -> Gbread_N 
      Just (i,[]) | i == mkCId "car_N" -> Gcar_N 
      Just (i,[]) | i == mkCId "cat_N" -> Gcat_N 
      Just (i,[]) | i == mkCId "child_N" -> Gchild_N 
      Just (i,[]) | i == mkCId "city_N" -> Gcity_N 
      Just (i,[]) | i == mkCId "cloud_N" -> Gcloud_N 
      Just (i,[]) | i == mkCId "computer_N" -> Gcomputer_N 
      Just (i,[]) | i == mkCId "cow_N" -> Gcow_N 
      Just (i,[]) | i == mkCId "dog_N" -> Gdog_N 
      Just (i,[]) | i == mkCId "fire_N" -> Gfire_N 
      Just (i,[]) | i == mkCId "fish_N" -> Gfish_N 
      Just (i,[]) | i == mkCId "flower_N" -> Gflower_N 
      Just (i,[]) | i == mkCId "friend_N" -> Gfriend_N 
      Just (i,[]) | i == mkCId "girl_N" -> Ggirl_N 
      Just (i,[]) | i == mkCId "grammar_N" -> Ggrammar_N 
      Just (i,[]) | i == mkCId "horse_N" -> Ghorse_N 
      Just (i,[]) | i == mkCId "house_N" -> Ghouse_N 
      Just (i,[]) | i == mkCId "language_N" -> Glanguage_N 
      Just (i,[]) | i == mkCId "man_N" -> Gman_N 
      Just (i,[]) | i == mkCId "milk_N" -> Gmilk_N 
      Just (i,[]) | i == mkCId "music_N" -> Gmusic_N 
      Just (i,[]) | i == mkCId "river_N" -> Griver_N 
      Just (i,[]) | i == mkCId "sea_N" -> Gsea_N 
      Just (i,[]) | i == mkCId "ship_N" -> Gship_N 
      Just (i,[]) | i == mkCId "star_N" -> Gstar_N 
      Just (i,[]) | i == mkCId "train_N" -> Gtrain_N 
      Just (i,[]) | i == mkCId "tree_N" -> Gtree_N 
      Just (i,[]) | i == mkCId "water_N" -> Gwater_N 
      Just (i,[]) | i == mkCId "wine_N" -> Gwine_N 
      Just (i,[]) | i == mkCId "woman_N" -> Gwoman_N 


      _ -> error ("no N " ++ show t)

instance Gf GNP where
  gf (GDetCN x1 x2) = mkApp (mkCId "DetCN") [gf x1, gf x2]
  gf (GMassNP x1) = mkApp (mkCId "MassNP") [gf x1]
  gf (GUsePN x1) = mkApp (mkCId "UsePN") [gf x1]
  gf (GUsePron x1) = mkApp (mkCId "UsePron") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "DetCN" -> GDetCN (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "MassNP" -> GMassNP (fg x1)
      Just (i,[x1]) | i == mkCId "UsePN" -> GUsePN (fg x1)
      Just (i,[x1]) | i == mkCId "UsePron" -> GUsePron (fg x1)


      _ -> error ("no NP " ++ show t)

instance Gf GPN where
  gf Gjohn_PN = mkApp (mkCId "john_PN") []
  gf Gparis_PN = mkApp (mkCId "paris_PN") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "john_PN" -> Gjohn_PN 
      Just (i,[]) | i == mkCId "paris_PN" -> Gparis_PN 


      _ -> error ("no PN " ++ show t)

instance Gf GPol where
  gf GPNeg = mkApp (mkCId "PNeg") []
  gf GPPos = mkApp (mkCId "PPos") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "PNeg" -> GPNeg 
      Just (i,[]) | i == mkCId "PPos" -> GPPos 


      _ -> error ("no Pol " ++ show t)

instance Gf GPrep where
  gf Gin_Prep = mkApp (mkCId "in_Prep") []
  gf Gon_Prep = mkApp (mkCId "on_Prep") []
  gf Gwith_Prep = mkApp (mkCId "with_Prep") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "in_Prep" -> Gin_Prep 
      Just (i,[]) | i == mkCId "on_Prep" -> Gon_Prep 
      Just (i,[]) | i == mkCId "with_Prep" -> Gwith_Prep 


      _ -> error ("no Prep " ++ show t)

instance Gf GPron where
  gf Ghe_Pron = mkApp (mkCId "he_Pron") []
  gf Gi_Pron = mkApp (mkCId "i_Pron") []
  gf Gshe_Pron = mkApp (mkCId "she_Pron") []
  gf Gthey_Pron = mkApp (mkCId "they_Pron") []
  gf Gwe_Pron = mkApp (mkCId "we_Pron") []
  gf GyouPl_Pron = mkApp (mkCId "youPl_Pron") []
  gf GyouSg_Pron = mkApp (mkCId "youSg_Pron") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "he_Pron" -> Ghe_Pron 
      Just (i,[]) | i == mkCId "i_Pron" -> Gi_Pron 
      Just (i,[]) | i == mkCId "she_Pron" -> Gshe_Pron 
      Just (i,[]) | i == mkCId "they_Pron" -> Gthey_Pron 
      Just (i,[]) | i == mkCId "we_Pron" -> Gwe_Pron 
      Just (i,[]) | i == mkCId "youPl_Pron" -> GyouPl_Pron 
      Just (i,[]) | i == mkCId "youSg_Pron" -> GyouSg_Pron 


      _ -> error ("no Pron " ++ show t)

instance Gf GS where
  gf (GCoordS x1 x2 x3) = mkApp (mkCId "CoordS") [gf x1, gf x2, gf x3]
  gf (GUsePresCl x1 x2) = mkApp (mkCId "UsePresCl") [gf x1, gf x2]

  fg t =
    case unApp t of
      Just (i,[x1,x2,x3]) | i == mkCId "CoordS" -> GCoordS (fg x1) (fg x2) (fg x3)
      Just (i,[x1,x2]) | i == mkCId "UsePresCl" -> GUsePresCl (fg x1) (fg x2)


      _ -> error ("no S " ++ show t)

instance Gf GUtt where
  gf (GUttNP x1) = mkApp (mkCId "UttNP") [gf x1]
  gf (GUttS x1) = mkApp (mkCId "UttS") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1]) | i == mkCId "UttNP" -> GUttNP (fg x1)
      Just (i,[x1]) | i == mkCId "UttS" -> GUttS (fg x1)


      _ -> error ("no Utt " ++ show t)

instance Gf GV where
  gf Gcome_V = mkApp (mkCId "come_V") []
  gf Ggo_V = mkApp (mkCId "go_V") []
  gf Gjump_V = mkApp (mkCId "jump_V") []
  gf Glive_V = mkApp (mkCId "live_V") []
  gf Gplay_V = mkApp (mkCId "play_V") []
  gf Grun_V = mkApp (mkCId "run_V") []
  gf Gsleep_V = mkApp (mkCId "sleep_V") []
  gf Gswim_V = mkApp (mkCId "swim_V") []
  gf Gtravel_V = mkApp (mkCId "travel_V") []
  gf Gwalk_V = mkApp (mkCId "walk_V") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "come_V" -> Gcome_V 
      Just (i,[]) | i == mkCId "go_V" -> Ggo_V 
      Just (i,[]) | i == mkCId "jump_V" -> Gjump_V 
      Just (i,[]) | i == mkCId "live_V" -> Glive_V 
      Just (i,[]) | i == mkCId "play_V" -> Gplay_V 
      Just (i,[]) | i == mkCId "run_V" -> Grun_V 
      Just (i,[]) | i == mkCId "sleep_V" -> Gsleep_V 
      Just (i,[]) | i == mkCId "swim_V" -> Gswim_V 
      Just (i,[]) | i == mkCId "travel_V" -> Gtravel_V 
      Just (i,[]) | i == mkCId "walk_V" -> Gwalk_V 


      _ -> error ("no V " ++ show t)

instance Gf GV2 where
  gf Gbreak_V2 = mkApp (mkCId "break_V2") []
  gf Gbuy_V2 = mkApp (mkCId "buy_V2") []
  gf Gdrink_V2 = mkApp (mkCId "drink_V2") []
  gf Geat_V2 = mkApp (mkCId "eat_V2") []
  gf Gfind_V2 = mkApp (mkCId "find_V2") []
  gf Gkill_V2 = mkApp (mkCId "kill_V2") []
  gf Glove_V2 = mkApp (mkCId "love_V2") []
  gf Gread_V2 = mkApp (mkCId "read_V2") []
  gf Gsee_V2 = mkApp (mkCId "see_V2") []
  gf Gteach_V2 = mkApp (mkCId "teach_V2") []
  gf Gunderstand_V2 = mkApp (mkCId "understand_V2") []
  gf Gwait_V2 = mkApp (mkCId "wait_V2") []

  fg t =
    case unApp t of
      Just (i,[]) | i == mkCId "break_V2" -> Gbreak_V2 
      Just (i,[]) | i == mkCId "buy_V2" -> Gbuy_V2 
      Just (i,[]) | i == mkCId "drink_V2" -> Gdrink_V2 
      Just (i,[]) | i == mkCId "eat_V2" -> Geat_V2 
      Just (i,[]) | i == mkCId "find_V2" -> Gfind_V2 
      Just (i,[]) | i == mkCId "kill_V2" -> Gkill_V2 
      Just (i,[]) | i == mkCId "love_V2" -> Glove_V2 
      Just (i,[]) | i == mkCId "read_V2" -> Gread_V2 
      Just (i,[]) | i == mkCId "see_V2" -> Gsee_V2 
      Just (i,[]) | i == mkCId "teach_V2" -> Gteach_V2 
      Just (i,[]) | i == mkCId "understand_V2" -> Gunderstand_V2 
      Just (i,[]) | i == mkCId "wait_V2" -> Gwait_V2 


      _ -> error ("no V2 " ++ show t)

instance Gf GVP where
  gf (GAdvVP x1 x2) = mkApp (mkCId "AdvVP") [gf x1, gf x2]
  gf (GComplV2 x1 x2) = mkApp (mkCId "ComplV2") [gf x1, gf x2]
  gf (GReflV2 x1) = mkApp (mkCId "ReflV2") [gf x1]
  gf (GUseAP x1) = mkApp (mkCId "UseAP") [gf x1]
  gf (GUseV x1) = mkApp (mkCId "UseV") [gf x1]

  fg t =
    case unApp t of
      Just (i,[x1,x2]) | i == mkCId "AdvVP" -> GAdvVP (fg x1) (fg x2)
      Just (i,[x1,x2]) | i == mkCId "ComplV2" -> GComplV2 (fg x1) (fg x2)
      Just (i,[x1]) | i == mkCId "ReflV2" -> GReflV2 (fg x1)
      Just (i,[x1]) | i == mkCId "UseAP" -> GUseAP (fg x1)
      Just (i,[x1]) | i == mkCId "UseV" -> GUseV (fg x1)


      _ -> error ("no VP " ++ show t)


