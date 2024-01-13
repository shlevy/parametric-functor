# parametric-functor

As Oleg Grenrus [argued](http://oleg.fi/gists/posts/2019-07-31-fmap-coerce-coerce.html) in 2019,
`Functor`s should be parametric, and in particular should:

  - Satisfy `fmap coerce` = `coerce`
  - Have a `∀ a b. Coercible a b ⇒ Coercible (f a) (f b)` super-constraint

Until this change gets adopted in @base@, this package can be used for a variant of `Functor`
which satisfies these requirements.
