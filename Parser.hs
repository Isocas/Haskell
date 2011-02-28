module Parser where

import Char
import Expressions
import Commands

main = do{
	s <- readFile "prog";
	putStr s
}

normaliza = filter (\y -> not(isSpace y))


{--
detectAssign [] = []
detectAssign l = w:(detectAssign txt)
	where (w,txt) = split ';' l
--}
{--
buildExpression::String->ExpInt
buildExpression e = buildPlus e

buildPlus e =	case detectPlus e of
			Just
--}

	
myGo [] _ 	= True
myGo (h:t) l	| elem h l	= False
		| otherwise 	= myGo t l

buildProgram::String->Command
buildProgram p = buildComp p
{-- --}
buildComp p = 	case detectComp p of
			Just(c1,c2)	-> (Composition (buildProgram c1) (buildProgram c2))
			Nothing		-> buildIf p
detectComp str = let (c1,c2) = split ';' str;
		 in if((c1/=[])&&(c2/=[])) then Just(c1,c2) else Nothing

{-- --}
buildIf p =	case detectIf p of
			Just(b,c1,c2) 	-> (IF (Cons 0) (buildProgram c1) (buildProgram c2))
			Nothing 	-> buildWhile p
			
detectIf str = 		let 	(b,cs) = split '?' str; (c1,c2) = split ':' cs;
				rstrict = "=;#"
			in if((b/=[])&&(c1/=[])&&(c2/=[])&&(myGo rstrict b)) then Just(b,c1,c2) else Nothing

{-- --}
buildWhile p =	case detectWhile p of
			Just(b,c) 	-> (WHILE "theta" (Cons 0) (buildProgram c))
			Nothing		-> buildAssign p
detectWhile str = 	let 	(b,c) = split '#' str
				rstrict = "=;?"
			in if((b/=[])&&(c/=[])&&(myGo rstrict b)) then Just(b,c) else Nothing

{-- --}			
buildAssign p = case detectAttrib p of
			Just(v,e)	-> (Attrib (Var v) (Cons 0))
			Nothing		-> buildSkip p
detectAttrib str = 	let 	(v,e) = split '=' str;
				rstrict = ";?#"
			in if((v/=[])&&(e/=[])&&(myGo rstrict v)) then Just(v,e) else Nothing

{-- --}
buildSkip p = 	case detectSkip p of
			Just(s)		-> (Skip)
			Nothing		-> error "WTF"
detectSkip str	| str == "skip" = Just(str)
		| otherwise 	= Nothing
		














split c [] 		= ([],[])
split c (h:t) 	| h==c	= ([],t)
		| True	= (h:a,b)
	where (a,b) = split c t