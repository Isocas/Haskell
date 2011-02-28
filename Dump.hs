






{--
f:Z --> Z
  x |-> f(x)
--}

duplica::Int->Int
duplica(x) = 2*x


f::(Int,Int)->Int
f(x,y) = x*y


f::(Int,Int)->Int
f(x,y) = x*y

fact::Int->Int
fact(0) = 1
fact(x) = x*fact(x-1)






















{--
aux(lookup z s)
	where 	aux(Nothing)	= 0
		aux(Just x)	= x
		
--}