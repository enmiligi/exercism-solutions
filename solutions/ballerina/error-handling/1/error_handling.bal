import ballerina/io;
import ballerina/http;

// Use the following endpoints to send HTTP GET request to get quotes

// This is an existing endpoint (which will be automatically spawned by the test framework)
final http:Client brainyQuoteClient = check new ("http://localhost:9095/brainyquote");

// This is a non-existing endpoint.
final http:Client legacyClient = check new ("http://localhost:6060/legacyquote");

public function main() returns error? {
    string|error brainyQuote = brainyQuoteClient->get("/");
    if brainyQuote is string {
        io:println(brainyQuote);
    } else {
        io:println(brainyQuote.message());
    }

    string|error legacy = legacyClient->get("/");
    if legacy is string {
        io:println(legacy);
    } else {
        io:println(legacy.message());
    }

    string legacyChecked = check legacyClient->get("/");
}
