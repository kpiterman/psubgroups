#! @Chapter Useful functions for finite posets


DeclareOperation("FixedPointsGrp", [IsPoset, IsGroup and IsFinite]);

DeclareOperation("FixedPointsElm", [IsPoset, IsObject]);

DeclareOperation("ReducedEulerCharPoset", [IsPoset]);

DeclareOperation("HeightPoset", [IsPoset]);

DeclareOperation("HeightElement", [IsPoset, IsObject]);

DeclareOperation("IsContractiblePoset", [IsPoset]);

DeclareOperation("JoinElements", [IsPoset, IsList]);

DeclareOperation("JoinElementsIsMax", [IsPoset, IsList]);

DeclareOperation("MeetElements", [IsPoset, IsList]);

DeclareOperation("MeetElementsIsMin", [IsPoset, IsList]);

DeclareOperation("AddMaximumPoset", [IsPoset, IsObject]);

DeclareOperation("AddMinimumPoset", [IsPoset, IsObject]);

DeclareOperation("Antichains", [IsPoset, IsInt]);

DeclareOperation("IsAntichain", [IsPoset, IsList]);

DeclareOperation("IsComplemented", [IsPoset, IsObject]);

DeclareOperation("ComplementsPoset", [IsPoset, IsObject]);


