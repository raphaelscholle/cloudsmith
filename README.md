# Cloudsmith Github Action
Interact with Cloudsmith repositories using the cloudmsith cli
to push packages, etc.

## Cloudsmith CLI 
This action uses the Cloudsmith CLI and intends to be as similar
to its structure and terminology as possible.  

**Implemented**
* Push
  * [Debian format](https://cloudsmith.io/l/deb-repository/)
  * [Raw format](https://cloudsmith.io/f/raw_file_repositories/)

**Not Implemented**
* Everything else

## Cloudsmith API Key

The API key is required for the cloudsmith-cli to work.  

Obtain the API Key from [Cloudsmith user settings](https://cloudsmith.io/user/settings/api/). You should use a less priveleged and generic account for Continuous Integration. 

Add a secret named `CLOUDSMITH_API_KEY` and a value of the API Key obtained from cloudsmith.  Secrets are maintained in the settings of each repository. 

Pass your secret to the Action as seen in the Example usage.


# Examples

## Raw File Push

[
![Package Workflow Status](https://github.com/AutoModality/action-cloudsmith/workflows/Push%20Raw/badge.svg)](https://github.com/AutoModality/action-cloudsmith/actions?query=workflow%3A%22Push+Raw%22)


[![Latest Version @ Cloudsmith](https://api-prd.cloudsmith.io/badges/version/automodality/trial/raw/Raw%20Test/latest/x/?render=true&badge_token=gAAAAABeClEKOQZCVujPlMzTyVCuImA8NXf-MnlI5GvpESmdpZBDK59OsgPrQlkyYqpbM60QvPeFLOVyJNuG7KW2AS756ghSurzX_5bSA3p28fbDVb31k6I%3D)](https://cloudsmith.io/~automodality/repos/trial/packages/detail/raw/Raw%2520Test/latest/)

See [push-raw.yml](.github/workflows/push-raw.yml)
```
name: Push Raw
on: push
jobs:
  push:
    runs-on: ubuntu-latest
    name: Raw File Push Test
    steps:
    - uses: actions/checkout@v1
    - name: Push
      id: push
      uses: AutoModality/action-cloudsmith@0.2.0
      with:
        api-key: ${{ secrets.CLOUDSMITH_API_KEY }}
        command: 'push'
        format: 'raw'
        owner: 'automodality'
        repo: 'trial'
        file: 'test/fixture/raw-file.txt' 
        name: 'Raw Test'
        summary: 'Github Action test of raw pushes'
        description: 'See https://github.com/AutoModality/action-cloudsmith/actions'
        version: ${{ github.sha}}

```

## Debian Package Push

[
![Package Workflow Status](https://github.com/AutoModality/action-cloudsmith/workflows/Push%20Debian/badge.svg)](https://github.com/AutoModality/action-cloudsmith/actions?query=workflow%3A%22Push+Debian%22)


[![Latest Version @ Cloudsmith](https://api-prd.cloudsmith.io/badges/version/automodality/trial/deb/aruco/latest/d=ubuntu%252Fxenial;t=1/?render=true&badge_token=gAAAAABeCm2C111HnG6P0q-4-hrU04M1vFbkeIiChmj6Rb7_pVR_dT_e3726dStLG8QjBMQM2U09KKEv96pemcC61lgbqW6TTW8leqmLUjx3CT5_pPNaA0I%3D)](https://cloudsmith.io/~automodality/repos/trial/packages/detail/deb/aruco/latest/d=ubuntu%252Fxenial;t=1/)

See [push-debian.yml](.github/workflows/push-debian.yml)
```
name: Push Debian
on: push
jobs:
  push:
    runs-on: ubuntu-latest
    name: Debian Push Demo
    steps:
    - uses: actions/checkout@v1
    - name: Push
      id: push
      uses: AutoModality/action-cloudsmith@0.2.0
      with:
        api-key: ${{ secrets.CLOUDSMITH_API_KEY }}
        command: 'push'
        format: 'deb'
        owner: 'automodality'
        repo: 'trial'
        distro: 'ubuntu'
        release: 'xenial'
        republish: 'true'
        file: 'test/fixture/aruco_3.1.0-1_amd64.deb' #real file, but will fail due to repeat versions

```