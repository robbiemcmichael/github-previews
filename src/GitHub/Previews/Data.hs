module GitHub.Previews.Data (
    -- * Tagged types
    -- ** Id
    mkInstallationId,
    -- * Module re-exports
    module GitHub.Previews.Auth,
    module GitHub.Previews.Data.Apps,
    module GitHub.Previews.Data.CheckRuns,
    ) where

import GitHub.Internal.Prelude
import Prelude ()

import GitHub.Data.Id (Id (..))

import GitHub.Previews.Auth
import GitHub.Previews.Data.Apps
import GitHub.Previews.Data.CheckRuns

mkInstallationId :: Int -> Id Installation
mkInstallationId = Id
