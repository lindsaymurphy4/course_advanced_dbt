# Welcome to the Bingeflix Data Team

## First-Time Setup
#### Part 1: Setup Snowflake account

Use the information below to log in to the course Snowflake instance:

- URL: https://efruuit-zh04827.snowflakecomputing.com/
- Username: Your username will be the email you use to login to CoRise, with non-alphanumeric characters removed.

Here are some examples of how to derive your username from your email.
sourabh@corise.com  ➡ sourabhcorisecom
sourabh.bajaj@corise.com ➡ sourabhbajajcorisecom
Sourabh.BAJAJ.1234@gmail.com ➡ SourabhBAJAJ1234gmailcom

- Password: ADD PASSWORD (you'll be prompted to change this, remember to save this password)
- Once logged into Snowflake, ensure you have access to the TRANSFORMER role (each student will be using their own custom schema)

#### Part 2: Set up your GitHub repo

We'll be setting up our GitHub fork. Below are the steps you will need to take. Please review the visual walk-through for more detail.

- Make sure you have a GitHub (https://github.com/) account.
- Go to the course project repo at https://github.com/lindsaymurphy4/bingeflix
- Create a fork of the main repo to create your own copy
- Copy the URL of the fork. It should be something like  https://github.com/<GITHUB_USERNAME>/bingeflix

#### Part 3: Setting up Gitpod
Next, you'll set up Gitpod using the repo fork you just created. Follow the steps below to set this up:
- Go to gitpod.io and click Dashboard (or Login) in the top right corner
- Click 'Continue with GitHub' to log in if you are not already logged in
- Enter your GitHub credentials
- Select the editor you'd like to use (VSCode in Browser is our default, but you'll see you can choose others if you prefer)
- Click Continue to open the workspace (this may take a few minutes)
- Explore the workspace
- You'll need to "Pin" your workspace so that it doesn't get Archived after 14 days, and always "Stop" your workspace so that you don't run out of hours. See video on CoRise week 0 for how to do so.

#### Part 4: Install dbt inside of a virtual environment
We'll go over virtual environments in more detail during week 1, but for now, you can follow these instructions to get dbt installed:
- In the terminal, run `cd /workspace/` to navigate to the workspace directory of Gitpod (important: this ensures the virtual environment will be retained across Gitpod sessions)
- Run `touch Pipfile` to create the Pipfile
- Run `open Pipfile` to open the file you just created

Copy and paste the following into the Pipfile:

```
[[source]]
url = "https://pypi.org/simple"
verify_ssl = true
name = "pypi"

[packages]
dbt-core = "==1.5.0"
dbt-snowflake = "==1.5.0"
sqlfluff = "==2.1.1"
sqlfluff-templater-dbt = "==2.1.1"

[requires]
python_version = "3.11"
```

- Run `pip install pipenv` to install the pipenv tool
- Run `pipenv install` to create the virtual environment and install the packages inside of the Pipfile (this may take a few moments, you should see installation logs in your terminal)
- Run `pipenv shell` to activate the virtual environment
- Run `dbt --version` to confirm that dbt has been installed properly
- Important: you will need to activate the virtual environment each time you open Gitpod by running `pipenv shell`. dbt is installed inside of this virtual environment, so if it is not activated, you will not have access to run dbt.

#### Part 5: Setup your profiles.yml file

Create the profiles.yml file

While still within the /workspace/ directory, navigate to the hidden folder by running cd .dbt

Run ls -a to list all contents, including hidden folders, inside a directory.

Run touch profiles.yml to create a new file

Run open profiles.yml to open the file you just created

Copy and paste the following credentials into the new profiles.yml file you just created:

```
advanced_dbt:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: efruuit-zh04827
      user: <ADD YOUR SNOWFLAKE USER NAME>
      password: <ADD YOUR SNOWFLAKE PASSWORD>
      role: transformer
      database: dev
      warehouse: transforming
      schema: dbt_<YOUR SNOWFLAKE USERNAME>
      threads: 4
```
Open your dbt_project.yml file and add the following to the bottom of the file (this will tell dbt where to look for the profiles.yml file)

```
vars:
  # This tells dbt where to look for the profiles.yml file.
  # profiles.yml must be stored in /workspace/.dbt to persist across Gitpod sessions
  DBT_PROFILES_DIR: /workspace/.dbt/
```

Run cd /workspace/advanced_dbt to navigate to the folder that contains the dbt_project.yml file

Validate that dbt can connect with Snowflake by running dbt debug

Since we're not storing the profiles.yml file in the standard place that dbt looks for it (at the root folder in a .dbt hidden folder), you may need to tell Gitpod where to find the profiles.yml file. You can specify this by running:

`export DBT_PROFILES_DIR=/workspace/.dbt/`

Awesome! You are now ready to start the course! 🚀🚀🚀

### Coding Conventions
#### General
- Use UPPER case for all keywords
- Use trailing commas in SELECT statements
- Use Snowflake dialect
- Use consistent style in GROUP BY and ORDER BY (either names or numbers, not both)



### Testing Conventions
#### Sources
- The primary key source column must have not_null and unique generic tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.

#### Models
- The primary key column must have not_null and unique schema tests.
- All boolean columns must have an accepted_values schema test. The accepted values are true and false.
- Columns that contain category values must have an accepted_values schema test.
- Columns that should never be null must have a not_null schema test.
- Columns that should be unique must have a unique schema test.
- Where possible, use schema tests from the dbt_utils or dbt_expectations packages to perform extra verification.