import ballerina/http;

// Implement an HTTP service listening on port 9090 with the root path "/"
service / on new http:Listener(9090) {
    resource function get greeting() returns string => "Hello, World!";
}
