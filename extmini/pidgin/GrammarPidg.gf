concrete GrammarPidg of Grammar = open ResPidg in {
	flags coding = utf8;

	--This is the start category. It should actually be just a {s : Str} even in the final version!
    lincat Utt = {s : Str} ;


	--SENTENCE:
	lincat S  = ResPidg.PhraseyThing ; 
	
	--Build a sentence from a tense, a polarity and a clause:
	lin UseCl t p cl = { --UseCl : Tense -> Pol -> Cl -> S
		s = cl.s ++ t.s ++ p.s
	};
	
	--Build a new sentence by connecting two existing sentences with a conjunction:
	lin ConjS co sx sy = { -- : Conj -> S  -> S  -> S
		s = sx.s ++ co.s ++ sy.s
	};
	
	
	
	--TENSE:
	lincat Tense = {s : Str} ;
	
	--Four prefabricated tenses:
	lin Pres = {s = ""};
	lin Perf = {s = "still"};
	lin Past = {s = "in the past"};
	lin Fut =  {s = "in the future"};
	
	
	
	--POLARITY:
	lincat Pol = {s : Str};
	
	--Two prefabricated polarities:
	lin Pos = {s = ""};
	lin Neg = {s = "not"};
	-- These could as well be in ResPidg.
	-- But if it's short and simple, it might as well be here.
	

	--CLAUSE:
	lincat Cl = ResPidg.PhraseyThing ;
	
	--Build a clause from a noun phrase (= the subject) and a verb phrase:
	lin PredVP np vp = { --PredVP : NP -> VP -> Cl
		s = np.s ++ vp.s
	};
	
	

	--VERB PHRASE:
	lincat VP = ResPidg.VerbyThing ;
	
	--Build a verb phrase by elevating a verb:
	lin UseV v = { --UseV : V -> VP
		s = v.s
	};
	
	--Build a verb phrase from a two-place verb and a noun phrase (= the object):
	lin ComplV2 v2 np = { --ComplV2 : V2 -> NP -> VP
		s = v2.s ++ np.s
	};
	
	--Build a verb phrase from an adjective phrase, using the verb 'to be' ("big" --> "is big"):
	lin CompAP ap = { --CompAP : AP -> VP
		s = "be" ++ ap.s
	};
	
	
	
	--VERB:
	lincat V = ResPidg.VerbyThing ; -- {s : Str}
	
	--TWO-PLACE VERB:
	lincat V2 = ResPidg.VerbyThing ; --{s : Str}

	--See some actual verbs in LexiconPidg!

	
	--NOUN PHRASE:
	lincat NP = ResPidg.NounyThing ;
	
	--Some prefabricated noun phrases:
	lin i_NP = {s = "me"};
	lin youSg_NP = {s = "you"};
	lin he_NP = {s = "him"};
	lin she_NP = {s = "her"};
	lin we_NP = {s = "us"};
	lin youPl_NP = {s = "you all"};
	lin they_NP = {s = "them"};
	
	--Build a noun phrase from a determiner and a common noun:
	lin DetCN det cn = { --DetCN : Det -> CN -> NP
		s = det.s ++ cn.s
	};
	
	--Build a new noun phrase by connecting two existing noun phrases with a conjunction:
	lin ConjNP co nx ny = { --ConjNP : Conj -> NP -> NP -> NP
		s = nx.s ++ co.s ++ ny.s
	};
	
	
	
	--DETERMINER:
	lincat Det = ResPidg.Determiner ; --{s : Str}
	
	--Some prefabricated determiners: 
        --Usually you don't have the common
        lin a_Det = {s = "a"};
        lin the_Det = {s = "the"};
        lin every_Det = {s = "every"};
        lin this_Det = {s = "this"};
	lin these_Det = {s = "these"};
        lin that_Det = {s = "that"};
        lin those_Det = {s = "those"};
	
	
	
	--COMMON NOUN:
	lincat CN = ResPidg.NounyThing ;
	
	--Build a common noun by elevating a noun:
	lin UseN n = { --UseN : N -> CN
		s = n.s
	};
	
	--Build a new common noun by adding an adjective phrase to an existing common noun:
	lin ModCN ap cn = { --ModCN : AP -> CN -> CN
		s = cn.s ++ ap.s
	};
	
	
	
	--NOUN:
	lincat N = ResPidg.NounyThing ; --{s : Str} ;
	
	--Some prefabricated nouns:
	lin man_N = {s = "man"};
	lin woman_N = {s = "woman"};
	lin house_N = {s = "house"};
	lin tree_N = {s = "tree"};
	
	
	
	--ADJECTIVE PHRASE:
	lincat AP = ResPidg.NounyThing ;
	
	--Build an adjective phrase by elevating an adjective:
	lin UseA a = { --UseA : A -> AP
		s = a.s
	};
	
	--Build a new adjective phrase by adding an ad-adjective to an existing adjective phrase:
	lin AdAP ad ap = { --AdAP : AdA -> AP -> AP
		s = ad.s ++ ap.s
	};
	
	
	
	--ADJECTIVE:
	lincat A = ResPidg.NounyThing ;	
	
	--AD-ADJECTIVE:
	lincat AdA = {s : Str};
	
	--A prefabricated ad-adjective:
	lin very_AdA = {s = "very"};
	
	
	
	--CONJUNCTION:
	lincat Conj = {s : Str};
	
	--Two prefabricated conjunctions:
	lin and_Conj = {s = "and"};
	lin or_Conj = {s = "or"};


--------------------------------------------------------------------------------
{- This was the mini grammar. Now follows the extension!
   The following lines are commented out line by line. 
   If no specification is given, the compiler inserts the type
   {s : Str} automatically.
   When you want to give another definition to something, 
   just uncomment and add the type after =. -}

 -- lincat
 --    Utt =      -- utterance (sentence or question) e.g. "does she walk"
 --    QS  =     -- question (fixed tense)           e.g. "who doesn't walk"
 --    QCl =      -- question clause (variable tense) e.g. "who walks"
 --    ClSlash =  -- clause missing noun phrase       e.g. "she walks with"
 --    Adv =      -- adverb                           e.g. "here"
 --    Prep =    -- preposition (and/or case)        e.g. "with"
 --    VS =      -- sentence-complement verb         e.g. "know"
 --    VQ =      -- question-complement verb         e.g. "wonder"
 --    VV =      -- verb-phrase-complement verb      e.g. "want"
 --    IP =      -- interrogative pronoun            e.g. "who"
 --    PN =      -- proper name                      e.g. "John"
 --    Subj =    -- subjunction                      e.g. "because"
 --    IAdv =    -- interrogative adverb             e.g. "why"


--Remember to change the functions as you change the types!
--Now all of the following functions assume a type {s:Str} from all arguments
  lin
    UttS sent = {s = sent.s} ; --S -> Utt
    UttQS qs  = {s = qs.s} ;   -- QS -> Utt ;

    UseQCl t p cl = { --UseQCl : Tense -> Pol -> QCl -> S
		s = cl.s ++ t.s ++ p.s
	};

    QuestCl cl = {s = cl.s} ;
    -- QuestVP    : IP -> VP -> QCl ;       -- who walks
    -- QuestSlash : IP -> ClSlash -> QCl ;  -- who does she walk with
    -- QuestIAdv  : IAdv -> Cl -> QCl ;     -- why does she walk

    -- SubjCl : Cl -> Subj -> S -> Cl ;     -- she walks because we run

    -- CompAdv : Adv -> VP ;         -- be here
    -- PrepNP  : Prep -> NP -> Adv ; -- in the house

    -- ComplVS : VS -> S  -> VP ;  -- know that she walks
    -- ComplVQ : VQ -> QS -> VP ;  -- wonder who walks
    -- ComplVV : VV -> VP -> VP ;  -- want to walk

    -- SlashV2   : NP -> V2 -> ClSlash ;   -- she loves
    -- SlashPrep : Cl -> Prep -> ClSlash ; -- she walks with

    -- AdvVP : VP -> Adv -> VP ; -- walk in the city

    -- UsePN : PN -> NP ;        -- John
    -- AdvNP : NP -> Adv -> NP ; -- the man in the city

    -- who_IP  : IP ;
    -- here_Adv : Adv ;
    -- by_Prep, in_Prep, of_Prep, with_Prep : Prep ;
    -- can_VV, must_VV, want_VV : VV ;
    -- although_Subj, because_Subj, when_Subj : Subj ;
    -- when_IAdv, where_IAdv, why_IAdv : IAdv ;
}