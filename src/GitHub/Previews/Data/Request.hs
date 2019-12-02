{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
module GitHub.Previews.Data.Request where

import GitHub.Internal.Prelude
import GitHub.Request

import Data.Tagged (Tagged (..))

data MtWyandotte       -- ^ @application/vnd.github.wyandotte-preview+json@ <https://developer.github.com/v3/previews/#migrations>
data MtBarredRock      -- ^ @application/vnd.github.barred-rock-preview+json@ <https://developer.github.com/v3/previews/#source-import>
data MtAntMan          -- ^ @application/vnd.github.ant-man-preview+json@ <https://developer.github.com/v3/previews/#enhanced-deployments>
data MtSquirrelGirl    -- ^ @application/vnd.github.squirrel-girl-preview+json@ <https://developer.github.com/v3/previews/#reactions>
data MtMockingbird     -- ^ @application/vnd.github.mockingbird-preview+json@ <https://developer.github.com/v3/previews/#timeline>
data MtMachineMan      -- ^ @application/vnd.github.machine-man-preview+json@ <https://developer.github.com/v3/previews/#integrations>
data MtInertia         -- ^ @application/vnd.github.inertia-preview+json@ <https://developer.github.com/v3/previews/#projects>
data MtCloak           -- ^ @application/vnd.github.cloak-preview+json@ <https://developer.github.com/v3/previews/#commit-search>
data MtBlackPanther    -- ^ @application/vnd.github.black-panther-preview+json@ <https://developer.github.com/v3/previews/#community-profile-metrics>
data MtGiantSentryFist -- ^ @application/vnd.github.giant-sentry-fist-preview+json@ <https://developer.github.com/v3/previews/#user-blocking>
data MtMercy           -- ^ @application/vnd.github.mercy-preview+json@ <https://developer.github.com/v3/previews/#repository-topics>
data MtScarletWitch    -- ^ @application/vnd.github.scarlet-witch-preview+json@ <https://developer.github.com/v3/previews/#codes-of-conduct>
data MtHellcat         -- ^ @application/vnd.github.hellcat-preview+json@ <https://developer.github.com/v3/previews/#nested-teams>
data MtNightshade      -- ^ @application/vnd.github.nightshade-preview+json@ <https://developer.github.com/v3/previews/#repository-transfer>
data MtSailorV         -- ^ @application/vnd.github.sailor-v-preview+json@ <https://developer.github.com/v3/previews/#add-lock-reason>
data MtDazzler         -- ^ @application/vnd.github.dazzler-preview+json@ <https://developer.github.com/v3/previews/#organization-invitations>
data MtEcho            -- ^ @application/vnd.github.echo-preview+json@ <https://developer.github.com/v3/previews/#team-discussions>
data MtSymmetra        -- ^ @application/vnd.github.symmetra-preview+json@ <https://developer.github.com/v3/previews/#label-emoji-search-and-descriptions>
data MtZzzax           -- ^ @application/vnd.github.zzzax-preview+json@ <https://developer.github.com/v3/previews/#require-signed-commits>
data MtLukeCage        -- ^ @application/vnd.github.luke-cage-preview+json@ <https://developer.github.com/v3/previews/#require-multiple-approving-reviews>
data MtHagar           -- ^ @application/vnd.github.hagar-preview+json@ <https://developer.github.com/v3/previews/#retrieve-hovercard-information>
data MtAntiope         -- ^ @application/vnd.github.antiope-preview+json@ <https://developer.github.com/v3/previews/#check-runs-and-check-suites-api>
data MtStarfox         -- ^ @application/vnd.github.starfox-preview+json@ <https://developer.github.com/v3/previews/#project-card-details>
data MtFury            -- ^ @application/vnd.github.fury-preview+json@ <https://developer.github.com/v3/previews/#github-app-manifests>
data MtFlash           -- ^ @application/vnd.github.flash-preview+json@ <https://developer.github.com/v3/previews/#deployment-statuses>
data MtSurtur          -- ^ @application/vnd.github.surtur-preview+json@ <https://developer.github.com/v3/previews/#repository-creation-permissions>
data MtCorsair         -- ^ @application/vnd.github.corsair-preview+json@ <https://developer.github.com/v3/previews/#content-attachments>
data MtSombra          -- ^ @application/vnd.github.sombra-preview+json@ <https://developer.github.com/v3/previews/#interaction-restrictions-for-repositories-and-organizations>
data MtShadowCat       -- ^ @application/vnd.github.shadow-cat-preview+json@ <https://developer.github.com/v3/previews/#draft-pull-requests>
data MtSwitcheroo      -- ^ @application/vnd.github.switcheroo-preview+json@ <https://developer.github.com/v3/previews/#enable-and-disable-pages>
data MtGroot           -- ^ @application/vnd.github.groot-preview+json@ <https://developer.github.com/v3/previews/#list-branches-or-pull-requests-for-a-commit>
data MtGambit          -- ^ @application/vnd.github.gambit-preview+json@ <https://developer.github.com/v3/previews/#uninstall-a-github-app>
data MtDorian          -- ^ @application/vnd.github.dorian-preview+json@ <https://developer.github.com/v3/previews/#enable-or-disable-vulnerability-alerts-for-a-repository>
data MtLydian          -- ^ @application/vnd.github.lydian-preview+json@ <https://developer.github.com/v3/previews/#update-a-pull-request-branch>
data MtLondon          -- ^ @application/vnd.github.london-preview+json@ <https://developer.github.com/v3/previews/#enable-or-disable-automated-security-fixes>
data MtBaptiste        -- ^ @application/vnd.github.baptiste-preview+json@ <https://developer.github.com/v3/previews/#create-and-use-repository-templates>
data MtDoctorStrange   -- ^ @application/vnd.github.doctor-strange-preview+json@ <https://developer.github.com/v3/previews/#new-oauth-applications-api-endpoints>

instance PreviewAccept MtWyandotte where
    previewContentType = Tagged "application/vnd.github.wyandotte-preview+json"

instance FromJSON a => PreviewParseResponse MtWyandotte a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtBarredRock where
    previewContentType = Tagged "application/vnd.github.barred-rock-preview+json"

instance FromJSON a => PreviewParseResponse MtBarredRock a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtAntMan where
    previewContentType = Tagged "application/vnd.github.ant-man-preview+json"

instance FromJSON a => PreviewParseResponse MtAntMan a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtSquirrelGirl where
    previewContentType = Tagged "application/vnd.github.squirrel-girl-preview+json"

instance FromJSON a => PreviewParseResponse MtSquirrelGirl a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtMockingbird where
    previewContentType = Tagged "application/vnd.github.mockingbird-preview+json"

instance FromJSON a => PreviewParseResponse MtMockingbird a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtMachineMan where
    previewContentType = Tagged "application/vnd.github.machine-man-preview+json"

instance FromJSON a => PreviewParseResponse MtMachineMan a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtInertia where
    previewContentType = Tagged "application/vnd.github.inertia-preview+json"

instance FromJSON a => PreviewParseResponse MtInertia a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtCloak where
    previewContentType = Tagged "application/vnd.github.cloak-preview+json"

instance FromJSON a => PreviewParseResponse MtCloak a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtBlackPanther where
    previewContentType = Tagged "application/vnd.github.black-panther-preview+json"

instance FromJSON a => PreviewParseResponse MtBlackPanther a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtGiantSentryFist where
    previewContentType = Tagged "application/vnd.github.giant-sentry-fist-preview+json"

instance FromJSON a => PreviewParseResponse MtGiantSentryFist a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtMercy where
    previewContentType = Tagged "application/vnd.github.mercy-preview+json"

instance FromJSON a => PreviewParseResponse MtMercy a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtScarletWitch where
    previewContentType = Tagged "application/vnd.github.scarlet-witch-preview+json"

instance FromJSON a => PreviewParseResponse MtScarletWitch a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtHellcat where
    previewContentType = Tagged "application/vnd.github.hellcat-preview+json"

instance FromJSON a => PreviewParseResponse MtHellcat a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtNightshade where
    previewContentType = Tagged "application/vnd.github.nightshade-preview+json"

instance FromJSON a => PreviewParseResponse MtNightshade a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtSailorV where
    previewContentType = Tagged "application/vnd.github.sailor-v-preview+json"

instance FromJSON a => PreviewParseResponse MtSailorV a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtDazzler where
    previewContentType = Tagged "application/vnd.github.dazzler-preview+json"

instance FromJSON a => PreviewParseResponse MtDazzler a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtEcho where
    previewContentType = Tagged "application/vnd.github.echo-preview+json"

instance FromJSON a => PreviewParseResponse MtEcho a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtSymmetra where
    previewContentType = Tagged "application/vnd.github.symmetra-preview+json"

instance FromJSON a => PreviewParseResponse MtSymmetra a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtZzzax where
    previewContentType = Tagged "application/vnd.github.zzzax-preview+json"

instance FromJSON a => PreviewParseResponse MtZzzax a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtLukeCage where
    previewContentType = Tagged "application/vnd.github.luke-cage-preview+json"

instance FromJSON a => PreviewParseResponse MtLukeCage a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtHagar where
    previewContentType = Tagged "application/vnd.github.hagar-preview+json"

instance FromJSON a => PreviewParseResponse MtHagar a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtAntiope where
    previewContentType = Tagged "application/vnd.github.antiope-preview+json"

instance FromJSON a => PreviewParseResponse MtAntiope a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtStarfox where
    previewContentType = Tagged "application/vnd.github.starfox-preview+json"

instance FromJSON a => PreviewParseResponse MtStarfox a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtFury where
    previewContentType = Tagged "application/vnd.github.fury-preview+json"

instance FromJSON a => PreviewParseResponse MtFury a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtFlash where
    previewContentType = Tagged "application/vnd.github.flash-preview+json"

instance FromJSON a => PreviewParseResponse MtFlash a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtSurtur where
    previewContentType = Tagged "application/vnd.github.surtur-preview+json"

instance FromJSON a => PreviewParseResponse MtSurtur a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtCorsair where
    previewContentType = Tagged "application/vnd.github.corsair-preview+json"

instance FromJSON a => PreviewParseResponse MtCorsair a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtSombra where
    previewContentType = Tagged "application/vnd.github.sombra-preview+json"

instance FromJSON a => PreviewParseResponse MtSombra a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtShadowCat where
    previewContentType = Tagged "application/vnd.github.shadow-cat-preview+json"

instance FromJSON a => PreviewParseResponse MtShadowCat a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtSwitcheroo where
    previewContentType = Tagged "application/vnd.github.switcheroo-preview+json"

instance FromJSON a => PreviewParseResponse MtSwitcheroo a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtGroot where
    previewContentType = Tagged "application/vnd.github.groot-preview+json"

instance FromJSON a => PreviewParseResponse MtGroot a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtGambit where
    previewContentType = Tagged "application/vnd.github.gambit-preview+json"

instance FromJSON a => PreviewParseResponse MtGambit a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtDorian where
    previewContentType = Tagged "application/vnd.github.dorian-preview+json"

instance FromJSON a => PreviewParseResponse MtDorian a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtLydian where
    previewContentType = Tagged "application/vnd.github.lydian-preview+json"

instance FromJSON a => PreviewParseResponse MtLydian a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtLondon where
    previewContentType = Tagged "application/vnd.github.london-preview+json"

instance FromJSON a => PreviewParseResponse MtLondon a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtBaptiste where
    previewContentType = Tagged "application/vnd.github.baptiste-preview+json"

instance FromJSON a => PreviewParseResponse MtBaptiste a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)

instance PreviewAccept MtDoctorStrange where
    previewContentType = Tagged "application/vnd.github.doctor-strange-preview+json"

instance FromJSON a => PreviewParseResponse MtDoctorStrange a where
    previewParseResponse _ res = Tagged (parseResponseJSON res)
