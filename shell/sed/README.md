# sed! Stream Editor!

toppings.txt originally:

```
Pizza topping combos:
1. Spinach, Pepperoni, Pineapple
2. Pepperoni, Pineapple, Mushrooms
3. Bacon, Banana Peppers, Pineapple
4. Cheese, Pineapple
```

`sed 's/Pineapple/Feta/' toppings.txt` outputs:

```
Pizza topping combos:
1. Spinach, Pepperoni, Feta
2. Pepperoni, Feta, Mushrooms
3. Bacon, Banana Peppers, Feta
4. Cheese, Feta
```

and does _not_ edit the file. The `-i` flag edits in place!

Characters other than the `/` work, usually you'll see `/` as the delimeter, (sp?) but if you're trying to replace a string with a forward slash, it's easier to use a different delimeter, like `|`, `.`, ` ` ... so like if you're editing a list of paths. `sed 's./etc..' paths.txt`

If you don't have anything after the second delimeter, it removes things: `sed 's/Pineapple//' toppings.txt`

Mmkay, except there are like a dozen options other than the `s` for substitution, you can print lines, delete lines, do all sorts of wild and crazy stuff, let's see ...

What! The video did _not_ mention that it only substitutes the first instance on a line! You can add a `g` flag after the last delimeter for global!

`i` or `I` is case-insensitivity ... `w` and then a filename writes to that filename if a substitution is made ...

Okay so `\S` for non whitespace and `\s` for whitespace characters works: `sed 's/\s/moo/g' toppings.txt`

And I think the exercise is to output everything in an input up to a blank line that can have whitespace and have just two newlines at the end of the output, so ...

Interesting, the `q` command takes a line address, so maybe if I get the line, then the quit at that line, and one more round to trim any whitespace.
