#! @Chapter Decompositions of posets and matroids

DeclareOperation("IsFinerSetOfSubsetsPoset", [IsPoset, IsObject, IsObject]);

DeclareOperation("IsFinerSets", [IsList, IsList]);

DeclareOperation("RefinementOrdering", [IsPoset]);

DeclareOperation("IsDecomposition", [IsPoset, IsList]);

DeclareOperation("DecompositionsOfPoset", [IsPoset]);

DeclareOperation("DecompositionsOfMatroid", [IsPoset]);

DeclareOperation("DecompositionPoset", [IsPoset]);

DeclareOperation("DOfMatroidPoset", [IsPoset]);

DeclareOperation("PDOfPoset", [IsPoset]);

DeclareOperation("PDOfMatroid", [IsPoset]);

DeclareOperation("PDPoset", [IsPoset]);

DeclareOperation("PDMatroidPoset", [IsPoset]);

DeclareOperation("PartialFramesOfPoset", [IsPoset, IsInt]);

DeclareOperation("FrameComplexOfPoset", [IsPoset]);

DeclareOperation("EulerDecompositions", [IsPoset]);

DeclareOperation("EulerFrames", [IsPoset]);

DeclareOperation("HeightD", [IsPoset, IsObject]);

DeclareOperation("HeightPD", [IsPoset, IsObject]);

