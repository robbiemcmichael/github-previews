module GitHub.Previews.Auth (
    AppAuth (..),
    ) where

import GitHub.Internal.Prelude
import Prelude ()

import GitHub.Auth (AuthMethod (..))

import qualified Data.ByteString     as BS
import qualified Network.HTTP.Client as HTTP

type Token = BS.ByteString

-- | The Github App auth data type
data AppAuth
    = JWT Token                -- ^ JWT
    | EnterpriseJWT Text Token -- ^ Custom endpoint and JWT
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData AppAuth where rnf = genericRnf
instance Binary AppAuth
instance Hashable AppAuth

instance AuthMethod AppAuth where
    endpoint (JWT _)             = Nothing
    endpoint (EnterpriseJWT e _) = Just e

    setAuthRequest (JWT t)             = setAuthHeader $ "Bearer " <> t
    setAuthRequest (EnterpriseJWT _ t) = setAuthHeader $ "Bearer " <> t

setAuthHeader :: BS.ByteString -> HTTP.Request -> HTTP.Request
setAuthHeader auth req =
    req { HTTP.requestHeaders = ("Authorization", auth) : HTTP.requestHeaders req }
