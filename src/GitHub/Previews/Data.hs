module GitHub.Previews.Data (
    -- * Tagged types
    -- ** Id
    mkInstallationId,
    -- * Module re-exports
    module GitHub.Previews.Auth,
    module GitHub.Previews.Data.Apps,
    ) where

import GitHub.Internal.Prelude
import Prelude ()

import GitHub.Data.Id (Id (..))

import GitHub.Previews.Auth
import GitHub.Previews.Data.Apps

mkInstallationId :: Int -> Id Installation
mkInstallationId = Id
