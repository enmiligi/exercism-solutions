import ballerina/http;

# Add the necessary attributes to this record to accept two operands and an operator.
#
# + operand1 - Is a float used as the first operand in an equation
# + operand2 - Is a float used as the second operand in an equation
# + operator - Is a string that represents the operator
public type Calculation record {|
    float operand1;
    float operand2;
    string operator;
|};

# Add the necessary attributes to this record to include the result value and the expression.
#
# + result - The result of the operation
# + expression - The evaluated expression that used to calculate the result
public type Response record {|
    string expression;
    float result;
|};

service / on new http:Listener(9090) {
    resource function post calc(Calculation calc) returns Response {
        float result;
        match calc.operator {
            "+" => {
                result = calc.operand1 + calc.operand2;
            }
            "-" => {
                result = calc.operand1 - calc.operand2;
            }
            "x"|"*" => {
                result = calc.operand1 * calc.operand2;
            }
            "/" => {
                result = calc.operand1 / calc.operand2;
            }
            _ => {
                result = 0.0;
            }
        }
        string expression = string `${calc.operand1}${calc.operator}${calc.operand2}`;
        return {
            expression,
            result
        };
    }
}
