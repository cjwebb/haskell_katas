import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

phoneBook = 
    [("betty","555-2938")
    ,("bonnie","452-2928")
    ,("patsy","493-2928")
    ,("lucille","205-2928")
    ,("wendy","939-8282")
    ,("penny","853-2492")
    ]

{- findKey :: (Eq k) => k -> [(k,v)] -> v -}
{- Use this later -}
{- findKey :: (Eq k) => k -> [(k,v)] -> Maybe v -}

main :: IO()
main = hspec $ do
    describe "Map functionality" $ do
        it "can look up by keys" $ do
            pending
            {- Use this test for the happy-path -}
            {- findKey "bonnie" phoneBook `shouldBe` "452-2928" -}
            {- Use these tests to test edge cases -}
            {- findKey "bonnie" phoneBook `shouldBe` Just "452-2928" -}
            {- findKey "bonn" phoneBook `shouldBe` Nothing -}
