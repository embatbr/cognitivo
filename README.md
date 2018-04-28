# Cognitivo.AI Test

## Structure

### Hierarchy

Here is the hierarchy of objects, from most to least granular (#1 up to #3):

1. Component:
    - Basically, a **pipe**.
2. Materials:
    - A **set of pipes**.
    - A construction material may be composed of several components:
        - e.g., 3 straight pipes and 2 curved pipes, shaping a "U";
        - These 5 components may be similar or different.
3. Quotation:
    - The (possible) sale of an amount of Materials;
    - A possible sale of 100 "U shaped" pipe set.

## Implementation

- Database: PostgreSQL
- Loading: Bash scripts

### Commands

Run script `db_actions.sql`, passing the command as parameter
