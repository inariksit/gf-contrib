abstract Radiology = {

flags startcat = Statement ;

  cat
    Statement ;
    Description ;

    Organ ;
    DualOrgan ;

    Property ;

    Descriptor ;
    Describes Descriptor Property ; -- proof objects

  data
    Pred,
    PredAdv : Organ -> Description -> Statement ;

    DescribePos,
    DescribeNeg : (d : Descriptor) -> (p : Property) -> Describes d p -> Description ;

    Desc2 : Description -> Description -> Description ;
    Desc3 : Description -> Description -> Description -> Description ;

    -- To make text more natural; transfer rules in Haskell
    AggregateProperty2Pos,
    AggregateProperty2Neg : (d : Descriptor) -> (p1, p2 : Property)
                          -> Describes d p1
                          -> Describes d p2
                          -> Description ; -- size and location are normal / normaalse suuruse ja asetusega

    --AggregateDescriptor2 : Property -> Descriptor -> Descriptor -> Description ; -- location is normal and lateral

    Both,
    Left,
    Right : DualOrgan -> Organ ;

    Heart,
    Spleen : Organ ;

    Ovary,
    Kidney : DualOrgan ;

    Size,
    Location : Property ;

    Lateral,
    External : Descriptor ; -- Location descriptors

    Small,
    Widened,
    Microscopic : Descriptor ; -- Size descriptors
    mm,                              -- 20 mm
    mmLessThan : Int -> Descriptor ; -- <20mm

    Normal, Abnormal : Descriptor ; -- Can be any descriptor
    -- Parallel, Horizontal : Descriptor  -- Orientation descriptor

    -- Proof objects
    Small_Size : Describes Small Size ;
    Widened_Size : Describes Widened Size ;
    Microscopic_Size : Describes Microscopic Size ;
    Normal_Size : Describes Normal Size ;
    Abnormal_Size : Describes Abnormal Size ;
    Lateral_Location : Describes Lateral Location ;
    External_Location : Describes External Location ;
    Normal_Location : Describes Normal Location ;
    Abnormal_Location : Describes Abnormal Location ;
    mm_Size : Describes (mm 20) Size ;
    mm_lessThan_Size : Describes (mmLessThan 20) Size ;


-- põrna suurus normis, struktuur ühtlane, kontrasteerumine iseärasusteta
-- mõlemad neerud normaalse suuruse ja asetusega

}
