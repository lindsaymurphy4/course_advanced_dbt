## Task 2: Doc Blocks

* Added doc blocks for all columns and tables in the Bingeflix data source.
* Created a new doc block file for the ads platform.
* Replaced all table and column descriptions in source yml and stg yml with doc block.
    * I did not replace downstream references with doc blocks just to save myself some time. But recognize this is one of the primary benefits of using doc blocks.
    * IRL I would probably identify high priortiy columns based on usage in joins and key metrics and prioritize that way.

## Task 3: Project Evaluator

* Added missing `fct_events.yml`. This resolved 4 issues realting to documentation coverage, undocumented models, missing pk tests, and test coverage.
* Renamed `mmr.sql` to `fct_mrr.sql`.
* Added source description to `source_ads_platform.yml`.
* Added `stg_bingeflix__events` to `dbt_project_evaluator_exceptions.csv` to ignore this table from `is_empty_fct_model_fanout_`.
* Added freshness tests on `source_ads_platform.yml` and `source_bingeflix.yml`.
    * Without much context on this data I'm not convinced this was the best decision. It may have been better to mark the test as ignore and add freshness checks where it intuitively makes sense (events on created date, user on created date, etc).

## Optional: sqlfluff

* Capitalized keywords and changed to leading commas.
