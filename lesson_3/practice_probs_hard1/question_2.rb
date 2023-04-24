# Expected result of the last line:
# { a: "hi there" }
# I expect the value of the greetings hash to have been permanently mutated 
# through the use of the #<< method call on informal_greeting
# informal_greeting is assigned initially to reference the value of the <a> key in the greetings hash
# so, informal_greeting and greetings initially reference the same value associated with the <a> key
# when #<< is called on informal_greeting a new value isn't created, but rather the original value 
# is mutated, so the value referenced by the informal_greeting and the value of the greetings hash have been mutated 
# to reference the String whose value is "hi there"