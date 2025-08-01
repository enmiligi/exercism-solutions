BEGIN {
    output = "";
    if (num % 3 == 0) output = output "Pling";
    if (num % 5 == 0) output = output "Plang";
    if (num % 7 == 0) output = output "Plong";
    if (!output) output = num;
    print output;
}
