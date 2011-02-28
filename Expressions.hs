module Expressions where
	

{--
Bool {True,False}
Char {'a','b','c','d',..}
Int {1,2,3,4,5,6,7,8,...}
Floats
--}
{--
type Relacao = (Int,Int)	
	
data Arvore = Folha | Ramo (Arvore, Arvore)

data Nat = Zero | Succ Nat
	deriving Show
	
f::Nat->Int
f(Zero) = 0
f(Succ x) = 1 + f(x)

g::Int->Nat
g(0) = Zero
g(n) = (Succ (g(n-1)))


lolada = f(Succ(Succ(Succ Zero)))
--}	
type Zahlen = Int

-- rever exp binarias, unarias constantes etc
data ExpInt		= Cons	String
			| Var 	String
			| Neg 	ExpInt
			| Plus 	ExpInt ExpInt
	deriving Show


-- 3
e1 = Cons 3
-- 4
e2 = Cons 4
-- 3 + 5
e3 = Plus (Cons 3) (Cons 5)
-- 3 - 5
-- e4 = Sub (Cons 3) (Cons 5)
-- ( 3 + 5 ) * 2
-- e5 = Mul (Plus (Cons 3) (Cons 5)) (Cons 2)
-- (  )
-- e6 = Mul (Plus (Cons 3) (Cons 5)) (Cons 2)
-- --
-- e7 = Mul (Plus (Cons 3) (Cons 5)) (Cons 2)
--
-- e8 = Mul (Plus (Cons 3) (Cons 5)) (Cons 2)
--
-- e9 = Mul (Plus (Cons 3) (Cons 5)) (Cons 2)
