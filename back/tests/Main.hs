module Main (main) where

-- Shared imports
import Imports
-- Testing
import Test.Hspec
-- Tests
import qualified WebSpec
import qualified MarkdownSpec
import qualified MergeSpec


main :: IO ()
main = do
  hspec $ do
    MarkdownSpec.tests
    MergeSpec.tests
  WebSpec.tests

-- TODO: it'd be nice if we could do server-starting tests in hspec as well,
-- but I don't know how to achieve the following flow:
--
--   * before the tests, the server is started
--   * after the tests, the server is killed
--   * if you Ctrl-C during the tests, the server is killed as well

{- Tests left to write:
~~~~~~~~~~~~~~
  * noscript tests
  * test on mobile
  * test that there are no repetitive searches on the admin page
  * test that admin CSS hasn't creeped into main CSS and vice-versa
  * test that the server is throwing no errors whatsoever during the
    execution of tests
  * changes to item description must not persist when doing Cancel and
    then Edit again
  * Markdown tests (e.g. Markdown doesn't work in category names)
  * test that nothing is messed up by things starting and ending with newlines
    (the %js bug, see description of 'mustache')
  -}
