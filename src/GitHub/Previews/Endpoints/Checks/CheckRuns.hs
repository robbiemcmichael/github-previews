module GitHub.Previews.Endpoints.Checks.CheckRuns (
    checkRun,
    checkRunR,
    createCheckRun,
    createCheckRunR,
    updateCheckRun,
    updateCheckRunR,
    module GitHub.Previews.Data,
    ) where

import GitHub.Data
import GitHub.Internal.Prelude
import GitHub.Request
import Prelude ()

import GitHub.Previews.Data

-- | Get a check run.
checkRun :: Auth -> Name Owner -> Name Repo -> Id CheckRun -> IO (Either Error CheckRun)
checkRun auth owner repo crid =
    executeRequest auth $ checkRunR owner repo crid

-- | Get a check run. See <https://developer.github.com/v3/checks/runs/#get-a-single-check-run>
checkRunR :: Name Owner -> Name Repo -> Id CheckRun -> GenRequest 'MtAntiopePreview 'RO CheckRun
checkRunR owner repo crid =
    Query ["repos", toPathPart owner, toPathPart repo, "check-runs", toPathPart crid] mempty

-- | Create a check run.
createCheckRun :: Auth -> Name Owner -> Name Repo -> NewCheckRun -> IO (Either Error CheckRun)
createCheckRun auth owner repo =
    executeRequest auth . createCheckRunR owner repo

-- | Create a check run. See <https://developer.github.com/v3/checks/runs/#create-a-check-run>
createCheckRunR :: Name Owner -> Name Repo -> NewCheckRun -> GenRequest 'MtAntiopePreview 'RW CheckRun
createCheckRunR owner repo =
    Command Post ["repos", toPathPart owner, toPathPart repo, "check-runs"] . encode

-- | Update a check run.
updateCheckRun :: Auth -> Name Owner -> Name Repo -> Id CheckRun -> EditCheckRun -> IO (Either Error CheckRun)
updateCheckRun auth owner repo crid =
    executeRequest auth . updateCheckRunR owner repo crid

-- | Update a check run. See <https://developer.github.com/v3/checks/runs/#update-a-check-run>
updateCheckRunR :: Name Owner -> Name Repo -> Id CheckRun -> EditCheckRun -> GenRequest 'MtAntiopePreview 'RW CheckRun
updateCheckRunR owner repo crid =
    Command Patch ["repos", toPathPart owner, toPathPart repo, "check-runs", toPathPart crid] . encode
