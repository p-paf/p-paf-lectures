## Big brain time

Find the sum of all even fibonacci numbers less 4,000,000. There are few restrictions,  
1. You don't have variables
2. You have algebraic expressions, go crazy
3. You can assume simple arithmetic, boolean and comparison operators to be defined

Hint: Throw away you computer, take a notebook instead

## Introducing to Haskell  
Functions and Types collectively encompass almost all of FP concepts. We'll begin with "fun"ctions. You can think of Haskell functions as algebraic expression with labels. Conventionally functions definition is preceded by a functional declaration, a statement the declares the type of the function.  

```Haskell
f :: X -> Y  -- is the declaration of a function in Haskell
-- `f` is the name of the function  
-- `X` is the type of the first argument  
-- `Y` is the type of the output  
-- `X -> Y` is the type of function `f`

g :: Z  -- trivial function
-- `Z` is the output and the type of function `g`
```

A function can have multiple arguments as well. A function can return another function as well.
```Haskell
f :: I -> L -> F -> P
g :: Y -> U -> (H -> C)
```
For now we can safely consider `f` to be a function that takes 3 inputs of types `I`, `L`, `F` respectively and returns an output of type `P`. Later when we learn currying we will call `f` a function that returns a function.

Some examples with concrete types,
```Haskell
lite :: Student -> Bool
course :: String -> (Student -> Char)
course_gpa :: (Student -> Char) -> Int
```
Function declarations are like comments about what the function does. The compiler interprets it as a contract and enforces the constraints, pointing out errors if any. We will go through a few examples in the code along section.

## Giving context to a function
Let's start with a simple function, the addition operator `+`.
```Haskell
2 + 3
2.0 + 3
2.0 + 3.0
(+) 2 3
```
The Prelude has this really helpful operator called `:info func_name`. Let's apply it to `+` and understand the results.
```Haskell
:info +
class Num a where
  (+) :: a -> a -> a
  ...
  	-- Defined in ‘GHC.Num’
infixl 6 +
```
The last line of the output can be interpreted as,  
`infix` says that we will place the operator between the two arguments to use it.  
`_____l` implies that the operator is left associative.  
`______ 6` refers to the how order of precedence, the higher the better.  

The output gives us a lot of useful information. A class called `Num` exists and any instance of `Num` must implement `+`. We can quickly verify that `2`, `2.0` are indeed instances of `Num` by typing `:type 2` and `:type 2.0`, or can we?

So when you create a function that expects the arguments to obey certain rules, you need to give context to the function declaration. We'll see when this becomes useful in the code along examples.
```Haskell
add_9000 :: Int -> Int -> Int
add_9000 :: Num a => a -> a -> a
```

## Associativity and precedence
Associativity indicates the order of evaluation of arguments to an expression. This is especially important for infix operators. It answers the question,
> Should I evaluate the left expression or the right expression before applying the operator?

Precedence indicates which operator in an expression will be applied first. It answers the question,
> Among the given operators which one should I compute first?

## Functions are mappings?!

In FP functions behave more like mappings between the values of two types. Let's take
```Haskell
mulWith2 :: Int -> Int
mulWith2 = (2*)
```
This defines a mapping from the domain of Ints to a range of Ints. If we had enough space,
we could have defined the function as a table of values,
| x | mulWith2 x|
|--|--|
| 0 | 0 |
| 1 | 2 |
| 2 | 4 |
| 4 | 8 |
| ..| ..|

We can reason that given the same set of arguments a function/mapping will always return the same value.

## Composing functions together
Haskell derives a lot of concepts from lambda calculus, which is a branch of mathematics. As a result it thinks of chainging function application in an interesting way. Suppose we have two functions,
```Haskell
f :: Y -> Z
g :: X -> Y
```
Since the range of `g` is the domain of `f` we can compose the two functions together to create a new function,
```Haskell
(f . g) :: X -> Z
```
Function composition is read from right to left. You might notice that function composition will not be easy with functions that have multiple arguments, however we will deal with that later.

### Food for thought
1. Why do function declarations throw an error in interpreter mode?
2. Prelude is a program write Haskell code in an interactive manner, similar to a REPL from other languages like R and Python. Is Haskell a compiled or interpreted language?
3. Why does `+` operator work for `2.0 + 3.0`?
