#############################################################################
##  
##  PackageInfo.g for the package `P-subgroups'             												   
##														Kevin Ivan Piterman
##
##

SetPackageInfo( rec(

PackageName := "p-subgroups",

Subtitle := "Working with posets of p-subgroups of a finite group.",


Version := "1.0.0",
Date := "01/06/2024",

PackageWWWHome := "https://github.com/kpiterman/psubgroups",

SourceRepository := rec(
    Type := "git",
    URL := "https://github.com/kpiterman/psubgroups",
),
IssueTrackerURL := Concatenation( ~.SourceRepository.URL, "/issues" ),
SupportEmail := "kpiterman@dm.uba.ar",

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
    Email         := "kpiterman@dm.uba.ar",
    WWWHome       := "http://mate.dm.uba.ar/~kpiterman",
    PostalAddress := Concatenation( [
                       "Philipps-University Marburg\n",
                       "Marburg\n",
                       "Germany" ] ),
    Place         := "Marburg",
    Institution   := "Philipps-University Marburg"
  ), 
],

Status := "dev",

README_URL := 
  Concatenation( ~.PackageWWWHome, "/README.md" ),

PackageInfoURL := 
  Concatenation( ~.PackageWWWHome, "/PackageInfo.g" ),

AbstractHTML := 
  "Working with posets of p-subgroups of a finite group.",


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
    "Loading  p-subgroup package- ", ~.Version, "\n",
    "by ",
    JoinStringsWithSeparator( List( Filtered( ~.Persons, r -> r.IsAuthor ),
                                    r -> Concatenation(
        r.FirstNames, " ", r.LastName, " (", r.WWWHome, ")\n" ) ), "   " ),
    "For help, type: ?Psubgroups \n",
    "─────────────────────────────────────────────────────────────────────────────\n" ),

Autoload := false,

Keywords := ["p-subgroups", "posets", "Quillen's conjecture" ]

));

