## Types and Classes in Haskell
Haskell allows users to define their own types with the `type`, `data` and `newtype` syntax. Each has a different use but fundamentally they are creating a representation of a new datatype.

## Type
Consider the `type` keyword which allows you to create an alias for a type.

```Haskell
type Pos = (Int, Int)

move :: Pos -> Pos -> Pos
move start offset = (fst start + fst offset, snd start + snd offset)
move' (x, y) (a, b) = (x + a, y + b)
move' (1, 2) (4, 3)
```

The construct even allows parametric types. This is useful when you want differentiate between two construct of different types. For example suppose we are measuring points using an instrument that can add small amounts of error to the values.

```Haskell
type Pos = (Double, Double)
type Pos a = (a, a)

smooth :: Pos Double -> Pos Int
smooth (x, y) = (floor(x), floor(y))
smooth (1.23, 3.005)
```

There is however a fundamental limitation of types, it does not allows recursive definitions. Apply substitution to rule to find out why the following does not work.

```Haskell
type Tree = (Int, [Tree])
(Int, [Tree])
(Int, [(Int, [Tree])])
(Int, [(Int, [(Int, [Tree])])])
-- and so on... substitutions never terminates
```

## Data
`data` is a more powerful construct which allows us to create new types (not aliases, but actually new types). The most straight forward application is to define recursive types, but there are other other uses as well.

```Haskell
data Tree = Empty | Branch (Int, [Tree])
if (True) then Empty else Branch (1, [Empty])
data Bool = True | False
if (True) then Empty else Branch (1, [Empty])
```

By redefining `Bool`, I want to show that the data type itself does not hold any functionality, it only constructs the type. All the associated logic must be defined as functions.

```Haskell
negate :: Bool -> Bool
negate True = False
negate False = True
```

Similar to types, data also supports parameters and allows you to construct **not parametric types** but parametric type constructors. Take a look at the following.

```Haskell
data Request a b = Response a | Error b
:t Error 404
:t Request "HTTP 200"
```
This is a very powerful construct that allows us to relate disparate data constructors.

## Solving problem 7
1. Why can't problem 7 be solved without a new class?
2. Is there a partial solution that exists?
3. What does the new data type really offer?
