## Aggregation zip codes for testing

### Import sample data
Connect to server created and run:

    curl -OL http://media.mongodb.org/zips.json
    mongoimport --db scratch --collection zipcodes --file zips.json
    mongo scratch
    

### Shard DB and collection
You can now shard your database running following commands, we will use state as sharding key just for testing purposes:

    db.zipcodes.ensureIndex({"state":1})
    sh.enableSharding("scratch")
    sh.shardCollection("scratch.zipcodes",{"state":1})
    
    
### Check sharding status
Use following commands to check sharding status
  
    sh.status()
    db.zipcodes.getShardDistribution()
    
    
### Test Aggregation Framework with sample data
You can now follow MongoDB tutorial [Aggregation with the Zip Code Data Set](http://docs.mongodb.org/manual/tutorial/aggregation-zip-code-data-set/) and test your devevelopment sharded environment.

Have fun!


