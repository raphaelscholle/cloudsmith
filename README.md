**This is a fork from https://github.com/AutoModality/action-cloudsmith/ - we're in the middle of repurposing it.**

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
  * [Docker format](https://cloudsmith.io/l/docker-registry/)

**Not Implemented**
* Everything else

## Cloudsmith API Key

The API key is required for the cloudsmith-cli to work.  

Obtain the API Key from [Cloudsmith user settings](https://cloudsmith.io/user/settings/api/). You should use a less priveleged and generic account for Continuous Integration. 

Add a secret named `CLOUDSMITH_API_KEY` and a value of the API Key obtained from cloudsmith.  Secrets are maintained in the settings of each repository. 

Pass your secret to the Action as seen in the Example usage.


# Examples

## Raw File Push

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
      uses: cloudsmith-io/action@0.3.0
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
      uses: cloudsmith-io/action@0.3.0
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
## Docker Image Push

**Note**: In most cases, it is better to use the native `docker cli` to push images to the Cloudsmith Repository.  Search the Marketplace for many supporting implementations.

See [push-docker.yml](.github/workflows/push-docker.yml)
```
name: Push Docker
on: push
jobs:
  push:
    runs-on: ubuntu-latest
    name: Docker Push Demo
    steps:
    - uses: actions/checkout@v1
    - name: Push
      id: push
      uses: cloudsmith-io/action@0.3.0
      with:
        api-key: ${{ secrets.CLOUDSMITH_API_KEY }}
        command: 'push'
        format: 'docker'
        owner: 'automodality'
        repo: 'trial'
        republish: 'true' # needed since version is not changing
        file: 'test/fixture/alpine-docker-test.tar.gz' #alpine image saved to file

```
