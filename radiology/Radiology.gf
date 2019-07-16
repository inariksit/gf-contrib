abstract Radiology = {

flags startcat = Statement ;

  cat
    Statement ;
    Description ;
    Descriptions ;

    Organ ;

    Property ;
    Descriptor Property ;

  fun
    Pred : Organ -> Description -> Statement ;
    Describe : (p : Property) -> Descriptor p -> Description ;

    BaseDescription : Description -> Description -> Descriptions ;
    ConsDescription : Description -> Descriptions -> Descriptions ;
    ConjDescription : Descriptions -> Description ;

    Heart,
    Spleen : Organ ;

    Size,
    Color : Property ;

    Black,
    Green : Descriptor Color ;

    Small,
    Normal,
    Widened,
    Microscopic : Descriptor Size ;

    mm : Int -> Descriptor Size ; -- 20 mm
    mmLessThan : Int -> Descriptor Size ; -- <20mm

    -- Normal, Abnormal,     -- Normality descriptor
    -- Parallel, Horizontal  -- Orientation descriptor


-- põrna suurus normis, struktuur ühtlane, kontrasteerumine iseärasusteta

}
