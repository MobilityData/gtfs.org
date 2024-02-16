const core = require('@actions/core');
const github = require('@actions/github');

async function closeStalePullRequests() {
  try {
    const token = core.getInput('github-token');
    const label = core.getInput('label-name');
    const client = new github.GitHub(token);

    // Get all open pull requests
    const { owner, repo } = github.context.repo;
    const response = await client.pulls.list({
      owner,
      repo,
      state: 'open'
    });

    const now = new Date();
    const hourInMs = 60 * 60 * 1000;
    const closeThreshold = 23 * hourInMs; // 23 hours

    // Check each pull request
    for (const pullRequest of response.data) {
      const createdAt = new Date(pullRequest.created_at);
      const ageInMs = now - createdAt;

      // Check if the pull request is older than the threshold and has the specified label
      if (ageInMs >= closeThreshold && pullRequest.labels.find(l => l.name === label)) {
        // Close the pull request
        await client.pulls.update({
          owner,
          repo,
          pull_number: pullRequest.number,
          state: 'closed'
        });

        console.log(`Closed stale pull request #${pullRequest.number}`);
      }
    }
  } catch (error) {
    core.setFailed(error.message);
  }
}

closeStalePullRequests();