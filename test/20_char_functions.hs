import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import qualified Data.Char as C
import qualified Data.List as L
import Data.Function

encode :: Int -> [Char] -> [Char]
encode shifter msg = map C.chr $ map (+ shifter) $ map C.ord msg

decode :: Int -> [Char] -> [Char]
decode shifter msg = encode (negate shifter) msg


main :: IO()
main = hspec $ do
    describe "Char functions" $ do
        it "can check if string isAlphaNum" $ do
            all C.isAlphaNum "bobby283" `shouldBe` True
            all C.isAlphaNum "some\n" `shouldBe` False
        it "can use isSpace to simulate List's words function" $ do
            {- use groupBy with C.isSpace -}
            L.groupBy ((==) `on` C.isSpace) "hey guys it's me"
                `shouldBe` ["hey"," ","guys"," ","it's"," ","me"]
        it "can filter out spaces from the previous example" $ do
            {- remove the spaces  -}
            (L.filter (not . any C.isSpace) . L.groupBy ((==) `on` C.isSpace) $ "hey guys it's me")
                `shouldBe` ["hey","guys","it's","me"]
        it "can categorize characters" $ do
            C.generalCategory ' ' `shouldBe` C.Space
            C.generalCategory 'U' `shouldBe` C.UppercaseLetter
            C.generalCategory 'z' `shouldBe` C.LowercaseLetter
            map C.generalCategory " \t\nA9"
                `shouldBe` [C.Space,C.Control,C.Control,C.UppercaseLetter,C.DecimalNumber]
        it "'ord' and 'chr' convert chars back and forth" $ do
            C.ord 'a' `shouldBe` 97
            C.chr 97 `shouldBe` 'a'
        it "can encode a string by shifting its value with provided num" $ do
            encode 3 "Heeeeey" `shouldBe` "Khhhhh|"
            (decode 3 $ encode 3 "Heeeeey") `shouldBe` "Heeeeey"
