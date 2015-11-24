The files in this directory are archived from the latest copy of the
Sarangworld Traceroute Project when it was still alive:

  - patterns.*: The text and HTML versions of the patterns used to
  match hostnames. The HTML version provides a brief explanation of
  how the pattern matching process works.

  - cidrloc.csv: A CSV of IP address locations. Most fields are
  self-explanatory, but:

    * startnum and endnum are the integer values of the startip and endip

    * the file uses the string "NULL" to represent empty or null
    values, which is technically incorrect

    * the whois_record field exists, but is unused (always "NULL")

  - codecity.csv: CSV file that converts from codes to city
  names (however, see the note for "usplaces.csv and
  worldplaces.csv", which greatly expands the number of matching
  codes). Most fields are self-explanatory: things like
  "20021225.164639" in the comments field indicate the time (in
  yyyymmdd.hhmmss format, US Mountain Time) at which I added the
  code/city translation (not sure how useful that is, though).

  - showdb.html: An HTML version of codecity.csv and cidrloc.csv in a
  slightly different format. Also includes more explanation of how the
  Sarangworld Traceroute Project worked.

  - usplaces.csv and worldplaces.csv: CSV versions of tables used to
  convert city names to latitude and longitude, and to provide
  significant additional matching. For example, this entry in
  usplaces.csv:

Corpus Christi,TX,277454,27.742857,-97.401927,US CENSUS 2000,21570

means that the code "corpus.christi.tx" would be matched, even though
it doesn't appear in codecity.csv. Even "corpus-christi.tx" would be
matched. The SQL query used to achieve this:

<pre>
SELECT code, a.city AS city, a.state AS state, a.country AS country,
lat, lon FROM codecity a, usplaces b
WHERE a.city=b.city AND a.state=b.state AND a.country='USA' AND
code in ($codes)
UNION
SELECT code, a.city AS city, a.state AS state, a.country AS country, lat, lon
FROM codecity a, worldplaces b
WHERE a.city=b.city AND (a.state=b.state or (a.state IS NULL and
b.state IS NULL)) AND a.country=b.country AND code in ($codes)
UNION
SELECT LOWER(state)||'.'||LOWER(REPLACE(city,' ','-'))) AS code,
city, state, 'USA' AS country, lat, lon FROM usplaces WHERE
LOWER(state)||'.'||LOWER(REPLACE(city,' ','-'))) IN ($codes)
</pre>

where $codes is a variable representing the list of codes to query,
for example:

$codes = ('alb.nm', 'brhmal', 'nsvltn');

(I haven't released the source code, but $codes is defined within my
traceroute script)

</pre>

  - faq.txt: Text version of the FAQ that once appeared on the
  Sarangworld Traceroute Project site. It is no longer necessarily
  accurate.

  - missing-codes.txt: A handful of codes that should be in
  codecity.csv, but aren't. Since I am reproducing existing files, I
  didn't want to add them manually, especially since there may be a
  reason (now long-forgotten) why I didn't include them in
  codecity.csv
