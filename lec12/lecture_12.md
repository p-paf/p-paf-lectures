## Hello, world! and IO

We have been doing Haskell for over a month. Now we're ready to tackle this:

```
putStrLn "Hello, world!"
```

So, this is how simple IO is in Haskell.

Spoiler: isn't (:t)

IO is a polymorphic Monad. But don't let that intimidate you, because there's enough without it already.

Here's an interesting convo. True Story.

![Aslan from Narnia](https://buildfaith.org/wp-content/uploads/2015/04/Aslan-Lion-Witch-Wardrobe-1280x720.jpg)

`Human`: You gave me Haskell to code. Haskell is pure.

`Aslan`: So?

`Human`: So I can't do impure things in here.

`Aslan`: Like?

`Human`: Like printing, reading from input, etc..

`Aslan`: Why do you want all this? Isn't tail recursion enough for you, greedy human?

`Human`: No. 

`Aslan`: I can't take back my words, but I'll give you an option - you can go to IO.

`Human`: What's IO?

`Aslan`: Let there be IO.

```
data IO a = IO (  Universe    ->    (Universe,a) )                                
```
`Human`: Thanks, Aslan! You're the best.

`Aslan`: But beware, Human. Once you're impure, you're impure for life. There's no going back.

`Human`: What does that mean?

`Aslan`: Time will tell.

-------

PS-1: here `a` stands for any type.

PS-2: Time is a metaphor. 

PS-3: (understanding this is super important)

A value of type `IO String` is a description of some computation for generating a `String`. There is no `String` “inside” an `IO String`, any more than there is a cake “inside” a cake recipe, or a list of files "inside" the `ls -l` command. To produce a `String` (or a delicious cake) requires actually executing the computation (or recipe). And the only way to do that is to give it to the Haskell runtime system, via `main`. This (computation) is usually done as part of an even larger computation, using `do`.

This should get clearer with examples.

---------------------------------------------------------

## Competitive Programming

It's good for getting a **job**. 

Let's target [this](https://codeforces.com/contest/1327/problem/A).

Steps to solve: 

```
1. IO
2. Algorithm
3. Write Code
4. Submit
5. If AC (green), goto 6 else goto 7.
6. Enjoi
7. Fix Code. Goto 4.
```

We'll solve it from scratch in the class, and you can check our [final code]()!

There are going to be a LOT of things under the hood that we won't go into the details of for now, like bind, do, etc. Within the next few lectures we'll cover them in much greater depth.



First, consider [heisenberg.hs]()
```
main :: IO ()
main = do
    putStrLn "Say My Name"
    name <- getLine
    let name_str = read name :: String
    if name == "heisenberg"
        then putStrLn "You're god damn right."
        else main
```

![walt](https://geeksofdoom.com/GoD/img/2013/09/Xqqni.jpg)



I'd encourage you to try out some more problems on CF for practice. In both Haskell and Python.


------------------------

## A bit on Functors:

Functors are things that can be mapped over. Check it's `:info` and `:type`. **IO** is a functor. So are **lists**.

> FAQ: Will you tell me one more Functor please?

> Maybe.


-------------------------

## Homework:

- Do problems **31 to 36** from [99 Problems in Haskell](https://wiki.haskell.org/99_questions/31_to_41).

- The last instance of 99 Problems was an evaluative assignment, and 7 students submitted.

- This one is non-evaluative. But you have to still submit your code [here](https://github.com/p-paf/99problems) as a new directory with name "myname_2".

- It's a nice pedagogical experiment. Would students do a non-evaluative homework with as much seriousness as an evaluative assignment in a non-graded course? We'll see.

------------------


## Assignment 2 Discussion

If you have any doubts feel free to discuss.
