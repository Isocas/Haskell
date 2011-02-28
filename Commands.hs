module Commands where


import Expressions

data Command	= Skip
		| Attrib 	ExpInt	ExpInt -- criar tipo de variaveis
		| Composition 		Command Command
		| IF 		ExpInt	Command Command
		| WHILE	Inv	ExpInt	Command
 deriving Show

type Inv = String