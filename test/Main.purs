module Test.Main where

import Prelude (Unit, discard, ($), (+), (==))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)
       
import Data.Word (Word, fromInt, (.&.), (.|.), (.^.), complement)

import Test.Assert (ASSERT, assert')
       
main :: forall e. Eff (console :: CONSOLE, assert :: ASSERT | e) Unit
main = do
    log "Run Tests"
    assert' "Word 4 + Word 2 == Word 6" $ fromInt 4 + fromInt 2 == fromInt 6 :: Word
    assert' "Word 4 .&. Word 4 == Word 4" $ fromInt 4 .&. fromInt 4 == fromInt 4 :: Word
    assert' "Word 4 .|. Word 2 == Word 6" $ fromInt 4 .|. fromInt 2 == fromInt 6 :: Word
    assert' "Word 4 .^. Word 2 == Word 6" $ fromInt 4 .^. fromInt 2 == fromInt 6 :: Word
    assert' "complement Word 0x0000 = complement Word 0xFFFF" $ complement(fromInt 0x0000) == (fromInt 0xFFFF) :: Word
    log "Done"
