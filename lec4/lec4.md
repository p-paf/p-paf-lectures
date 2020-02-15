## Let's not figure out Prelude
Go to your command prompt and enter `ghci` this opens up the interactive Glasgow Haskell Compiler environment. It opens a program that interprets Haskell code and evaluates it (generally haskell is used a compiled language). This environment imports standard libraries and Prelude which define many common functions that are useful for us, allows us to import modules and write interpreted code to quickly test ideas. You can read more about the GHCi from links in the reference section.

## Trying out basic operations
The compiler defines a few core operations and types everythign else is imported from standard libraries. Let's check out some some simple operations.

Some defined types
```Haskell
5
4.0
False
[]
'z'
"Hot Chocolate"
```
Arithmetic operators
```Haskell
2 + 3
2.0 / 3.0
9 - 6
8 ^ 8
5 `mod` 3
```

Comparators
```Haskell
2 < 3
'a' == 'b'
'c' < 'd'
False == True
"Bread" /= "Omelet"
```

## Defining a function
From here on we will be referring expressions as functions but they are still truly expressions in essence.

```Haskell
one = 1
satvikGo'lecha = "How the dutch call Satvik"
orderOrder order = if order > 10 then "No more" else "Yes please"
```


## A little bit on types
Everything is a function in Haskell. As mentioned before a function consists of its name, its type and definition.

```Haskell
1 :: Integer
1 :: Double
1 + 2.0
1 :: Integer + 2.0
```

Running the above commands you'll realize that 1 is actually an expression when interpreted as an integer it evaluates to the value 1. When interpreted as a double it is evaluates to the decimal value 1.0. Example taken with permission from [link](http://cmsc-16100.cs.uchicago.edu/2019-autumn/Lectures/01/intro.php).

## Note
To learn more `:info` and `:type` are your best friends.

## A mosaic of functions

Pattern matching is a way to define a function based on the input expression. As mentioned previously that pure functions are mapping from domain to range. Pattern matching reinforces this idea by allowing you to directly define the output value for a given input pattern. An example is show below.

```Haskell
grades :: Char -> String
grades 'A' = "Very good"
grades 'B' = "OK"
grades 'E' = "Special mention"
grades _ = "Not worth mentioning"
```

* What happens if the definition for `grades _` is put before `grades 'E'`?
* How is this different from creating a definition for `grades a`?

There is one other way to express conditions in a function. It is illustrated with the use of guards.
```Haskell
gradeLetter :: Int -> Char
gradeLetter percentile =
    | percentile > 90 = 'A'
    | percentile > 70 = 'B'
    | percentile == 42 = 'E'
    | otherwise = 'F'
```

Let's take a teacher who marks students the length of their name,
```Haskell
gradeLetter :: String -> Char
gradeLetter name =
    | percentile > 90 = 'A'
    | percentile > 70 = 'B'
    | percentile == 42 = 'E'
    | otherwise = 'F'
    where percentile = length name * 10
```
The where clause allows us to write the percentile logic outside the actual grading logic. It makes for more readable functions. The alternative to where is the let clause which you explore on the Haskell wiki.


## Introduction to Lists
Lists are very important in fp. It is primarily how you want to interpret/store/transform data. A list is made of just two expressions.

```Haskell
empty = []
append elem list = elem : list

-- Construct lists with
[0, 1, 2, 3]
["shaken","not","stirred"]
'l':'e':'m':'o':'n':[]
```

This recursive definition allows much more complex operations to build on top of the list. Some basic functions are,

```
head
tail
last
init
```

* Find out what they do?

One of the most common operation on a list is one to retrieve an element at a particular index. In haskell, this is done using the `!!` operator.
* Why is the `!!` operator unsafe?

We'll be learning more about lists and tinkering with them by solving a few of the 99 Haskell problems.

## References
1. https://wiki.haskell.org/Let_vs._Where
2. https://wiki.haskell.org/H-99:_Ninety-Nine_Haskell_Problems
3. http://learnyouahaskell.com/syntax-in-functions
4. https://wiki.haskell.org/GHC/GHCi
5. http://cmsc-16100.cs.uchicago.edu/2019-autumn/Lectures/01/intro.php
