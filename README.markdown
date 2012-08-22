# Child Talking to Parent Class Examples - Cocos2D

by Peter Matthews

- [Visit www.shakeyourapp.net/developer](http://www.shakeyourapp.net/developer)


## Information

It very easy to create a class and call one of its methods:

SomeClass *newClass = [SomeClass new];
[newClass callMethod];

But how do you get the class you created to talk back to the parent?

As with most coding you will find there are many different ways of tackling the same problem. 
This code shows three ways of communicating from child to parent:

*Delegation - probably the best and most used ways of child-parent communication

*Notifications - A very simple way of quickly communicating from one class to another

*Scheduling - A basic way of polling the class repeatedly to maintain communication 


## Tutorial

I have created a full online tutorial to accompany this code you can find this along
with other tutorials at - [www.shakeyourapp.net/developer](http://www.shakeyourapp.net/developer)
