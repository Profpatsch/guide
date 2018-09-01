{-# LANGUAGE OverloadedStrings #-}


{- | An algorithm for merging users' edits. Specifically, there's just one
function – 'merge' – and it simply does a three-way diff.
-}
module Guide.Diff.Merge
(
  merge,
)
where


import Imports

-- Text
import qualified Data.Text as T
-- Vector
import qualified Data.Vector as V
-- Diffing
import qualified Data.Patch as PV

import Guide.Diff.Tokenize


-- | An implementation of a 3-way diff and merge.
merge
  :: Text    -- ^ Original text
  -> Text    -- ^ Variant A (preferred)
  -> Text    -- ^ Variant B
  -> Text    -- ^ Merged text
merge (V.fromList . tokenize -> orig)
      (V.fromList . tokenize -> a)
      (V.fromList . tokenize -> b) =
    T.concat . toList $ PV.apply (pa <> pb') orig
  where
    -- 1. diff
    pa = PV.diff orig a
    pb = PV.diff orig b
    -- 2. merge
    (_, pb') = PV.transformWith PV.ours pa pb
