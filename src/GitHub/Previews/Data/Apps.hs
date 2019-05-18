module GitHub.Previews.Data.Apps where

import GitHub.Internal.Prelude
import Prelude ()

import GitHub.Data

-- | Type for a GitHub App
data App = App
    { appId          :: !(Id App)
    , appOwner       :: !SimpleOwner
    , appName        :: !(Name App)
    , appDescription :: !(Maybe Text)
    , appExternalUrl :: !URL
    , appHtmlUrl     :: !URL
    , appCreatedAt   :: !UTCTime
    , appUpdatedAt   :: !UTCTime
    }
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData App where rnf = genericRnf
instance Binary App

-- | Currently only used for @Id Installation@
data Installation = Installation
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData Installation where rnf = genericRnf
instance Binary Installation

-- | Response type for a new access token
data AccessToken = AccessToken
    { accessTokenToken      :: !Text
    , accessTokenExpiration :: !UTCTime
    }
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData AccessToken where rnf = genericRnf
instance Binary AccessToken

-------------------------------------------------------------------------------
-- JSON instances
-------------------------------------------------------------------------------

instance FromJSON App where
  parseJSON = withObject "App" $ \o -> App
      <$> o .:  "id"
      <*> o .:  "owner"
      <*> o .:  "name"
      <*> o .:? "description"
      <*> o .:  "external_url"
      <*> o .:  "html_url"
      <*> o .:  "created_at"
      <*> o .:  "updated_at"

instance FromJSON AccessToken where
  parseJSON = withObject "AccessToken" $ \o -> AccessToken
      <$> o .: "token"
      <*> o .: "expires_at"
