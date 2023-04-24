flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# above code leads to a nested array:
# ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# un-nest the above array:
p flintstones.flatten! # ! mutates the caller
