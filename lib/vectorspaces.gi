



InstallMethod(SizePGL,
"for Int, Int",
[IsInt, IsInt],
function(n, q)
	return SizeGL(n,q)/(q-1)*Gcd(n,q-1);
end);

## Unitary 


InstallMethod(SizeGU,
"for Int, Int",
[IsInt, IsInt],
function(n, q)
	return q^(n*(n-1)/2) * Product([1..n], i->q^i-(-1)^i);
end);


InstallMethod(SizePGU,
"for Int, Int",
[IsInt, IsInt],
function(n, q)
	return SizeGU(n,q)/(q+1)*Gcd(n,q+1);
end);

InstallMethod(SizeSU,
"for Int, Int",
[IsInt, IsInt],
function(n, q)
	return SizeGU(n,q)/(q+1)*Gcd(n,q+1);
end);

InstallMethod(SizePSU,
"for Int, Int",
[IsInt, IsInt],
function(n, q)
	return SizeGU(n,q)/(q+1);
end);

## Symplectic 


InstallMethod(SizePGSp,
"for Int, Int",
[IsInt, IsInt],
function(n, q)
	return q^(n^2)*Product([1..n],i->q^(2*i)-1);
end);

InstallMethod(SizeSp,
"for Int, Int",
[IsInt, IsInt],
function(n, q)
	return SizePGSp(n,q);
end);

InstallMethod(SizePSp,
"for Int, Int",
[IsInt, IsInt],
function(n, q)
	return SizePGSp(n,q)/Gcd(n,q-1);
end);
