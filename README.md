# Superloop G-NAF Import Tools for MySQL #

These tools are for manipulating G-NAF addressing data provided by [PSMA Australia](https://www.psma.com.au/).

## License ##

Copyright 2019 [Superloop Limited](https://www.superloop.com/) (ASX: SLC.) Released under the [BSD License](https://github.com/superloop-ltd/gnaf/blob/master/LICENSE) by the Geospatial Information Systems (GIS) Department.

## MySQL Import ##

To import data into [MySQL](https://www.mysql.com/) or [MariaDB](https://mariadb.org/), proceed with the following steps.

Delete old files if present:

```
git clone git@github.com:superloop-ltd/gnaf.git
cd gnaf
git clean -xdf
```

The download link can be found at [PSMA Geocoded National Address File (G-NAF)
](https://data.gov.au/dataset/geocoded-national-address-file-g-naf) under 'Files and APIs', then 'PSMA Geocoded National Address File (G-NAF)(ZIP).'

Download and unzip:

```
wget https://data.gov.au/data/dataset/19432f89-dc3a-4ef3-b943-5326ef1dbecc/resource/4b084096-65e4-4c8e-abbe-5e54ff85f42f/download/may19_gnaf_pipeseparatedvalue_20190521155815.zip
unzip `basename !$`
```

Ensure that you have at least 20 GB available on your `/var/lib/mysql` partition. Create database:

```
GNAFDB=GNAF_201905
mysql -u root -e "CREATE DATABASE $GNAFDB"
```

Pipe the generate SQL script into the MySQL database:

```
time ./import-mysql | tee /dev/tty | mysql -u root $GNAFDB
```

Allow a while for the import to process. It could take more than an hour depending on your hardware.

## Example Usage ##

### Locality-based Levenshtein Ranking ###

If the suburb/locality is known, this yields fast results:

```
SET @term = '7 HIGH STREET';
SET @locality_pid = 'SA1533';
SELECT ft.*, LEVENSHTEIN_RATIO(SUBSTRING(address_search, LOCATE(SUBSTRING_INDEX(@term, ' ', 1), address_search), LENGTH(@term)), UPPER(@term)) similarity
FROM ADDRESS_SEARCH ft
JOIN LOCALITY l ON (ft.locality_pid = l.locality_pid AND l.locality_pid = @locality_pid)
ORDER BY similarity DESC, LENGTH(address_search)
LIMIT 10;
+--------------------+-----------------------------------+---------------------+--------------+--------------------+
| address_detail_pid | address_search                    | street_locality_pid | locality_pid | similarity         |
+--------------------+-----------------------------------+---------------------+--------------+--------------------+
| GASA_415021401     | 7 HIGH STREET WILLUNGA SA         | SA539103            | SA1533       |                  1 |
| GASA_415430576     | 47 HIGH STREET WILLUNGA SA        | SA539103            | SA1533       |                  1 |
| GASA_415470767     | 57 HIGH STREET WILLUNGA SA        | SA539103            | SA1533       |                  1 |
| GASA_415481574     | 27 HIGH STREET WILLUNGA SA        | SA539103            | SA1533       |                  1 |
| GASA_416983326     | 17 HIGH STREET WILLUNGA SA        | SA539103            | SA1533       |                  1 |
| GASA_422049207     | 37 HIGH STREET WILLUNGA SA        | SA539103            | SA1533       |                  1 |
| GASA_415679672     | UNIT 2 37 HIGH STREET WILLUNGA SA | SA539103            | SA1533       |                  1 |
| GASA_415679673     | UNIT 3 37 HIGH STREET WILLUNGA SA | SA539103            | SA1533       |                  1 |
| GASA_415677702     | UNIT 1 37 HIGH STREET WILLUNGA SA | SA539103            | SA1533       |                  1 |
| GASA_415112700     | 7 WAYE STREET WILLUNGA SA         | SA509855            | SA1533       | 0.6923076923076923 |
+--------------------+-----------------------------------+---------------------+--------------+--------------------+
10 rows in set (0.03 sec)
```

This requires the [Levenshtein UDF](https://github.com/juanmirocks/Levenshtein-MySQL-UDF).

### Full-text ###

Fulltext search is currently experimental. We recommend using [Elasticsearch](https://www.elastic.co/products/elasticsearch).
