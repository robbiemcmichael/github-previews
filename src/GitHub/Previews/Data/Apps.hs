module GitHub.Previews.Data.Apps where

import GitHub.Internal.Prelude
import Prelude ()

-- | Currently only used for Id Installation
data Installation = Installation
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

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

instance FromJSON AccessToken where
  parseJSON = withObject "AccessToken" $ \o -> AccessToken
      <$> o .: "token"
      <*> o .: "expires_at"
