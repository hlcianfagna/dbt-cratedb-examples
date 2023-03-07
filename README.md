# Exercises for dbt-cratedb


## About

Example support files using the [CrateDB adapter plugin for dbt].


## Prerequisites

- A recent Python installation is required. If you need it, head over to
  https://www.python.org/downloads/
- PostgreSQL: Consider the installation required for the operating system as given at
  https://www.postgresql.org/download/
- Git: Download and install as directed at https://git-scm.com/downloads depending on
  the operating system used.
- Additional considerations:
  - On Windows, it may be required to enable "developer mode" and "long paths", 
    and install visual C++ build tools.
  - On Windows, it is necessary to include the environment variables to be able
    to run both programs from cmd or powershell.


## Setup

```shell
python3 -m venv .venv
source .venv/bin/activate
pip install dbt git+https://github.com/crate-workbench/dbt-cratedb2
```

## Usage

### Profile configuration

By default, the `profiles.yaml` file, where the available database connections
are configured, is located at `~/.dbt/profiles.yml`. The content of this file
will depend on the database connection. For this particular example considering
the CrateDB adapter, the content of this file should be similar to the following.
```yaml
crate:
  outputs:
    dev:
      type: cratedbadapter
      threads: 1
      host: <IP of DB>
      port: 5432
      user: crate
      database: ""
      schema: dbt_dev
  target: dev
```

### Project initialization

To initialize a new dbt project, run the following command.
```shell
dbt init example-dbt
```

This will create a directory containing multiple directories and files.

### Copying csv files to their respective directories

After initializing the dbt project, save the contents of each directory inside
the `example_files` directory of this repository, with its respective directory
in the dbt project as follows.

 * example_files/csv_files -> data
 * example_files/models_files -> models
 * example_files/snapshots_files -> snapshots
 * example_files/tests_files -> tests
 * example_files/analysis_files -> analysis
 * example_files/dbt_project.yml -> ./dbt_project.yml

Additionally, the content of the `dbt_project.yml` file in the dbt project is
replaced by the content in the `example_files` directory of this repository.

### Useful dbt commands

```shell
# Load raw data into CrateDB
dbt seed

# Validate conditions specified in the tests
dbt test

# Generate new tables resulting from the transformations
dbt run

# Generate snapshots
dbt snapshot
 
# Generate docs
dbt docs generate
 
# http service
dbt docs serve
```


[CrateDB adapter plugin for dbt]: https://github.com/crate-workbench/dbt-cratedb2
