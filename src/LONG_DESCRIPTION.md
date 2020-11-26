## Description

Auto run the follow tasks on merge `develop` to `master` (gitlab ci)

- Auto create version tag
  - Version from `composer.json` > `version`
  - Changelog from `CHANGELOG.md`
- Auto update gitlab and github project description
  - Short description from `composer.json` > `description`
- Auto recreate gitlab pull request `develop` to `master`
  - Assigned user is first maintainer in gitlab project members

## Usage

### `.gitlab-ci.yml`

```yaml
include:
  - https://plugins.studer-raimann.ch/Customizing/global/auto_version_tag_ci/build/auto_version_tag_ci.yml
```

### CI variables

Set `AUTO_VERSION_TAG_TOKEN` ci variable, protected and masked

Set `AUTO_VERSION_TAG_TOKEN_GITHUB` ci variable (`user:token`), protected and masked