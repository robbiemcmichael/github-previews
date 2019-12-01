module GitHub.Previews.Endpoints.Apps (
    createAccessTokenR,
    module GitHub.Previews.Data,
    ) where

import GitHub.Internal.Prelude
import Prelude ()

import GitHub.Data
import GitHub.Request

import GitHub.Previews.Data

-- | Create an access token for a given installation.
-- See <https://developer.github.com/v3/apps/#create-a-new-installation-token>
createAccessTokenR :: Id Installation -> GenRequest ('MtPreview MtMachineMan) 'RW AccessToken
createAccessTokenR installation =
    Command Post ["app", "installations", toPathPart installation, "access_tokens"] mempty
