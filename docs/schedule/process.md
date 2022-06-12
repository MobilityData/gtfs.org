# Specification amendment process
The official specification, reference and documentation are written in English. If a translation to a different language differs from the English original, the latter takes precedence. All communication is performed in English.

1. Create a git branch with update of all relevant parts of protocol definition, specification and documentation files (except for translations).
1. Create pull request on https://github.com/google/transit. Pull request must contain an extended description of the patch. The creator of the pull request becomes the _advocate_.
1. Once pull request is registered, it must be announced by its advocate in the [GTFS Changes mailing list](https://groups.google.com/forum/#!forum/gtfs-changes), including a link to the pull request. Once announced, the pull request is considered a proposal.  The pull request should also be edited to contain a link to the Google Groups announcement so they can easily be cross-referenced.
  	- Since the advocate is a contributor, they must sign the [Contributor License Agreement](https://github.com/google/transit/blob/master/CONTRIBUTING.md) before pull request can be accepted.
1. The discussion of the proposal follows. Pull request comments should be used as the sole discussion forum.
  	- The discussion lasts for as long as the advocate feels necessary, but must be at least 7 calendar days.
  	- The advocate is responsible for timely update of the proposal (i.e. pull request) based on the comments for which they agree to.
  	- At any point in time the advocate can claim proposal abandoned.
1. The advocate can call for a vote on a version of the proposal at any point in time following the initial 7-day interval required for discussion.
  	- Before calling for a vote, at least one GTFS producer and one GTFS consumer should implement the proposed change.  It is expected that the GTFS producer(s) include the change in a public-facing GTFS feed and provide a link to that data within the pull request comments, and that the GTFS consumer(s) provides a link in the pull request comments to an application that is utilizing the change in a non-trivial manner (i.e, it is supporting new or improved functionality).
1. Vote lasts the minimum period sufficient to cover 7 full calendar days and 5 full Swiss business days. Vote ends at 23:59:59 UTC.
  	- The advocate should announce the specific end time at the start of the vote.
  	- During voting period only editorial changes to the proposal are allowed (typos, wording may change as long as it does not change the meaning).
  	- Anyone is allowed to vote yes/no in a form of comment to the pull request, and votes can be changed until the end of the voting period.
    If a voter changes her vote, it is recommended to do it by updating the original vote comment by striking through the vote and writing the new vote.
  	- Votes before the start of the voting period are not considered.
	- Opening and closing of votes must be announced on the [GTFS Changes mailing list](https://groups.google.com/forum/#!forum/gtfs-changes).
1. The proposal is accepted if there is a unanimous consensus yes with at least 3 votes.
  	- The proposer's vote does not count towards the 3 vote total. For example, if Proposer X creates a pull request and votes yes, and User Y and Z vote yes, this is counted as 2 total yes votes.
  	- Votes against shall be motivated, and ideally provide actionable feedback.
  	- If the vote has failed, then the advocate may choose to continue work on the proposal, or to abandon the proposal.
    Either decision of the advocate must be announced in the [GTFS Changes mailing list](https://groups.google.com/forum/#!forum/gtfs-changes).
  	- If the advocate continues the work on proposal then a new vote can be called for at any point in time.
1. Any pull request remaining inactive for 30 calendar days will be closed. When a pull request is closed, the corresponding proposal is considered abandoned. The advocate may reopen the pull request at any time if they wish to continue or maintain the conversation.
1. If the proposal is accepted:
  	- Google is committed to merging the voted upon version of the pull request (provided that the contributors have signed the [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md)), and performing the pull request within 5 business days.
  	- Translations must not be included into the original pull request.
    Google is responsible for eventually updating relevant translations into supported languages, but pure translation pull requests from the community are welcome and will be accepted as soon as all editorial comments are addressed.
1. The final result of the pull request (accepted or abandoned) should be announced on the same Google Groups thread where the pull request was originally announced.
