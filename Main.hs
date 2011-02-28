module Main where


import Commands


type State = [(Zahlen,Int)]

state::State
state = [(1,2),(2,3),(3,4),(4,5),(5,1)]





exec::Command->State->State
exec comm@(	Skip				) s = s
exec comm@(	Assign 	v	e		) s = updateState s v (eval e s)
exec comm@(	Composition 		c1 c2	) s = let s' = exec c1 s in exec c2 s'
exec comm@(	IF 		b	c1 c2	) s = if (eval b s)==0) then exec c1 s else exec c2 s
exec comm@(	While	t	b	c	) s = if (eval b s)==0) then s else exec comm (exec c s)
	

updateState f v e = f
updateState s v e = \y -> if(y==v)then e else s y

		

eval::ExpInt->State->Int
eval (Cons 	z	) s = z
eval (Var	c	) s = s c
eval (Neg 	e	) s = -1 * (eval e s)
eval (Plus 	e1 e2	) s = (eval e1 s) + (eval e2 s)
-- eval (Sub 	e1 e2	) s = (eval e1 s) - (eval e2 s)
-- eval (Mul 	e1 e2	) s = (eval e1 s) * (eval e2 s)
-- eval (Div 	e1 e2	) s = div (eval e1 s) (eval e2 s) -- tratar erro de 0
-- eval (Mod 	e1 e2	) s = mod (eval e1 s) (eval e2 s)


foo::Int->Int->Int
foo a b = a*b