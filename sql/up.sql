-- Creates all structures (types, tables and etc.).


CREATE TYPE component_type AS ENUM ('Boss', 'Stud');

CREATE TYPE component_outside_shape AS ENUM ('Round', 'Hex');

CREATE TYPE component_base_type AS ENUM ('Flat Bottom', 'Shoulder', 'Saddle');

CREATE TABLE components (
    id CHAR(6) NOT NULL,

    type_id CHAR(6) NOT NULL,
    type component_type,
    connection_type_id VARCHAR(5) NOT NULL,
    outside_shape component_outside_shape,
    base_type component_base_type,

    height_over_tube DECIMAL NOT NULL,
    bolt_pattern_long DECIMAL,
    bolt_pattern_wide DECIMAL,

    groove BOOLEAN NOT NULL,

    base_diameter DECIMAL,
    shoulder_diameter DECIMAL,

    unique_feature BOOLEAN,
    orientation BOOLEAN,

    weight DECIMAL,

    PRIMARY KEY (id)
);
