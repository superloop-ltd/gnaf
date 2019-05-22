# Superloop G-NAF Import Tools for MySQL #

These tools are for manipulating G-NAF addressing data provided by PSMA.

## MySQL Import ##

To import data into MySQL or MariaDB, proceed with the following steps.

Delete old files if present:

```
git clean -xdf
```

The download link can be found at https://data.gov.au/dataset/geocoded-national-address-file-g-naf under 'Data and Resources', 'PSMA Geocoded National Address File', 'Explore', 'Go to resource.'

Download and unzip:

```
wget https://data.gov.au/dataset/19432f89-dc3a-4ef3-b943-5326ef1dbecc/resource/4b084096-65e4-4c8e-abbe-5e54ff85f42f/download/feb18gnafpipeseparatedvalue20180219141901.zip
unzip `basename !$`
```

Pipe the generate SQL script into the MySQL database:

```
./import-mysql | mysql -u root GNAF_201802
```

Or, if you want to watch the queries as they run and receive a record of how long the import took to execute in seconds:

```
time ./import-mysql | tee /dev/tty | mysql -u root GNAF_201802
```

Allow time for the import to process. It could take more than an hour.

Optionally, import postcode data:

```
cpan LWP::Simple Text::CSV
./postcodes-mysql | mysql -u root GNAF_201802
```

## License ##

This code is not covered by warranty or license. It is shared in the 
public domain. Published by NuSkope Pty Ltd.

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
