

IsSub2:=function(A, B)
	return Order(A) >= Order(B) and ForAll(GeneratorsOfGroup(B), x->x in A);
end;;

InstallMethod(RedEulerQuillenPoset,
"for Group, Integer",
[IsGroup and IsFinite, IsInt],
function(G,p)
	if not IsPrimeInt(p) then
		Print("p must be a prime number");
		return fail;
	fi;
	if not RemInt(Order(G),p) = 0 then
		return -1;
	fi;
	return EulerCharacteristicQuillenPoset(G,p)-1;
end);

InstallMethod(ElementaryAbelianPSubgroups,
"for Group, Integer",
[IsGroup and IsFinite, IsInt],
function(G,p)
	local partialSubgroups, S;
	if not IsPrimeInt(p) then
		Print("p must be a prime number");
		return fail;
	fi;
	S:=SylowSubgroup(G,p);
	partialSubgroups:=Filtered(SubgroupsSolvableGroup(S), H->IsElementaryAbelian(H) and Order(H) > 1);
	
	return SubgroupOrbit(G, partialSubgroups);
end);

InstallMethod(ElementaryAbelianPSubgroupsBound,
"for Group, Integer, Integer",
[IsGroup and IsFinite, IsInt, IsInt],
function(G,p,r)
	local partialSubgroups, S;
	if not IsPrimeInt(p) then
		Print("p must be a prime number");
		return fail;
	fi;
	S:=SylowSubgroup(G,p);
	partialSubgroups:=Filtered(SubgroupsSolvableGroup(S), H->IsElementaryAbelian(H) and Order(H) > 1 and Order(H) <= p^r);
	
	return SubgroupOrbit(G, partialSubgroups);
end);

InstallMethod(QuillenPosetBound,
"for Group, Integer, Integer",
[IsGroup and IsFinite, IsInt, IsInt],
function(G,p,r)
	local ApG;
	if not IsPrimeInt(p) then
		Print("p must be a prime number");
		return fail;
	fi;
	ApG:=PosetByFunctionNC(ElementaryAbelianPSubgroupsBound(G,p,r), IsSub2);
	SetGrading(ApG,H-> Log(Order(H),p)-1);
	return ApG;
end);

InstallMethod(IntQuillenPoset,
"for Group, Integer",
[IsGroup and IsFinite, IsInt],
function(G,p)
	local partialSubgroups, S, orbits;
	if not IsPrimeInt(p) then
		Print("p must be a prime number");
		return fail;
	fi;
	S:=SylowSubgroup(G,p);
	partialSubgroups:=Filtered(SubgroupsSolvableGroup(S), H->IsElementaryAbelian(H) and Order(H) > 1 and Order(H) = Order(RetOmega1(G,H,p)));
	orbits:=SubgroupOrbit(G,partialSubgroups);
	return PosetByFunctionNC(orbits, IsSub2);
end);

InstallMethod(PosetOfParabolicSubgroups,
"for Group, Integer",
[IsGroup and IsFinite, IsInt],
function(G,p)
	local rad;
	if not IsPrimeInt(p) then
		Print("p must be a prime number");
		return fail;
	fi;
	rad:=Set(BoucPoset(G,p));
	return PosetByFunctionNC(List(rad, x->Normalizer(G,x)), IsSub2);
end);
