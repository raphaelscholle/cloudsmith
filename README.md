# Cloudsmith Github Action
Interact with Cloudsmith repositories using the cloudmsith cli
to push packages, etc.

## Cloudsmith CLI 
This action uses the Cloudsmith CLI and intends to be as similar
to its structure and terminology as possible.  

**Implemented**
* Push
  * Debian format

**Not Implemented**
* Everything else


## Example usage

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
      uses: AutoModality/action-cloudsmith@BB-762
      with:
        command: 'push'
        format: 'deb'
        owner: 'automodality'
        repo: 'trial'
        distro: 'ubuntu'
        release: 'xenial'
        file: 'cool-lib_1.0.1_amd64.deb'
```