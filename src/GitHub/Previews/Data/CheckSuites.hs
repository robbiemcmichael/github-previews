{-# LANGUAGE RecordWildCards #-}
module GitHub.Previews.Data.CheckSuites where

import GitHub.Internal.Prelude
import Prelude ()

import GitHub.Data
import GitHub.Data.Id

-- | Currently only used for @Id CheckSuite@
data CheckSuite = CheckSuite
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData CheckSuite where rnf = genericRnf
instance Binary CheckSuite

-- | Reference to a 'CheckSuite'
data CheckSuiteRef = CheckSuiteRef
    { checkSuiteRefId :: !(Id CheckSuite)
    }
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData CheckSuiteRef where rnf = genericRnf
instance Binary CheckSuiteRef

-------------------------------------------------------------------------------
-- JSON instances
-------------------------------------------------------------------------------

instance ToJSON CheckSuiteRef where
    toJSON CheckSuiteRef{..} = object $ filter notNull $
        [ "id" .= checkSuiteRefId
        ]
      where
        notNull (_, Null) = False
        notNull (_, _) = True

instance FromJSON CheckSuiteRef where
    parseJSON = withObject "CheckSuiteRef" $ \o -> CheckSuiteRef
        <$> o .: "id"
