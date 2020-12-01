---
layout:     post
title:      MetaProgramming
date:       2020-11-30
summary:    In two minutes, what is a Recurrent Neural Network basically doing?
categories: machine-learning neural-networks drawing recurrent-neural-network
---
Before I begin, let’s remember that everything is an object in Python.
A function, constant, variable, literally everything is an object. To elaborate, even a class is an object. As a result, we can treat a class as any other object and pass the class as a parameter, store it, and modify it at runtime.
A class is an object that can be used to instantiate new objects. A class can be seen as a bucket that groups the objects. It defines the protocols/rules for the objects that it creates. A metaclass is above a class. It groups a set of classes together. We can have meta-information about classes within a metaclass.


We can start by creating our own metaclass. The first step is to create a class that inherits from the type, type.
The type will add additional behavior to the new metaclass. A class can only have one metaclass.
class FinTechExplainedMeta(type):
The snippet of code above shows that we have created a new metaclass called FinTechExplainedMeta.
The key point to note is that a metaclass in defined by inheriting from type.
When we create a class, we can set the metaclass attribute to a metaclass that is inherited from type.

The metaclass will have a __new__ method that calls type.__new__ method.
class FinTechExplainedMeta(type):
    def __new__(cls, what, bases=None, dict=None):
        return type.__new__(cls, what, bases, new_dict)
The metaclass has essentially access to the class name, its parents, and all of the attributes.
We can now add validation rules in the Meta.__new__ method and validate all of the parameters.
We can use the magic methods of Python programming language to override the behaviour so that any class that makes our new class as the Metaclass will now need to conform to the rules.
__new__() is another example of metaprogramming. It creates new class instances and it is not bound to an instance of the class in nature. This method is called before __init__() is called. We can override the super class’s __new__().
The return of the __new__() method is the instance of the class. This is useful when we want to modify the creation of immutable data types such as tuple.
Now I am going to modify the __new__ method of the FinTechExplainedMeta class and check that the class has a method ‘get_blog’.
class FinTechExplainedMeta(type):
    def __new__(cls, what, bases=None, dict=None):
        print(dict)
        if 'get_blog' in dict:
            print('Great you have get_blog')
        else:
            raise Exception('get_blog missing')
        return type.__new__(cls, what, bases, dict)
Now I will create a new class called FinTechExplained (as above) and have the FinTechExplainedMeta as its metaclass.
class FinTechExplained(metaclass=FinTechExplainedMeta):
    pass
Notice, how setting the metaclass attribute at the class level is required.
As a result, when I run this code, even before instantiating the FinTechExplained object, it will break as soon as the module is loaded:

