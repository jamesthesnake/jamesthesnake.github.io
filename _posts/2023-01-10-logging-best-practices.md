No matter what kind of software you’re developing, you most definitely leverage logging to some extent, probably every single day.
You write a lot of logs, you read tons of them too, it is the most basic observability tool we have.

Not all logs are equal / Should you even log it?
There are many pitfall that can lead to useless, wasteful and confusing logs. Therefore I follow a specific set of practices which allows me to write better logs while also being consistent across the system.
You should remmember that logging is for the developers, you are going to be the only one who’s reading them, so as you are about to log something, ask yourself this:

Is this log really needed? does it rely important information I couldn’t get from the other logs in the same flow?
Am I going to log an object that can be huge on production? If so, can I just log a few metrics of that objects instead? for example, it’s length, or handpick a few important attribute to log.
Does the information I am about to log will help me to debug/understand the flow?
These questions should guide you to decide whether you should log something or not, but it’s not the whole story.
Given that you decided you should, now you should ask yourself “how?”.

### How to log it?
As a first, and surprisingly not-so-obvious, rule of thumb I’d say you should keep your logs consistent across the system.
Consistency leads to predictability which leads to you looking for logs without always having to look how they are defined.
For example, If you always start your log with a prefix "[serviceName](functionName)...", when you are looking for a function log, you don’t have to open up the source code and check out the log message, but maybe I am portraying a bit of utopian world. In any case, consistency is awesome, so keep it.

Although consistency is awesome, it doesn’t cut it alone, as your logs can be consistenly trash, so here are a handful of practices I follow when logging.

### Log levels
Whenever you write a log, it’s important you choose the correct log level.
I personally mostly use ERROR, WARNING, INFO, or DEBUG (yes there are a few more).

Log levels TLDR
ERROR: Parts of the flow failed, we want to send alerts to our on-call for this failures.
WARNING: Doesn’t necessarily point to a failure, but an unexpected behavior that should be investigated.
INFO: Record major events in the flow to help the developer reading it understand what was being executed.
DEBUG: Like INFO but more detailed, including inspection into objects, data structures, etc.
The most common pitfalls I see here are logging too detailed info logs, or not using DEBUG at all.

### Log frugality
Whatever service you are using for logging, it costs money, and a fast way to burn money is to log the entire json object that was relatively small on your dev env, but blew up on production.

Huge object logs are not helpful, it’s hard to read through them.
Huge object logs are there because it is easier to throw in everything instead of thinking what would be the most important/useful attributes to log.
Huge object logs will cost you a lot of money, depending on your scale.

Let’s take AWS CloudWatch service for example, currently the price for log ingestion is $0.5 per GB. You log that giant json for all your 1000 customers each time the flow is invoked, you are already paying for that json log alone a few thousands a month.

### What you should do instead?
Pick the attributes that are the most important and useful to log, the attributes that will actually help you debug the continuation of the flow.
Sometimes, you just need to know if the object is empty or not, just log that - not the entire object.
Log uniqueness
Each log message in the system should be unique.
If I query for a log in a specfic service, I will be confused to see the exact same logs at different flows inside the service.
More than that, I’ll just have to start debugging for the issue, since the logs are now offically useless.

One way to keep the logs unique is to denote the service name and function name as a prefix for the log, if you do that - you are guarenteed uniqueness or at the very least, you narrowed the scope of log duplication from the entire service to just a function.

# Summary
Logging is important, it is a crucial tool for any kind of software, use it to your advantage, and don’t litter it.

Keep in mind that logging is for you, you will be reading them whenever you need to debug why the function you wrote failed. Save yourself future trouble, and invest in thoughtful logging in advance.

