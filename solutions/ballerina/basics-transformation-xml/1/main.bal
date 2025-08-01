import ballerina/io;

type FillUpEntry record {|
    int employeeId;
    int odometerReading;
    decimal gallons;
    decimal gasPrice;
|};

type FillUpEntryByEmployee map<FillUpEntry[]>;

type EmployeeFillUpSummary record {|
    int employeeId;
    int gasFillUpCount;
    decimal totalFuelCost;
    decimal totalGallons;
    int totalMilesAccrued;
|};

xmlns "http://www.so2w.org" as s;

function processFuelRecords(string inputFilePath, string outputFilePath) returns error? {
    xml input = check io:fileReadXml(inputFilePath);
    FillUpEntryByEmployee fillups = {};
    foreach var fillup in input/<s:FuelEvent> {
        var employeeId = check int:fromString(check fillup.employeeId);
        var odometerReading = check int:fromString((fillup/<s:odometerReading>/*).toString());
        var gallons = check decimal:fromString((fillup/<s:gallons>/*).toString());
        var gasPrice = check decimal:fromString((fillup/<s:gasPrice>/*).toString());
        var entry = fillups[employeeId.toString()];
        if entry is () {
            fillups[employeeId.toString()] = [{employeeId, odometerReading, gallons, gasPrice}];
        } else {
            entry.push({employeeId, odometerReading, gallons, gasPrice});
        }
    }

    EmployeeFillUpSummary[] summary = [];
    foreach var employee in fillups.keys() {
        int employeeId = check int:fromString(employee);
        var fillup = fillups[employee];
        if fillup is () {
        }
        else {
            int gasFillUpCount = fillup.length();
            decimal totalFuelCost = 0;
            decimal totalGallons = 0;
            int totalMilesAccrued =
                fillup[gasFillUpCount - 1].odometerReading - fillup[0].odometerReading;
            foreach var fill in fillup {
                totalGallons += fill.gallons;
                totalFuelCost += fill.gasPrice * fill.gallons;
            }
            summary.push({employeeId, gasFillUpCount, totalFuelCost, totalGallons, totalMilesAccrued});
        }
    }
    summary =
        from var employee in summary
    order by employee.employeeId ascending
    select employee;
    xml records = from var employee in summary
        select
                check xml:fromString(
                string `<s:employeeFuelRecord employeeId="${employee.employeeId}" xmlns:s="http://www.so2w.org">` +
                    string `<s:gasFillUpCount>${employee.gasFillUpCount}</s:gasFillUpCount>` +
                    string `<s:totalFuelCost>${employee.totalFuelCost}</s:totalFuelCost>` +
                    string `<s:totalGallons>${employee.totalGallons}</s:totalGallons>` +
                    string `<s:totalMilesAccrued>${employee.totalMilesAccrued}</s:totalMilesAccrued>` +
                string `</s:employeeFuelRecord>`);
    xml:Element result = xml `<s:employeeFuelRecords>${records}</s:employeeFuelRecords>`;
    check io:fileWriteXml(outputFilePath, result);
}
