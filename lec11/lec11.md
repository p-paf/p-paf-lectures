### Solving the hardest problem
> There are only two hard things in Computer Science: cache invalidation and naming things. - Phil Karlton

Naming variables is hard, there are many guides, techinques and conventions to make it easier. Read one [here](https://hackernoon.com/the-art-of-naming-variables-52f44de00aad) and [here](https://blog.usejournal.com/naming-your-variables-f9477ba002e9). As with all hyperbole there is some degree of truth.

Take the following snippet of code for instance
```
function get(applepen) {
    pen = [];
    for (pineapple in applepen) {
        apple = pineapple[0];
        if (apple == 4) {
            pen.add(apple)
        }
    }

    return pen;
}
```

We'll try to make it better by applying a few techniques from functional programming.

```
function get(theList) {
    myList = [];
    for (value in myList) {
        if (value[0] == 42) {
            myList.add(value)
        }
    }

    return pen;
}
```

### Eta reduction
It derives from the principle of extensionality, which says that if two functions for the same inputs give the same outputs they must be the same. A simple example, `f (x) = N (x) => f = N`

```Haskell
add4 x = 4 + x
add4 x = (4 +) x
add4 = (4 +)
```

### Lambda notation
When you can avoid naming variables, why not functions. Lambda notation allows you to define a function without naming it. However this means that since you cannot refer to the function by name you can use it only in the context where it is defined. Let's take the function bliss from the previous lecture.

```Haskell
-- takes two Ints and ignores the second, returns the first
-- Note how this is actually curried.
bliss :: Int -> Int -> Int
bliss x y = x
-- \x y -> x

lotOfBliss :: List[(Int, Int)] -> List[Int]
lotOfBliss = map (uncurry bliss)
```

Another poweful aspect of a the lambda function is that it can use values present in the scope of its definition. This should not seem odd when you think of it as any other function, just without a name.

### Queries with map and filter
map and filter are analogous to loops and if statements from an imperative paradigm. A map represents an iteration over all the elements while applying a given function.

The map operation is analogous to iterating over the elements of a list; applying a function of each element and then returning result of the function in a new list
```
newlist = []
for element in list:
    newelement = operateon(element)
    newlist.add(newelement)
return newlist

newlist = map operateon list
```

The filter operation is analogous to iterating over the elements of a list; applying a function of each element and then returning the elements for which the function
for which the function evaluates to True in a new list
```
newlist = []
for element in list:
    if predicate(element):
        newlist.add(newelement)
return newlist

newlist = filter predicate list
```

The best part is map and filter can be composed very easily to create very interesting functions.

### Folds finally
One of the most powerful, generic operators? Maybe not today!

### References
* http://cmsc-16100.cs.uchicago.edu/2019-autumn/Lectures/02/lists.php
