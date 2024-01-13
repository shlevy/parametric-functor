-- Copyright 2024 Shea Levy
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuantifiedConstraints #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE UnicodeSyntax #-}

{- |
Description : A known-parametric 'Functor' typeclass.
Copyright   : Copyright 2024 Shea Levy.
License     : Apache-2.0
Maintainer  : shea@shealevy.com
-}
module Data.Functor.Parametric where

import Data.Coerce

{- | 'Functor's which are [properly](http://oleg.fi/gists/posts/2019-07-31-fmap-coerce-coerce.html) parametric.

Laws:

  * @fmap coerce@ = @coerce@
-}
class (Functor f, ∀ x y. (Coercible x y) ⇒ Coercible (f x) (f y)) ⇒ ParametricFunctor f

-- | Any lawful 'Functor' is (almost certainly) already a lawful instance.
instance (Functor f, ∀ x y. (Coercible x y) ⇒ Coercible (f x) (f y)) ⇒ ParametricFunctor f
