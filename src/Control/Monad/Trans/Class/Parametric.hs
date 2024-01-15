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
{-# LANGUAGE MonoLocalBinds #-}
{-# LANGUAGE QuantifiedConstraints #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE UnicodeSyntax #-}

{- |
Description : 'MonadTrans'formers that preserve t'ParametricFunctor'
Copyright   : Copyright 2024 Shea Levy.
License     : Apache-2.0
Maintainer  : shea@shealevy.com
-}
module Control.Monad.Trans.Class.Parametric where

import Control.Monad.Trans.Class
import Data.Coerce
import Data.Functor.Parametric

-- | 'MonadTrans'formers that preserve t'ParametricFunctor'
class
  ( MonadTrans t
  , ∀ m x y
     . ( Monad m
       , ParametricFunctor m
       , Coercible x y
       )
    ⇒ Coercible (t m x) (t m y)
  ) ⇒
  ParametricMonadTrans t

instance
  ( MonadTrans t
  , ∀ m x y
     . ( Monad m
       , ParametricFunctor m
       , Coercible x y
       )
    ⇒ Coercible (t m x) (t m y)
  )
  ⇒ ParametricMonadTrans t
