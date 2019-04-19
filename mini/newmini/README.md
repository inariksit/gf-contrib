# Example of syntactic transfer

This branch is a minimal example of semantic-preserving syntactic transfer.

I added a function called `ReflV2` into the old miniresource [abstract syntax](https://github.com/inariksit/gf-contrib/blob/ReflTransfer/mini/newmini/MiniGrammar.gf#L42):

```haskell
ComplV2   : V2  -> NP -> VP ;  -- love it  ---s
ReflV2    : V2 -> VP ;         -- see itself
```

And the [implementation](https://github.com/inariksit/gf-contrib/blob/ReflTransfer/mini/newmini/MiniGrammarEng.gf#L56-L65) is in MiniGrammarEng.

```haskell
ReflV2 v2 = {
  verb = verb2gverb v2 ;
  compl = table {
    Agr Sg Per1 => "myself" ;
    Agr Sg Per2 => "yourself" ;
    Agr Sg Per3 => "itself" ; -- simplification, no human referent
    Agr Pl Per1 => "ourselves" ;
    Agr Pl Per2 => "yourselves" ;
    Agr Pl Per3 => "themselves" }
} ;
```

## Transfer

We want to transform sentences with the same subject and object into reflexive. For example:
```
> I like me
I like myself
> John sees John
John sees himself
```

The best way is to export the GF grammar into another format and access it from another program.
In this example, we use Haskell.

The code is found in [Main.hs](https://github.com/inariksit/gf-contrib/blob/ReflTransfer/mini/newmini/Main.hs).
In order to make it work, you need to generate the files `MiniLang.pgf` and `MiniLang.hs`. Run the following command to generate both:

```
gf -make --output-format=haskell MiniLangEng.gf
```

After generating the files, you can run the program:

```
$ runghc Main.hs
Write your sentence here, I will transform it into reflexive, if it has the same subject and object.
Write quit to exit.
> I see me
I see myself
> a car
a car
> John sleeps and the water drinks the water
John sleeps and the water drinks itself
> quit
bye
```

The Haskell file is using the PGF library ([Haskell runtime](https://hackage.haskell.org/package/gf-3.10/docs/PGF.html)).
It is installed by default when you install GF, whether from a binary, from Hackage or compiling from source.

However, if you are unable to run Main.hs, you can try to search the error on the [GF mailing list](https://groups.google.com/forum/#!forum/gf-dev), or if it's a completely novel error, post it to the list or ask on the `#gf` IRC channel on Freenode.
