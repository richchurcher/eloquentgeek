{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Control.Applicative
import           Snap.Core
import           Snap.Util.FileServe
import           Snap.Http.Server

main :: IO ()
main = quickHttpServe site

site :: Snap ()
site =
    ifTop (writeBS "eg") <|>
    route [ ("posts",     method GET    getPosts)
          , ("posts",     method POST   createPost)
          , ("posts/:id", method GET    getPost)
          , ("posts/:id", method PUT    updatePost)
          , ("posts/:id", method DELETE deletePost)
          ] <|>
    dir "static" (serveDirectory "static")

getPosts :: Snap ()
getPosts = do
    writeBS "[]"

createPost :: Snap ()
createPost = do
    writeBS "POST"

getPost :: Snap ()
getPost = do
    param <- getParam "id"
    writeBS "GET"

updatePost :: Snap ()
updatePost = do
    param <- getParam "id"
    writeBS "PUT"

deletePost :: Snap ()
deletePost = do
    param <- getParam "id"
    writeBS "DELETE"
