module GitHub.Previews.Data.Webhooks where

import GitHub.Internal.Prelude
import Prelude ()

import GitHub.Data.Id (Id)

import GitHub.Previews.Data.Apps (Installation)

data AppInstallation = AppInstallation
    { appInstallationId :: !(Id Installation)
    }
  deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData AppInstallation where rnf = genericRnf
instance Binary AppInstallation

instance FromJSON AppInstallation where
    parseJSON = withObject "AppInstallation" $ \o -> AppInstallation
        <$> o .: "id"
