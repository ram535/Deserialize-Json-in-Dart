# Gotchas

In the class Student, we expect that the variable classes be of the type
List<String> but the variable parsedJson['classes'] is of type List<dynamic>.

So we need to cast it to string using:

parsedJson['classes'].cast<String>();
