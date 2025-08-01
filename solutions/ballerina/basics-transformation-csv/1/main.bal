import ballerina/io;

type InputEntry record {|
    readonly int employee_id;
    int odometer_reading;
    decimal gallons;
    decimal gas_price;
|};

type InputEntryByEmployee record {|
    readonly int employee_id;
    InputEntry[] entries;
|};

type OutputEntries record {|
    readonly int employee_id;
    int gas_fill_up_count;
    decimal total_fuel_cost;
    decimal total_gallons;
    int total_miles_accrued;
|}[];

function processFuelRecords(string inputFilePath, string outputFilePath) returns error? {
    string[][] csv = check io:fileReadCsv(inputFilePath);
    csv = csv.'map(ss => ss.'map(s => s.trim()));
    InputEntry[] entries =
        from var entry in csv
    let var employee_id = check int:fromString(entry[0])
    let var odometer_reading = check int:fromString(entry[1])
    let var gallons = check decimal:fromString(entry[2])
    let var gas_price = check decimal:fromString(entry[3])
    select {employee_id, odometer_reading, gallons, gas_price};
    table<InputEntryByEmployee> key(employee_id) inputEntries = table [];
    foreach InputEntry entry in entries {
        var entriesThere = inputEntries[entry.employee_id];
        if entriesThere is () {
            inputEntries.put({employee_id: entry.employee_id, entries: [entry]});
        } else {
            entriesThere.entries.push(entry);
        }
    }
    string[][] outputEntries = [];
    foreach InputEntryByEmployee entry in inputEntries {
        var lastEntry = entry.entries[entry.entries.length() - 1];
        var total_miles_accrued = lastEntry.odometer_reading - entry.entries[0].odometer_reading;
        var gas_fill_up_count = entry.entries.length();
        var total_fuel_cost = 0.0d;
        var total_gallons = 0.0d;
        foreach var fillup in entry.entries {
            total_gallons += fillup.gallons;
            total_fuel_cost += fillup.gas_price * fillup.gallons;
        }
        outputEntries.push([
            entry.employee_id.toString(),
            gas_fill_up_count.toString(),
            total_fuel_cost.toString(),
            total_gallons.toString(),
            total_miles_accrued.toString()
        ]);
    }
    check io:fileWriteCsv(outputFilePath, outputEntries.sort(), io:OVERWRITE);
}
