{-# LANGUAGE RecordWildCards #-}
module GitHub.Previews.Data.CheckRuns where

import GitHub.Internal.Prelude
import Prelude ()

import qualified Data.Text as T

import GitHub.Data

import GitHub.Previews.Data.Apps
import GitHub.Previews.Data.CheckSuites

data CheckRun = CheckRun
    { checkRunId           :: !(Id CheckRun)
    , checkRunName         :: !Text
    , checkRunHeadSha      :: !(Name Commit)
    , checkRunDetailsUrl   :: !(Maybe URL)
    , checkRunExternalId   :: !(Maybe Text)
    , checkRunStatus       :: !CheckRunStatus
    , checkRunStartedAt    :: !UTCTime
    , checkRunConclusion   :: !(Maybe CheckRunConclusion)
    , checkRunCompletedAt  :: !(Maybe UTCTime)
    , checkRunOutput       :: !(Maybe CheckRunOutput)
    , checkRunActions      :: !(Vector CheckRunAction)
    , checkRunCheckSuite   :: !CheckSuiteRef
    , checkRunApp          :: !App
    }
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData CheckRun where rnf = genericRnf
instance Binary CheckRun

data NewCheckRun = NewCheckRun
    { newCheckRunName        :: !Text
    , newCheckRunHeadSha     :: !(Name Commit)
    , newCheckRunDetailsUrl  :: !(Maybe URL)
    , newCheckRunExternalId  :: !(Maybe Text)
    , newCheckRunStatus      :: !(Maybe CheckRunStatus)
    , newCheckRunStartedAt   :: !(Maybe UTCTime)
    , newCheckRunConclusion  :: !(Maybe CheckRunConclusion)
    , newCheckRunCompletedAt :: !(Maybe UTCTime)
    , newCheckRunOutput      :: !(Maybe CheckRunOutput)
    , newCheckRunActions     :: !(Vector CheckRunAction)
    }
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData NewCheckRun where rnf = genericRnf
instance Binary NewCheckRun

data EditCheckRun = EditCheckRun
    { editCheckRunName        :: !(Maybe Text)
    , editCheckRunDetailsUrl  :: !(Maybe URL)
    , editCheckRunExternalId  :: !(Maybe Text)
    , editCheckRunStatus      :: !(Maybe CheckRunStatus)
    , editCheckRunStartedAt   :: !(Maybe UTCTime)
    , editCheckRunConclusion  :: !(Maybe CheckRunConclusion)
    , editCheckRunCompletedAt :: !(Maybe UTCTime)
    , editCheckRunOutput      :: !(Maybe CheckRunOutput)
    , editCheckRunActions     :: !(Maybe (Vector CheckRunAction))
    }
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData EditCheckRun where rnf = genericRnf
instance Binary EditCheckRun

data CheckRunStatus
    = CheckRunQueued
    | CheckRunInProgress
    | CheckRunCompleted
    deriving (Show, Data, Enum, Bounded, Typeable, Eq, Ord, Generic)

instance NFData CheckRunStatus where rnf = genericRnf
instance Binary CheckRunStatus

data CheckRunConclusion
    = CheckRunSuccess
    | CheckRunFailure
    | CheckRunNeutral
    | CheckRunCancelled
    | CheckRunTimedOut
    | CheckRunActionRequired
    deriving (Show, Data, Enum, Bounded, Typeable, Eq, Ord, Generic)

instance NFData CheckRunConclusion where rnf = genericRnf
instance Binary CheckRunConclusion

data CheckRunOutput = CheckRunOutput
    { checkRunOutputTitle       :: !(Maybe Text)
    , checkRunOutputSummary     :: !(Maybe Text)
    , checkRunOutputText        :: !(Maybe Text)
    , checkRunOutputAnnotations :: !(Vector CheckRunAnnotation)
    , checkRunOutputImages      :: !(Vector CheckRunImage)
    }
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData CheckRunOutput where rnf = genericRnf
instance Binary CheckRunOutput

data CheckRunAnnotation = CheckRunAnnotation
    { checkRunAnnotationPath            :: !Text
    , checkRunAnnotationStartLine       :: !Int
    , checkRunAnnotationEndLine         :: !Int
    , checkRunAnnotationStartColumn     :: !(Maybe Int)
    , checkRunAnnotationEndColumn       :: !(Maybe Int)
    , checkRunAnnotationLevel           :: !CheckRunAnnotationLevel
    , checkRunAnnotationMessage         :: !Text
    , checkRunAnnotationTitle           :: !(Maybe Text)
    , checkRunAnnotationRawDetails      :: !(Maybe Text)
    }
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData CheckRunAnnotation where rnf = genericRnf
instance Binary CheckRunAnnotation

data CheckRunAnnotationLevel
    = CheckRunAnnotationNotice
    | CheckRunAnnotationWarning
    | CheckRunAnnotationFailure
    deriving (Show, Data, Enum, Bounded, Typeable, Eq, Ord, Generic)

instance NFData CheckRunAnnotationLevel where rnf = genericRnf
instance Binary CheckRunAnnotationLevel

data CheckRunImage = CheckRunImage
    { checkRunImageAlt      :: !Text
    , checkRunImageImageUrl :: !URL
    , checkRunImageCaption  :: !(Maybe Text)
    }
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData CheckRunImage where rnf = genericRnf
instance Binary CheckRunImage

data CheckRunAction = CheckRunAction
    { checkRunActionLabel       :: !Text
    , checkRunActionDescription :: !Text
    , checkRunActionIdentifier  :: !Text
    }
    deriving (Show, Data, Typeable, Eq, Ord, Generic)

instance NFData CheckRunAction where rnf = genericRnf
instance Binary CheckRunAction

-------------------------------------------------------------------------------
-- JSON instances
-------------------------------------------------------------------------------

instance FromJSON CheckRun where
  parseJSON = withObject "CheckRun" $ \o -> CheckRun
      <$> o .:  "id"
      <*> o .:  "name"
      <*> o .:  "head_sha"
      <*> o .:? "details_url"
      <*> o .:? "external_id"
      <*> o .:  "status"
      <*> o .:  "started_at"
      <*> o .:? "conclusion"
      <*> o .:? "completed_at"
      <*> o .:? "output"
      <*> o .:  "actions"
      <*> o .:  "check_suite"
      <*> o .:  "app"

instance ToJSON NewCheckRun where
    toJSON NewCheckRun{..} = object $ filter notNull $
        [ "name"         .= newCheckRunName
        , "head_sha"     .= newCheckRunHeadSha
        , "details_url"  .= newCheckRunDetailsUrl
        , "external_id"  .= newCheckRunExternalId
        , "status"       .= newCheckRunStatus
        , "started_at"   .= newCheckRunStartedAt
        , "conclusion"   .= newCheckRunConclusion
        , "completed_at" .= newCheckRunCompletedAt
        , "output"       .= newCheckRunOutput
        , "actions"      .= newCheckRunActions
        ]
      where
        notNull (_, Null) = False
        notNull (_, _) = True

instance ToJSON EditCheckRun where
    toJSON EditCheckRun{..} = object $ filter notNull $
        [ "name"         .= editCheckRunName
        , "details_url"  .= editCheckRunDetailsUrl
        , "external_id"  .= editCheckRunExternalId
        , "status"       .= editCheckRunStatus
        , "started_at"   .= editCheckRunStartedAt
        , "conclusion"   .= editCheckRunConclusion
        , "completed_at" .= editCheckRunCompletedAt
        , "output"       .= editCheckRunOutput
        , "actions"      .= editCheckRunActions
        ]
      where
        notNull (_, Null) = False
        notNull (_, _) = True

instance FromJSON CheckRunStatus where
    parseJSON = withText "CheckRunStatus" $ \s -> case T.toCaseFold s of
        "queued"      -> pure CheckRunQueued
        "in_progress" -> pure CheckRunInProgress
        "completed"   -> pure CheckRunCompleted
        _             -> fail $ "Unknown CheckRunStatus " <> T.unpack s

instance ToJSON CheckRunStatus where
    toJSON CheckRunQueued     = String "queued"
    toJSON CheckRunInProgress = String "in_progress"
    toJSON CheckRunCompleted  = String "completed"

instance FromJSON CheckRunConclusion where
    parseJSON = withText "CheckRunConclusion" $ \s -> case T.toCaseFold s of
        "success"         -> pure CheckRunSuccess
        "failure"         -> pure CheckRunFailure
        "neutral"         -> pure CheckRunNeutral
        "cancelled"       -> pure CheckRunCancelled
        "timed_out"       -> pure CheckRunTimedOut
        "action_required" -> pure CheckRunActionRequired
        _                 -> fail $ "Unknown CheckRunConclusion " <> T.unpack s

instance ToJSON CheckRunConclusion where
    toJSON CheckRunSuccess        = String "success"
    toJSON CheckRunFailure        = String "failure"
    toJSON CheckRunNeutral        = String "neutral"
    toJSON CheckRunCancelled      = String "cancelled"
    toJSON CheckRunTimedOut       = String "timed_out"
    toJSON CheckRunActionRequired = String "action_required"

instance ToJSON CheckRunOutput where
    toJSON CheckRunOutput{..} = object $ filter notNull $
        [ "title"       .= checkRunOutputTitle
        , "summary"     .= checkRunOutputSummary
        , "text"        .= checkRunOutputText
        , "annotations" .= checkRunOutputAnnotations
        , "images"      .= checkRunOutputImages
        ]
      where
        notNull (_, Null) = False
        notNull (_, _) = True

instance FromJSON CheckRunOutput where
    parseJSON = withObject "CheckRunOutput" $ \o -> CheckRunOutput
        <$> o .:  "title"
        <*> o .:  "summary"
        <*> o .:? "text"
        <*> o .:  "annotations"
        <*> o .:  "images"

instance ToJSON CheckRunAnnotation where
    toJSON CheckRunAnnotation{..} = object $ filter notNull $
        [ "path"             .= checkRunAnnotationPath
        , "start_line"       .= checkRunAnnotationStartLine
        , "end_line"         .= checkRunAnnotationEndLine
        , "start_column"     .= checkRunAnnotationStartColumn
        , "end_column"       .= checkRunAnnotationEndColumn
        , "annotation_level" .= checkRunAnnotationLevel
        , "message"          .= checkRunAnnotationMessage
        , "title"            .= checkRunAnnotationTitle
        , "raw_details"      .= checkRunAnnotationRawDetails
        ]
      where
        notNull (_, Null) = False
        notNull (_, _) = True

instance FromJSON CheckRunAnnotation where
    parseJSON = withObject "CheckRunAnnotation" $ \o -> CheckRunAnnotation
        <$> o .:  "path"
        <*> o .:  "start_line"
        <*> o .:  "end_line"
        <*> o .:? "start_column"
        <*> o .:? "end_column"
        <*> o .:  "annotation_level"
        <*> o .:  "message"
        <*> o .:? "title"
        <*> o .:? "raw_details"

instance FromJSON CheckRunAnnotationLevel where
    parseJSON = withText "CheckRunAnnotationLevel" $ \s -> case T.toCaseFold s of
        "notice"  -> pure CheckRunAnnotationNotice
        "warning" -> pure CheckRunAnnotationWarning
        "failure" -> pure CheckRunAnnotationFailure
        _         -> fail $ "Unknown CheckRunAnnotationLevel " <> T.unpack s

instance ToJSON CheckRunAnnotationLevel where
    toJSON CheckRunAnnotationNotice  = String "notice"
    toJSON CheckRunAnnotationWarning = String "warning"
    toJSON CheckRunAnnotationFailure = String "failure"

instance ToJSON CheckRunImage where
    toJSON CheckRunImage{..} = object $ filter notNull $
        [ "alt"       .= checkRunImageAlt
        , "image_url" .= checkRunImageImageUrl
        , "caption"   .= checkRunImageCaption
        ]
      where
        notNull (_, Null) = False
        notNull (_, _) = True

instance FromJSON CheckRunImage where
    parseJSON = withObject "CheckRunImage" $ \o -> CheckRunImage
        <$> o .:  "alt"
        <*> o .:  "image_url"
        <*> o .:? "caption"

instance ToJSON CheckRunAction where
    toJSON CheckRunAction{..} = object $ filter notNull $
        [ "label"       .= checkRunActionLabel
        , "description" .= checkRunActionDescription
        , "identifier"  .= checkRunActionIdentifier
        ]
      where
        notNull (_, Null) = False
        notNull (_, _) = True

instance FromJSON CheckRunAction where
  parseJSON = withObject "CheckRunAction" $ \o -> CheckRunAction
      <$> o .: "label"
      <*> o .: "description"
      <*> o .: "identifier"
