import ballerina/io;

type FillUpEntry record {|
    int employeeId;
    int odometerReading;
    decimal gallons;
    decimal gasPrice;
|};

type EmployeeFillUpSummary record {|
    int employeeId;
    int gasFillUpCount;
    decimal totalFuelCost;
    decimal totalGallons;
    int totalMilesAccrued;
|};

function processFuelRecords(string inputFilePath, string outputFilePath) returns error? {
    FillUpEntry[] fillupEntries = check (check io:fileReadJson(inputFilePath)).fromJsonWithType();
    map<FillUpEntry[]> fillupsByEmployee = {};
    foreach var entry in fillupEntries {
        var employeeEntry = fillupsByEmployee[entry.employeeId.toString()];
        if employeeEntry is () {
            fillupsByEmployee[entry.employeeId.toString()] = [entry];
        } else {
            employeeEntry.push(entry);
        }
    }
    EmployeeFillUpSummary[] summary = [];
    foreach var key in fillupsByEmployee.keys() {
        var employeeId = check int:fromString(key);
        var entry = fillupsByEmployee[key];
        if entry is () {
        }
        else {
            int gasFillUpCount = entry.length();
            decimal totalFuelCost = 0;
            decimal totalGallons = 0;
            int totalMilesAccrued = entry[gasFillUpCount - 1].odometerReading - entry[0].odometerReading;
            foreach var fillup in entry {
                totalGallons += fillup.gallons;
                totalFuelCost += fillup.gallons * fillup.gasPrice;
            }
            summary.push({
                employeeId,
                gasFillUpCount,
                totalFuelCost,
                totalGallons,
                totalMilesAccrued
            });
        }
    }
    summary =
        from var entry in summary
    order by entry.employeeId
    select entry;
    check io:fileWriteJson(outputFilePath, summary.toJson());
}
