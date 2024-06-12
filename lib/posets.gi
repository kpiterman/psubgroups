SetHeights := function(P)
	local i, k, x, gradings;
	if not IsBound(P!.heights) then
		P!.heights:=List([1..Size(P)], i->-1);
	fi;
	
	if IsBound(P!.Grading) then
		gradings:=Unique(List(Set(P), x->P!.Grading(x)));
		Sort(gradings);
		for i in [1..Size(P)] do
			x:=Set(P)[i];
			k:=Position(Set(P),x);
			P!.heights[k]:=Position(gradings, P!.Grading(x))-1;
		od;
	else
		for x in Set(P) do
			Height(P, x);;
		od;
	fi;
end;

#######

InstallMethod(FixedPointsGrp,
"for Poset, Group",
[IsPoset, IsGroup and IsFinite],
function(P, G)
	local sP, genG;
	sP := Set(P);
	if ForAll(sP, IsGroup) then
		genG := GeneratorsOfGroup(G);
		return SubPoset(P, Filtered(sP, S-> ForAll(genG, x->IsSubset(S, GeneratorsOfGroup(S^x)))));
	fi;
	Print("Elements of P must be groups.\n");
	return fail;
end);


InstallMethod(FixedPointsElm,
"for Poset, element",
[IsPoset, IsObject],
function(P, x)
	local sP;
	sP := Set(P);
	return SubPoset(P, Filtered(sP, S-> IsSubset(S, GeneratorsOfGroup(S^x))));
end);


InstallMethod(ReducedEulerCharPoset,
"for Poset",
[IsPoset],
function(P)
	if Size(Set(P)) = 0 then
		return -1;
	fi;
	return EulerCharacteristic(P)-1;
end);

InstallMethod(HeightPoset,
"for Poset",
[IsPoset],
function(P)
	if Size(P) = 0 then
		return -1;
	fi;
	return Height(P);
end);


InstallMethod(HeightElement,
"for Poset, element",
[IsPoset, IsObject],
function(P, x)
	if not x in Set(P) then
		Error("x must be an element of P");
	fi;
	return HeightPoset(SubPoset(P,ElementsBelow(P,x)));
end);


InstallMethod(IsContractiblePoset,
"for Poset",
[IsPoset],
function(P)
    local K, n0, pi1, CP;
    if Size(P) = 0 then
        return false;
    fi;
    CP := Core(P);
    if Size(CP) = 1 then
        return true;
    fi;
    K := OrderComplex(CP);
    n0 := PathComponentOfSimplicialComplex(K,0);
    if n0 = 1 and Size(Homology(K,1)) = 0 then
       pi1 := FundamentalGroup(K);
       if Size(pi1) = 1 then
            return Sum([2..Dimension(K)],i->Size(Homology(K,i))) = 0;
       fi;
    fi;
    return false;
end);;


InstallMethod(JoinElements,
"for Poset, List",
[IsPoset, IsList],
function(P, L)
	local up, min, hs;
    if Size(L) = 0 then
		return MinimumPoset(P);
    fi;
    hs:=Maximum(List(L,x->Height(P,x)));
    up:=SubPoset(P,Filtered(Set(P), x->Height(P,x)>=hs and ForAll(L,y->Ordering(P)(x,y))));
    min:=MinimalElements(up);
    if Size(min) = 1 then
        return min[1];
    fi;
    return fail;
end);;

InstallMethod(JoinElementsIsMax,
"for Poset, List",
[IsPoset, IsList],
function(P, L)
    # returns true if the join of L is the unique maximal element of P
    # this function requires P to have a unique maximal element
    local up, min, hs, x;
	#if MaximumPoset(P) = fail then
	#	Print("P must have a unique maximal element.");
	#	return fail;
	#fi;
    if Size(L) = 0 then
        return MinimumPoset(P);
    fi;
    hs:=Maximum(List(L,x->Height(P,x)));
    up:=0;
    for x in Set(P) do
        if Height(P,x)>=hs and ForAll(L,y->Ordering(P)(x,y)) then
            up:=up+1;
            if up>1 then
                return false;
            fi;
        fi;
    od;
    return Size(up)=1;
end);;

