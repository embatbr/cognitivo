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

    height_over_tube DECIMAL NOT NULL CHECK (height_over_tube >= 0),
    bolt_pattern_long DECIMAL CHECK (bolt_pattern_long >= 0),
    bolt_pattern_wide DECIMAL CHECK (bolt_pattern_wide >= 0),

    groove BOOLEAN NOT NULL,

    base_diameter DECIMAL CHECK (base_diameter >= 0),
    shoulder_diameter DECIMAL CHECK (shoulder_diameter >= 0),

    unique_feature BOOLEAN,
    orientation BOOLEAN,

    weight DECIMAL CHECK (weight >= 0),

    PRIMARY KEY (id)
);


CREATE TABLE materials (
    id CHAR(8) NOT NULL,

    component_id_1 CHAR(6),
    quantity_1 INTEGER CHECK (quantity_1 >= 0),

    component_id_2 CHAR(6),
    quantity_2 INTEGER CHECK (quantity_2 >= 0),

    component_id_3 CHAR(6),
    quantity_3 INTEGER CHECK (quantity_3 >= 0),

    component_id_4 CHAR(6),
    quantity_4 INTEGER CHECK (quantity_4 >= 0),

    component_id_5 CHAR(6),
    quantity_5 INTEGER CHECK (quantity_5 >= 0),

    component_id_6 CHAR(6),
    quantity_6 INTEGER CHECK (quantity_6 >= 0),

    component_id_7 CHAR(6),
    quantity_7 INTEGER CHECK (quantity_7 >= 0),

    component_id_8 CHAR(6),
    quantity_8 INTEGER CHECK (quantity_8 >= 0),

    PRIMARY KEY (id)
    -- No foreign key constraint. There will happen violations.
);
