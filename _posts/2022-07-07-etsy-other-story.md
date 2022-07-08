
---
layout:     post
title:      Etsy other story
date:       2022-07-07 
summary:    Etsy
categories: ETsy 
---

https://gist.github.com/aconbere/1982a5eb17b77817017a3da50914732f
which says :
<br>

Between 2012 and 2014 I worked at Etsy on and experimental remote team "Seller Economics". Etsy was at the time famous for two things: Chat Ops and Hack Weeks. This is a story about how those two cultural touchstones collided to create a near disaster.

Chat ops was this idea of having your chat service be the source of truth for operations control. So if you wanted to spin up a new server, you wrote a mystical command into your companies chat service and a bot would go and execute that command. This cultural idea helped ambiently expose and teach people about how to run operations commands, and forced the team to build ergonomic tools for operations. At Etsy the chat service was IRC and there was a program irccat that would execute commands. It was easy to add commands to irccat and it was used for everything from keeping track of little karma kudos from your team to rebalancing database servers.

Hack weeks at Etsy were a lot of fun. They were a week long event where everyone at the company took a break from their regularly scheduled work to step back and make something off the beaten path, something personal, something fresh. This was a great time to go into the office if you were remote because everyone had their heads up and were happy to take some time to engage with folks from out of town. Folks would come up with ideas, pitch folks on them, team up and have a fun week making something new. Sometimes these creations where wild bets on new product features, sometimes they were internal tools, sometimes people made art,

Just prior to joining Etsy I'd been playing around with Scala and enjoying its blend of functional and object oriented programming. I was writing little toys in Scala as I learned the language. One of the early toys I wrote was a Markov Chain [1]. I don't recall what inspired me or why, I do remember enjoying writing a Star Trek planet name generator. Later while at Etsy I thought it would be fun to build tools for me to write IRC bots in Scala[2] so that I could connect to the companies IRC server and "do things".

In 2013 my friend Avi Bryant left Etsy, and his departure happened to coincide with the 2013 Hack week. I didn't have any big ideas for stuff to build at the time and so I decided to crawl the IRC chat logs and turn everything he'd said into a corpus for a markov chain. This was fun in and of itself, but for reasons I don't remember, I also decided to combine that chain with the IRC tool I'd written to make an "avibot". (I don't remember all the details but I do recall that Rob Hall and I collaborated on a lot of these ideas, and I can see he made some commits to the markov tool at around this time fixing some bugs.) The bot would post every so often with a generated phrase and respond if you mentioned avi by name. This was fun but a little grotesque and pretty soon we had the idea of making more bots for our past colleagues. Soon there were mhedulundbots and mwalkerbots, samerbots and gfodorbots. All these bots made a bit of a mess of the team channel so folks asked me to move the bot, with nowhere else obvious, I made a channel #purgatory and had the bot join there.

I thought this was great fun, and turned it into my hack week project. I made short hack week presentation where I wrote another little irc bot that would hash all the participants names in a channel and map them to voice in the say command and then have them all talk to each other out loud. This would have been the end of the story, except one day, our coworker Moishe woke up to see that he had earned 30,000 "plusses" (Ety's karma points) over night. Moishe is incredible, and so it wasn't surprising that he'd gotten a lot of plusses, but 30,000 was a lot even for Moishe. And Moishe wasn't the only one reporting oddities. I'm sure it's obvious looking back, but at some point one of the bots had issued a command to invite irccat the chatops bot into #purgatory, and the bots had been happily "++"'ing colleagues over and over.

This ++ storm wasn't particularly dangerous and certainly created some interesting discussions about how Markov chains bias results. The terrifying realization was that if the bots could execute the ?++ command they could also execute all the other chatops commands, the ones that tear down servers, the ones that kill processes, all the scary possibilities of chatops turned into a kind of markov chaos monkey. My recollection on review was that we hadn't found any other successful commands executed (there are differing accounts of this), but needless to say I was asked to decommission #purgatory for the safety of Etsy.

[1] https://github.com/aconbere/scala-markov

[2] https://github.com/aconbere/Scala-IRC
