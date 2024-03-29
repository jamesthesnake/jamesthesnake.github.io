---
layout:     post
title:      Unreal vs Unity
date:       2022-04-17
summary:    Unity Unreal
categories: Unity Unreal
---


Casey asked this [on Twitter](https://twitter.com/cmuratori/status/1514420516286709760)...

> Having looked at UE5's promotional content, I'm honestly just wondering: what is the point of Unity, now? Either you don't want to deal with a big unwieldy engine, in which case you roll/mod your own, or you do, and you would just use UE5, right? What am I missing?
>
> It seems like it is so far ahead of Unity at this point on all fronts, including asset provision (megascans + metahuman), I'm honestly just not sure what Unity's value proposition would be. Maybe devs who are sticking with Unity could fill me in?

A lot of interesting responses came from developers, mainly people working on games, which of course makes sense. But, it may be interesting to look at it from the angle of someone who's less focused on the art and more on the software, specifically from a maintainer's point of view. I've worked with a number of Unity games and (admittedly) I've occasionally poked at some Unreal games. More recently I've been working with UE5's Linux editor support as part of work on [SDL](https://libsdl.org/). (TL;DR: I'm kind of stunned at [what I've been able to do with it from day one](https://twitter.com/flibitijibibo/status/1511530172553605124).)


Anyway, what makes Unity appealing comes down to the typical Unity project lifecycle, one that I've seen consistently across many games, sizes of studios, etc: The beginning of the project is always really nice! You already know this, because literally everybody using Unity will tell you the same thing: It's great for prototyping. It's a great way to get people hooked, as long as the rest of the lifecycle is at least _decent_. Hell, [people still put up with all of XNA's numerous failures to this very day](https://flibitijibibo.com/index.php?page=Portfolio/Tools#01_FNA.txt) because they can at least bend it to fit their needs from start to finish.

This was the case with Unity for a long time, but in the last few years the quality of that back half of development has _rapidly_ declined, to the point where people are absolutely sick of their own projects by the time they're finished... or more accurately, abandoned, because long-term maintenance of Unity games is appallingly hard. Developers of all kinds like to accumulate technical debt and then panickingly try to pay it off at the 11th hour, and to say Unity charges interest is a pretty gross understatement. Others have talked about this at length so I won't get into it too much, other than that profiling and improving performance is still really really hard and I wish it was easier for outsiders like me to find out why.

I would attribute most of Unity's reputation to the fact that people are absolutely _sick_ of that back half, and are willing to jump ship even if it means having to re-train an entire team to do so. As impressive as UE5 is, **I don't think the technology has to do with its appeal as much as the long-term user experience**. My guess is that even if UE5 doesn't actually make finishing games easier, Unity's going to get smoked this next generation solely based on the promise (not even guarantee) that shipping will not make you want to die constantly.

I already know Unreal's going to be better because it allows maintainers to do something that we physically cannot do with Unity, and probably never will: Contribute to the engine itself. Not in terms of features, but in terms of _fixes_ - 99% of what makes finishing a Unity game hard is that there's this huge wall between the developer and the engine, which might have been fine when that wall wasn't blocking off _tens of millions of lines_ of code. Developers aren't dumb; they can literally see the bug right in front of their face, and they do not care whatsoever that it's in someone else's code, they just want to fix it and get on with their lives.

As an example, I spent about 2 years staring at a blatant Vulkan bug that was publicly acknowledged (it would slowly delay presentation indefinitely causing multiple whole seconds of input lag (yes, seriously)), and I diagnosed it on my own end rather quickly, but I got the final fix for it 2 _months_ ago. While I'm grateful that the internal team found it, fixed it, and even backported it, why couldn't I do that myself, with my own build and my own QA lab, even if only to help validate it for inclusion in a future release? Why am I forcing other developers to endure this pressure when they've already got enough _unsolved_ problems to deal with?

This disconnect is a two-tiered failure:

1. Hypothetically, for any proprietary software, you could just contact an engineer and work out the bug between the two of you, and get the fix you need as soon as it's ready. This is what made RAD's stuff so appealing despite being _super_ closed up, because even a nobody like me could file a report for Bink and expect a serious reply very quickly. Unity doesn't have that luxury because it's a _huge_ monolithic beast that you can't just casually patch up and send off a new binary, it's all or nothing.
2. Without having an internal engineer on speed-dial, what can you do? It's not like game developers don't have engineers of their own, but their talents (expensive talents, I might add) go unused because It's Not Theirs to fix, even if it would make the product's experience better _at no cost to the vendor_!

Unreal does a really good job of addressing both of these concerns, even for independent studios: Third-party engineers have the freedom to debug and diagnose their own issues, fix them, and submit them to upstream for review, all while retaining basically the same level of IP protection that was there before. Look, I may be a FOSS nut that likes fully Free software, but it'd be irresponsible not to acknowledge, from both ends of the licensing spectrum, that there's a lot about the relationship between commercial software vendors and their licensees that goes largely unexplored, and Unreal is an excellent example of this. It would have been absolutely unheard of for someone like me to not only have Unreal's source, but also work directly with the upstream maintainers - being able to work with highly experienced, AAA-level engineers like Mike Sartain and Brandon Schaefer, as a collaboration between Unreal and SDL, is something that I could never _dream_ of with Unity, and that's factoring in that they use SDL as well! Talk about lost opportunities!

Do I think most UE5 licensees will be doing this? Probably not at first, but as time goes on and developers dig really deep and discover all the weird things that even Fortnite didn't find, that maintainability is going to make a world of a difference, especially for developers like myself who have to focus on getting the game running in a lot of places, and running for a very long time.
