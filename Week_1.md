## Task 2
Doc blcoks added. I would have done a more comprehensive job given more time but have added almost all for this project purposes.
I was a bit confused as i was thinking of creating a PR and then adding details steps on the changes (but it might have been an overkill)

## Task 3
- Created `fct_events.yml` and primary key tests 
- Renamed `mrr` to `fct_mrr`. Although this is more of a OBT than fact, i wanted to keep it simple
-  Created a new folder `utils` to have the `dim_dates` dimension housed on marts layer. end users might benefit by using this table for joining/aggs 
- Added dim_dates to seed as exception - I chose to add an exception to the exceptions seed file because dim_dates does not have a source table and is using a macro to calculate the date spine