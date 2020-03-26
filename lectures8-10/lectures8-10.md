[P-PAF](p-paf.github.io) says Haskell is a high-level, purely functional programming language with a strong static type system and elegant mathematical underpinnings.

We'll start with the story of Lucas and Shannon, and how they approached the following problem:

Does there exist a finite group G, a subnormal subgroup S of G, a real-valued irreducible 2-Brauer character X of G and a real-valued irreducible 2-Brauer character M of S such that M occurs with odd multiplicity ≥ 3 in XS?

## Lecture 8 (a) - Currying

Remember when we said everything in Haskell is a function and that functions can take functions as inputs and return functions as outputs, right?

There's something magical we've been hiding all along.

Functions in Haskell never take more than 1 input. Yes.

Consider myOp1
```
-- takes three numbers and adds them
myOp1 :: Int -> Int -> Int -> Int
myOp1 a b c = a + b + c
```

So, with that in mind, how do we explain myOp1 that seems to take three inputs?

That's because functions are [curried](https://en.wikipedia.org/wiki/Haskell_Curry).

Some things to better understand this concept:
- Functions can be used in such a way that they take in lesser arguments than the definition. (Partial Functions)
- Functions can take these functions as inputs
- Let us check the type signatures of these partial functions
- Let us play with parenthesis in these type signatures

## Lecture 8 (b) - Higher Order Functions

Consider Map.hs
```
myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = f x : myMap f xs
```

- lambdas and sections

Read [this](http://learnyouahaskell.com/higher-order-functions) and [this](https://www.cse.unsw.edu.au/~en1000/haskell/hof.html) to learn about other extremely important higher-order functions like filter, reduce, fold(r/l), etc.

Insight: the Haskell-Skill vs How-Much-You-Recurse graph.


## Lecture 9 - Laziness

We've been saying Haskell is lazy. Now let's see what this actually means. So there are two kinds of evaluation: Lazy (Non Strict) and Strict.

### Lazy (Non Strict) Evaluation:

Consider Bliss.hs
```
bliss :: Int -> Int -> Int
bliss x y = x
```

### Strict Evaluation:

Now let's look at the opposite, Strict Evaluation, for example in Python. 
Consider update_map(fire_gun(shotgun G), decrement_bullet_count(shotgun G)).

### Purity Follows Laziness:

Usually, languages with side effects follow Strict evaluation. Can you guess why?

Reason: One major thing with lazy evaluation is that there's no easy way to look at a program and tell when things will be evaluated. It is only when something is needed (more on this later) that it is evaluated. If we don't know when something will be evaluated, it can't be used to do the following, for example:

- modify global variables
- change things in files or networks
- printing on the screen

These kinds of things are called "side effects", and they are very difficult to think about for lazy languages. Haskell was defined to be Lazy, and is, consequently, pure. We however want some side effects in a manner that doesn't affect the essential purity of the language. This will be solved by the IO monad (more in subsequent lectures).

### Thunks

So, what does Haskell actually store as the second argument in Bliss?

Something called a "thunk".

### When is Something Needed?

So the bottomline is: "pattern matching drives evaluation". Here's how it works:

Consider f1 and f2:
```
f1 :: Maybe a -> [Maybe a]
f1 m = [m,m]

f2 :: Maybe a -> [a]
f2 Nothing  = []
f2 (Just x) = [x]
```

Consider TakeRepeat.hs
```
myRepeat :: a -> [a]
myRepeat x = x : myRepeat x

myTake :: Int -> [a] -> [a]
myTake n _      | n <= 0 =  []
myTake _ []              =  []
myTake n (x:xs)          =  x : myTake (n-1) xs
```

### Lazy Features in Other Languages

Python/C/others have also incorporated a lot of lazy features. This is because in a lot of cases, laziness is the most natural thing, and in others it's required. Can you name them?

### So if laziness is all cool, then ...

No it isn't. A downside of laziness is large, unevaluated thunks.

Consider BadAdd.hs
```
-- tail recursive
badLazyAddList :: Num a => [a] -> a
badLazyAddList = go 0
  where go acc []     = acc
        go acc (x:xs) = go (x + acc) xs
```

Garbage Collection, and a story from the Programmers of the 90s.

## Lecture 10 - Game Trees and Minimax

How do you ensure you never lose at Tic-Tac-Toe?

Is your approach recursive?

Look at:
- How a game state is implemented, both in Haskell and Python
- How Game Trees are built
- How a utility function helps us identify winning states
- The Minimax Algorithm 

Read about [Game Trees](https://www.cs.cmu.edu/~adamchik/15-121/lectures/Game%20Trees/Game%20Trees.html) and [Minimax](https://www.cs.cornell.edu/courses/cs312/2002sp/lectures/rec21.htm) in detail. You will be implementing them for the term project.

## Announcements

- Reading Material
- Assignment 2
- Term Project













