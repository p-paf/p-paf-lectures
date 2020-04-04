## Lecture 13: Types, Tuples, and Ted (Doubts and Assignment 2 Discussion)

Here are the solutions for Assignment 2:

S1. 

`(a)` Quicksort's correctness can be established recursively. Start with a proposition: 

```
P(n) = "Quicksort correctly sorts every input array of length n."
```

and derive `P(n)` from `P(1)` to `P(n-1)`.

`(b)` Here's QuickSort in Haskell:

```
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (p:paf) =
  let smallerSorted = quicksort [a | a <- paf, a <= p]
      biggerSorted = quicksort [a | a <- paf, a > p]
  in  smallerSorted ++ [p] ++ biggerSorted
```

S2. Refer [this](https://algorithmist.com/wiki/Coin_change) for the solution.

S3. Because in Haskell, type inference precedes evaluation (unlike Python).

S4. Fixed precision integers have a size limit of 2^63-1.

S5. Lazy evaluation.

S6. Because then how would the compiler differentiate between them and parenthesis for precedence.

This is where we stopped to discuss tuples and their use. If you're unsure, read up more on Tuples in Haskell.

S7. Because evaluation is lazy, type checking isn't.

S8. Right, Left 

S9. This question was technically poor. What the question meant was this: "Give an example of parametric types (that support polymorphism), and multiple types that are instances of the same typeclass (or contract), thereby allowing for the same operator to work on them all (like overloaded functions). And any correct example works.

S10. In Haskell `if` is an expression (which is converted to a value) and not a statement (which is executed) as in many imperative languages. As a consequence, the `else` is mandatory in Haskell. Since `if` is an expression, it must evaluate to a result whether the condition is `True` or `False`, and the `else` ensures this.

This is when we discussed the [dangling else problem](https://en.wikipedia.org/wiki/Dangling_else).

S11. `map (^2) [1..10]`

S12. (^2) = \z -> z ^ 2

S13. Direct question from the lectures. Referential transparency is a very difficult and scary name. It's [nothing](https://en.wikipedia.org/wiki/Referential_transparency).

S14. Something like this works:

```
data Location = Coord Int Int
data Direction = Up | Down | Left | Right

move1Unit :: Location -> Direction -> Location
```

S15. It's the possibility of having a dream come `True` that makes life interesting. Go watch HIMYM to actually meet Ted.

![Himym](https://images-na.ssl-images-amazon.com/images/G/01/digital/video/hero/TVSeries/HowIMetYourMother_6647600-HOWIMET._V392937824_SX1080_.jpg)




