# A Relational Database for Radiation Protection in Uranium Mining

A relational database for radiation protection in uranium mining is designed, implemented and tested.

A MariaDB server running on EndeavourOS was used to run all SQL scripts.

A `setup.sh` bash script is provided in the repo's topmost directory. This script creates a database called radiation_protection and then runs three SQL scripts from the sql directory. The first script `create-tables.sql` creates the tables of the database. The second script `insert-into-tables.sql` inserts fictitious data into the tables. The third script `create-views.sql` creates five views that serve to generate reports that would be useful to radiation-safety professionals.

A detailed project report can be found in `project-report.md` including discussions of business rules, ERDs, normalization, and views.