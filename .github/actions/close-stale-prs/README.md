# Close outdated PRs

Closes pull requests with the specified label that are older than 23 hours.

## Inputs

### `github-token`

**Required** GitHub Token with repo scope.

### `label-name`

**Required** The label of PRs to evaluate for closing.

## Outputs

None.

## Example usage

```yaml
name: Close stale issues
id: close-stale-issues
uses: ./.github/actions/close-stale-prs
with:
    github-token: ${{ env.CREDENTIALS }}
    label-name: 'automated-content-update'
```