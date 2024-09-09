#############################################################################
##  
##  PackageInfo.g for the package `From Algebraic Structures To Posets And Simplicial Complexes'             												   
##														Kevin Ivan Piterman
##
##

SetPackageInfo( rec(

PackageName := "FASTPASC",

Subtitle := "Working with p-subgroup posets, decomposition posets, frame complexes, and more",


Version := "1.0.0",
Date := "01/06/2024",

PackageWWWHome := "https://github.com/kpiterman/FASTPASC",

SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/kpiterman/FASTPASC",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
SupportEmail := "kevin.piterman@vub.be",

ArchiveURL := Concatenation( ~.SourceRepository.URL,
                                 "/releases/download/v", ~.Version,
                                 "/", ~.PackageName, "-", ~.Version ),


ArchiveFormats := ".tar.gz",


Persons := [

  rec( 
    LastName      := "Piterman",
    FirstNames    := "Kevin Ivan",
    IsAuthor      := true,
    IsMaintainer  := true,
    Email         := "kevin.piterman@vub.be",
    WWWHome       := "http://mate.dm.uba.ar/~kpiterman",
    PostalAddress := Concatenation( [
                       "Pleinlaan 2, B-1050\n",
                       "VUB, Department of Mathematics and Data Science\n",
                       "Belgium" ] ),
    Place         := "Brussels",
    Institution   := "Vrije Universiteit Brussel"
  ), 
],

Status := "dev",

README_URL := 
  Concatenation( ~.PackageWWWHome, "/README.md" ),

PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

AbstractHTML := 
  "Working with p-subgroup posets, decomposition posets, frame complexes, and more",


PackageDoc := rec(
  BookName  := ~.PackageName,
  ArchiveURLSubset := ["doc"],
  HTMLStart := "doc/chap0.html",
  PDFFile   := "doc/manual.pdf",
  SixFile   := "doc/manual.six",
  LongTitle := ~.Subtitle,
),


Dependencies := rec(
  GAP := "4.8.2",

  NeededOtherPackages := [ ["HAP", ">=1.11.13"], ["SONATA", ">=2.8"], ["RDS",">=1.6"], ["Digraphs",">=0.15.0"], ["Posets", ">=1.0.1"], ],


  SuggestedOtherPackages := [],


  ExternalConditions := []),


AvailabilityTest := ReturnTrue,

BannerString := Concatenation( 
    "─────────────────────────────────────────────────────────────────────────────\n",
    "Loading  FASTPASC package- ", ~.Version, "\n",
    "by ",
    JoinStringsWithSeparator( List( Filtered( ~.Persons, r -> r.IsAuthor ),
                                    r -> Concatenation(
        r.FirstNames, " ", r.LastName, " (", r.WWWHome, ")\n" ) ), "   " ),
    "For help, type: ?FASTPASC \n",
    "─────────────────────────────────────────────────────────────────────────────\n" ),

Autoload := false,

Keywords := ["p-subgroups", "posets", "decompositions", "frame complex" ]

));

