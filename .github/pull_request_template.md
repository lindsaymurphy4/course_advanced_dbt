### Description
Describe the changes you made.

### Estimated Review Effort
:brain: (One line code changes, find and replace, exposing a new column, minor logic changes.)
:brain: :brain: (Multiple logic changes across staging and core models and tests.)
:brain: :brain: :brain: (If 3 or more brains, please book a walk-through meeting with the reviewer, or consider breaking into multiple PRs.)

### Testing
Describe the testing you performed. Add SQL statements, sample output, and screenshots as necessary.

### Looker Impact
Does this change impact Looker? If yes, include a concise description and connect to all related issues or PRs

### Jira Issue(s)
DA-xxxx

### Additional Context
Add links to related Slack threads, Jira request issues, etc. Delete this section if not required.
* [Slack thread](URL)
* [Jira request issue](URL)

### Checklist
Check off applicable items. Delete lines that are not applicable.
* [ ] I put the Jira issue key in the pull request title (DA-xxx: Title)
* [ ] I added or updated tests
* [ ] I added or updated documentation
* [ ] I converted timestamps to the correct timezone
* [ ] I added the sdc_deleted_at macro into new staging models
* [ ] I materialized the models appropriately