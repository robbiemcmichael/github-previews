module GitHub.Previews.Data (
    -- * Tagged types
    -- ** Name
    mkAppName,
    -- ** Id
    mkAppId,
    mkCheckRunId,
    mkCheckSuiteId,
    mkInstallationId,
    -- * Module re-exports
    module GitHub.Previews.Auth,
    module GitHub.Previews.Data.Apps,
    module GitHub.Previews.Data.CheckRuns,
    module GitHub.Previews.Data.CheckSuites,
    module GitHub.Previews.Data.Request,
    module GitHub.Previews.Data.Webhooks,
    ) where

import GitHub.Internal.Prelude
import Prelude ()

import GitHub.Data.Id   (Id (..))
import GitHub.Data.Name (Name (..))

import GitHub.Previews.Auth
import GitHub.Previews.Data.Apps
import GitHub.Previews.Data.CheckRuns
import GitHub.Previews.Data.CheckSuites
import GitHub.Previews.Data.Request
import GitHub.Previews.Data.Webhooks

mkAppId :: Int -> Id App
mkAppId = Id

mkAppName :: Text -> Name App
mkAppName = N

mkCheckRunId :: Int -> Id CheckRun
mkCheckRunId = Id

mkCheckSuiteId :: Int -> Id CheckSuite
mkCheckSuiteId = Id

mkInstallationId :: Int -> Id Installation
mkInstallationId = Id
