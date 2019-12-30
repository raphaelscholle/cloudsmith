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



## Example usage

[
![Package Workflow Status](https://github.com/AutoModality/action-cloudsmith/workflows/Cloudsmith%20Push/badge.svg)](https://github.com/AutoModality/action-cloudsmith/actions?query=workflow%3A%22Cloudsmith+Push%22)



```
name: Cloudsmith Push
on: push
jobs:
  push:
    runs-on: ubuntu-latest
    name: Push demo
    steps:
    - name: Push
      id: push
      uses: AutoModality/action-cloudsmith@0.1.0
      with:
        api-key: ${{ secrets.CLOUDSMITH_API_KEY }}
        command: 'push'
        format: 'deb'
        owner: 'automodality'
        repo: 'trial'
        distro: 'ubuntu'
        release: 'xenial'
        file: 'cool-lib_1.0.1_amd64.deb'
```