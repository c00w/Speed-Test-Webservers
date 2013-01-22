module Paths_snaptest (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/home/colin/.cabal/bin"
libdir     = "/home/colin/.cabal/lib/snaptest-0.1/ghc-7.6.1"
datadir    = "/home/colin/.cabal/share/snaptest-0.1"
libexecdir = "/home/colin/.cabal/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "snaptest_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "snaptest_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "snaptest_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "snaptest_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
