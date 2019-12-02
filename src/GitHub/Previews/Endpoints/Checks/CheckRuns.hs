module GitHub.Previews.Endpoints.Checks.CheckRuns (
    checkRunR,
    createCheckRunR,
    updateCheckRunR,
    module GitHub.Previews.Data,
    ) where

import GitHub.Data
import GitHub.Internal.Prelude
import GitHub.Request
import Prelude ()

import GitHub.Previews.Data

-- | Get a check run. See <https://developer.github.com/v3/checks/runs/#get-a-single-check-run>
checkRunR :: Name Owner -> Name Repo -> Id CheckRun -> GenRequest ('MtPreview MtAntiope) 'RO CheckRun
checkRunR owner repo crid =
    Query ["repos", toPathPart owner, toPathPart repo, "check-runs", toPathPart crid] mempty

-- | Create a check run. See <https://developer.github.com/v3/checks/runs/#create-a-check-run>
createCheckRunR :: Name Owner -> Name Repo -> NewCheckRun -> GenRequest ('MtPreview MtAntiope) 'RW CheckRun
createCheckRunR owner repo =
    Command Post ["repos", toPathPart owner, toPathPart repo, "check-runs"] . encode

-- | Update a check run. See <https://developer.github.com/v3/checks/runs/#update-a-check-run>
updateCheckRunR :: Name Owner -> Name Repo -> Id CheckRun -> EditCheckRun -> GenRequest ('MtPreview MtAntiope) 'RW CheckRun
updateCheckRunR owner repo crid =
    Command Patch ["repos", toPathPart owner, toPathPart repo, "check-runs", toPathPart crid] . encode
