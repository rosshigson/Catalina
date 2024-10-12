binser = require "binser"

local template = {
	"name", "age", "salary", "email",
	nested = {"more", "nested", "keys"}
}

local Employee_MT = {
	name = "Employee",
}

local joe = setmetatable({
	name = "Joe",
	age = 11,
	salary = "$1,000,000",
	email = "joe@example.com",
	nested = {
		more = "blah",
		nested = "FUBAR",
		keys = "lost"
	}
}, Employee_MT)

-- Print length of serialized employee without templating
-- 117
binser.registerClass(Employee_MT)
print(#binser.s(joe))
binser.unregister(Employee_MT)

-- Print length of serialized employee with templating
-- 72
Employee_MT._template = template
binser.registerClass(Employee_MT)
print(#binser.s(joe))

print();
print("UNTEMPLATED EXAMPLE STARTS HERE!!!")

Shared = {
   int = 45000000, 
   flt = -1.234e-5, 
   nested = {4, 8, 12, 16}, 
   str = "Hello, World!", 
   func = function() return "aye" end
}

print();
print("SHARED:")
for k, v in pairs(Shared) do
  print(k, v)
end
print();

local mydata = binser.serialize(Shared);

print("SERIALIZED LENGTH:")
print(#mydata);

print("SERIALIZED BYTES:")
print(string.byte(mydata, 1, #mydata));

-- deserialize the string. 
-- Note: The result is a table of possibly multiple values, 
-- so if we just want the first entry, we must either do:
--   Copy = binser.deserialize(mydata)[1];
--or:
--   Copy = binser.deserializeN(mydata, 1);
Copy = binser.deserialize(mydata)[1];

print();
print("COPY:")
for k, v in pairs(Copy) do
  print(k, v);
end
print();

print("FUNCTION TEST:")
print(Copy.func());

print();
print("TEMPLATED EXAMPLE STARTS HERE!!!")

local Shared_template = {
	"int", "flt", nested = {"a", "b", "b", "d"}, "str", "func"
}

local Shared_MT = {
	name = "Shared",
}

Shared = {
   int = 45000000, 
   flt = -1.234e-5, 
   nested = {4, 8, 12, 16}, 
   str = "Hello, World!", 
   func = function() return "aye" end
}

setmetatable(Shared, Shared_MT);

Shared_MT._template = Shared_template;

binser.registerClass(Shared_MT);

local mytdata = binser.serialize(Shared);

print("SERIALIZED LENGTH:");
print(#mytdata);

print("SERIALIZED BYTES:");
print(string.byte(mytdata, 1, #mytdata));

-- deserialize the string (see note above).
Templated_Copy = binser.deserializeN(mytdata, 1);

print();
print("TEMPLATE COPY:");
for k, v in pairs(Templated_Copy) do
  print(k, v);
end
print();

print("FUNCTION TEST:");
print(Templated_Copy.func());
