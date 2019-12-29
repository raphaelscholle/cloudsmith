# Cloudsmith Github Action
Interact with Cloudsmith repositories using the cloudmsith cli
to push packages, etc.

## Inputs

### `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

### `time`

The time we greeted you.

### `os`

The operating system that ran the action.

## Example usage

uses: actions/hello-world-docker-action@v1
with:
  who-to-greet: 'Mona the Octocat'