InstallMethod(MeetElements,
"for Poset, List",
[IsPoset, IsList],
function(P, L)
	local down, max, hs;
	if Size(L) = 0 then
		return MaximumPoset(P);
    fi;
	hs:=Minimum(List(L,x->Height(P,x)));
    down:=SubPoset(P,Filtered(Set(P), x->Height(P,x)<=hs and ForAll(L,y->Ordering(P)(y,x))));
    max:=MaximalElements(down);
    if Size(max) = 1 then
        return max[1];
    fi;
    return fail;
end);;

InstallMethod(MeetElementsIsMin,
"for Poset, List",
[IsPoset, IsList],
function(P, L)
    # returns true if the meet of L is the unique minimal element of P
    # this function requires P to have a unique minimal element
    local down, max, hs, x;
	#if MinimumPoset(P) = fail then
	#	Print("P must have a unique minimal element.");
	#	return fail;
	#fi;
    if Size(L) = 0 then
        return MaximumPoset(P);
    fi;
    hs:=Minimum(List(L,x->Height(P,x)));
    down:=0;
    for x in Set(P) do
        if Height(P,x)<=hs and ForAll(L,y->Ordering(P)(y,x)) then
            down:=down+1;
            if down>1 then
                return false;
            fi;
        fi;
    od;
    return Size(down)=1;
end);;

InstallMethod(AddMaximumPoset,
"for Poset, Object",
[IsPoset, IsObject],
function(P, M)
	local Q, newOrd;
    if not M in Set(P) then
        Q:=Concatenation(Set(P), [M]);	
        newOrd:=function(x,y)
            if x = M then
                return true;
            fi;
            if y = M and x <> M then
                return false;
            fi;
            if x = y and y = M then
                return true;
            fi;
            return Ordering(P)(x,y);
        end;
        return PosetByFunctionNC(Q, newOrd);
    fi;
    return fail;
end);;


InstallMethod(AddMinimumPoset,
"for Poset, Object",
[IsPoset, IsObject],
function(P, m)
	local Q, newOrd;
    if not m in Set(P) then
        Q:=Concatenation(Set(P), [m]);
        newOrd:=function(x,y)
            if y = m or x = y then
                return true;
            fi;
            if x = m and y <> m then
                return false;
            fi;
            return Ordering(P)(x,y);
        end;
        return PosetByFunctionNC(Q, newOrd);
    fi;
    return fail;
end);;

InstallMethod(Antichains,
"for Poset, Int",
[IsPoset, IsInt],
function(P, size)
	local C, V, edges, i, j, v, w, minP;
    minP:=MinimumPoset(P);
    V:=Filtered(Set(P), x-> x <> minP);;
    edges:=[];
    for i in [1..Size(V)] do
        v:=V[i];
        for j in [i+1..Size(V)] do
            w:=V[j];
            if not (Ordering(P)(v,w) or Ordering(P)(w,v)) then
                Add(edges, [i,j]);
            fi;
        od;
    od;
    C:=CliqueComplex(SimplicialComplex(edges), size-1);
    return List(C!.simplicesLst[size], s->List(s, i->V[i]));
end);;

InstallMethod(IsAntichain,
"for Poset, List",
[IsPoset, IsList],
function(P, L)
	return ForAll(L, x->ForAll(L, y->x=y or (not Ordering(P)(x,y) and not Ordering(P)(y,x) )));
end);;

InstallMethod(IsComplemented,
"for Poset, Object",
[IsPoset, IsObject],
function(P, x)
	local maxP, minP;
	if not x in Set(P) then
		Print("x must be an element of P.");
		return fail;
	fi;
	maxP := MaximumPoset(P);
	minP := MinimumPoset(P);
	if maxP = fail or minP = fail then
		Print("The poset is not bounded.");
		return fail;
	fi;
	if x = maxP or x = minP then
		return true;
	fi;
	return ForAny(Set(P), y->IsAntichain(P, [x,y]) and JoinElementsIsMax(P, [x,y]) and MeetElementsIsMin(P, [x,y]));
end);;

InstallMethod(ComplementsPoset,
"for Poset, Object",
[IsPoset, IsObject],
function(P, x)
	if not x in Set(P) then
		Print("x must be an element of P.");
		return fail;
	fi;
	if MaximumPoset(P) = fail or MinimumPoset(P) = fail then
		Print("The poset is not bounded.");
		return fail;
	fi;
	return Filtered(Set(P), y->IsAntichain(P, [x,y]) and JoinElementsIsMax(P, [x,y]) and MeetElementsIsMin(P, [x,y]));
end);;