# Cognitivo.AI Test

## Structure

### Hierarchy

Here is the hierarchy of objects, from most to least granular (#1 up to #3):

1. Component:
    - Basically, a **pipe**.
2. Material:
    - A **set of pipes**.
    - A construction material may be composed of several components:
        - e.g., 3 straight pipes and 2 curved pipes, shaping a "U";
        - These 5 components may be similar or different.
3. Quotation:
    - The (possible) sale of an amount of Materials;
    - A possible sale of 100 "U shaped" pipe set.

## Implementation

- Database: PostgreSQL
- Loading: Bash and Python scripts

### Commands

Run script `db_actions.sh`, passing the command as parameter. Commands:

- `create` to create a local user and database. A new password will be required.
- `drop` to drop the local user and database.
- `up` to create the structures. A password will be required.
- `down` to drop the structures. A password will be required.
- `populate` to load the data from CSV files. A password will be required.
- `clean` to empty the tables. A password will be required.
- `access` to access the database **cognitivo** by terminal. A password will be required.
