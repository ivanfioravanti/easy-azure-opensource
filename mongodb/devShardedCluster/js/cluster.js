function pad(number, length) {
    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }
    return str;
};

for (var i = 0; i < numOfShards; i++) {
	sh.addShard( "localhost:270" + pad(i,2));
};
sh.status();
