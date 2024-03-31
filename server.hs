{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}

import Yesod

data Server = Server

-- routes
mkYesod "Server" [parseRoutes|
/ Index GET
/testapi TestApi GET
|]

instance Yesod Server



-- handlers
getIndex = do
    defaultLayout [whamlet|<h1 align="center">Welcome</h1>|]

getTestApi = do
    return $ object ["phrase" .= "Whatever happens, happens..."]

main :: IO ()
main = do
    warp 8000 Server -- run server
