# README #

Exercises + Application Assignments from Ruby Object Oriented Programming course 120

Core Concepts of 120: 
i. Classes as blueprints for behaviors and attributes of objects
ii. Instance Variables vs Class Variables
iii. Scoping rules for class variables, instance variables, and constants
iv. Class Methods vs Instance Methods
v. Setter and Getter Methods
vi. Class Inheritance vs Interface Inheritance
vii. Overriding as a property of inheritance
      - intentional overriding (typical for #to_s)
      - unintentional overriding
 viii. Usages of Modules:
      - Namespacing: grouping related classes within a module
      - Extracting logic of common behaviors to one place and sharing amongst a variety of classes via mixins
      - Containers for methods that don't have another place to be stored (module methods)
ix. Collaborator Objects
x. Polymorphism
       - Polymorphism via Duck Typing
       - Polymorphism via Class Inheritance
       - Polymorphism via Interface Inheritance
xi. Method Lookup Path & Super
xii. Method Access Control via Private, Protected, and Public methods
xiii. Encapsulation
      - Encapsulation via Method Access Control to hide functionality
      - Encapsulation via instance variables scoped at the object level
xiv. Equivalence
      - #== method
          - default implementation compares whether 2 objects are the same
          - often overwritten to compare 2 values
      - #=== method
          - implicitly used w/in case statements and compares whether one object belongs
             to another group
      - #equal? method
          - compares whether 2 objects are the same
      - #eql? method
          - compares if the caller and argument have the same value & are in the same class
xv. Self
      - References calling object w/in an instance method
      - Clarifies when a setter method is being called w/in an instance method
      - Prepended to a method definition to signify that method is a class method definition
      - When referred to inside a class, but outside an instance method, refers to the class itself
xvi. Other operators vs fake operators (actual methods)
