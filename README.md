**Ingest Data**

`./ingest/ingest.sh ingest/lookup-ingest-spec.json`


**Query Simple Data**

```
$ ./query/query.sh query/query-simple.json

[ {
  "timestamp" : "2018-11-01T21:39:00.000Z",
  "result" : [ {
    "Count" : 3312.0,
    "Country Code" : "us"
  }, {
    "Count" : 428.0,
    "Country Code" : "gb"
  }, {
    "Count" : 310.0,
    "Country Code" : "ca"
  }, {
    "Count" : 180.0,
    "Country Code" : "au"
  }, {
    "Count" : 144.0,
    "Country Code" : "es"
  }, {
    "Count" : 132.0,
    "Country Code" : "de"
  }, {
    "Count" : 124.0,
    "Country Code" : "fr"
  }, {
    "Count" : 88.0,
    "Country Code" : "ie"
  }, {
    "Count" : 54.0,
    "Country Code" : "nz"
  }, {
    "Count" : 36.0,
    "Country Code" : "ng"
  } ]
} ]
```


**Submit Lookup Spec**

- Initialize

    For the first time you’re submitting lookup to Druid coordinator, you may get the following error:

    `{"error":"Not initialized. If this is the first lookup, post an empty map to initialize"}`
    
    In that case, you need to submit an empty json to initialize the lookup.

    `$ curl -H "Content-Type: application/json" --data {} http://localhost:8081/druid/coordinator/v1/lookups/config`

    Now Submit one of the following lookup spec to druid coordinator. Remember to change the file uri in the spec.

    - Simple Json

        `$ curl -H "Content-Type: application/json" --data @lookup/simple-json-lookup-spec.json http://localhost:8081/druid/coordinator/v1/lookups/config`

    - Custom Json

        `$ curl -H "Content-Type: application/json" --data @lookup/custom-json-lookup-spec.json http://localhost:8081/druid/coordinator/v1/lookups/config`

    - CSV
    
        `$ curl -H "Content-Type: application/json" --data @lookup/csv-lookup-spec.json http://localhost:8081/druid/coordinator/v1/lookups/config`



**Check Lookup**

`$ curl -X GET http://localhost:8082/druid/listen/v1/lookups`



**Query lookup data**

```
$ ./query/query.sh query/query-lookup.json 

[ {
  "timestamp" : "2018-11-01T21:39:00.000Z",
  "result" : [ {
    "Country Name" : "United States",
    "Count" : 3312.0
  }, {
    "Country Name" : "United Kingdom",
    "Count" : 428.0
  }, {
    "Country Name" : "Canada",
    "Count" : 310.0
  }, {
    "Country Name" : "Australia",
    "Count" : 180.0
  }, {
    "Country Name" : "Spain",
    "Count" : 144.0
  }, {
    "Country Name" : "Germany",
    "Count" : 132.0
  }, {
    "Country Name" : "France",
    "Count" : 124.0
  }, {
    "Country Name" : "Ireland",
    "Count" : 88.0
  }, {
    "Country Name" : "New Zealand",
    "Count" : 54.0
  }, {
    "Country Name" : "Nigeria",
    "Count" : 36.0
  } ]
} ]
```

