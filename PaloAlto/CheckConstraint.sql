-- CHECK constraint is used to impose certain conditions on the particular column
-- If a row is inserted or updated with data that does not follow the CHECK constraint's rule, the operation will fail.
CREATE TABLE ad_campaigns (
    budget DECIMAL(10,2) NOT NULL CHECK (budget > 0),
    cost_per_click DECIMAL(10,2) NOT NULL CHECK (cost_per_click > 0)
);