---
layout:     post
title:      Silent_duel
date:       2022-03-24
summary:    What is the silent duel problem
categories: Silent Duel, economics
---

It’s a foggy morning for a duel. Newton and Leibniz have decided this macabre contest is the only way to settle their dispute over who invented Calculus. Each pistol is fitted with a silencer and has a single bullet. Neither can tell when the other has attempted a shot, unless, of course, they are hit.

Newton and Leibniz both know that the closer they get to their target, the higher the chance of a successful shot. Eventually they’ll be standing nose-to-nose: a guaranteed hit! But the longer each waits, the more opportunity they give their opponent to fire. If they both fire and miss, mild embarrassment ensues and they resolve to try again tomorrow. When should they shoot to maximize their chance at victory?

 government agency releases daily financial data concerning the market every morning at 6AM, and gives API access to it. In this version I’ll say that this data describes the demand for wheat and sheep. If you can get this data before anyone else, even an extra few milliseconds gives you an edge in the market for that day. You can buy up all the wheat if there’s a shortage, or short sheep futures if there’s a surplus.

There are two caveats. First caveat: 6AM is not precise because your clock deviates from the data provider’s clock. Maybe there’s a person who has to hit a button, and they took an extra few seconds to take a bite of their morning donut. If you call the API too early, it will respond, “Please try again later.” If you call the API after the data has been released, you receive the data immediately. Second caveat: since everyone is racing to get this data first, the API rate limits you to 6 requests per minute. If you go over, your account is blocked for 12 hours and you can’t get the data at all that day. You need a Scrooge-McDuckian vault of money to afford a new account, so you’re stuck with the one.

This is the so-called silent duel problem, and as you might have guessed it can be phrased without any violence.

Two players compete to succeed in taking some action in the interval 
. They are given a function 
 that describes the probability of success if the action is taken at time 
. Since the two men are “running” at each other, 
 is assumed to be increasing, with 
. If Player 1 succeeds in their action first, Player 1 gets a dollar (1 unit of utility) from Player 2; if Player 2 succeeds, Player 1 loses a dollar to Player 2. What strategy should they use to maximize their expected payoff?

Yet another phrasing of the problem is that a beautiful young woman is arriving at a train station, and two suitors are competing to pick her up. If she arrives and nobody is there to pick her up, she waits for the first suitor to arrive. If a suitor arrives and the woman is not there, the suitor assumes she has already been picked up and leaves. I like the duel version better, because what self-respecting woman can’t arrange her own ride these days? Either way, neither example has aged well. We should come up with a modern version where people are racing to McDonald’s to get Mulan Szechuan Sauce.

 I remember spending a lot of time confused about this problem, and wrote out my solution over and over again until I felt I understood it.
----
Almost ten years later, I found a renewed interest in the silent duel when a colleague posed the following variant (having no leads on how to solve it). A government agency releases daily financial data concerning the market every morning at 6AM, and gives API access to it. In this version I’ll say that this data describes the demand for wheat and sheep. If you can get this data before anyone else, even an extra few milliseconds gives you an edge in the market for that day. You can buy up all the wheat if there’s a shortage, or short sheep futures if there’s a surplus.
----
There are two caveats. First caveat: 6AM is not precise because your clock deviates from the data provider’s clock. Maybe there’s a person who has to hit a button, and they took an extra few seconds to take a bite of their morning donut. If you call the API too early, it will respond, “Please try again later.” If you call the API after the data has been released, you receive the data immediately. Second caveat: since everyone is racing to get this data first, the API rate limits you to 6 requests per minute. If you go over, your account is blocked for 12 hours and you can’t get the data at all that day. You need a Scrooge-McDuckian vault of money to afford a new account, so you’re stuck with the one.

# The Silent Duel Problem: A Journey Through Game Theory

It’s a foggy morning, perfect for a duel. Newton and Leibniz have decided that a macabre contest is the only way to settle their dispute over who invented Calculus. Each pistol is fitted with a silencer and contains a single bullet. Neither can tell when the other has attempted a shot—unless, of course, they are hit.

The rules are simple:
- The closer the two get to each other, the higher the chance of a successful shot.
- Standing nose-to-nose guarantees a hit, but waiting too long gives the opponent more opportunities to shoot.
- If both fire and miss, mild embarrassment ensues, and they agree to try again tomorrow.

The question is: **When should they shoot to maximize their chance of victory?**

---

## The General Problem

The Silent Duel problem can be phrased without violence, though the duel narrative adds drama. In its simplest form:

- Two players compete to succeed at a given task during an interval of time \([0, T]\).
- The probability of success is given by a function \(P(t)\), which increases with time (\(P(0) = 0\), \(P(T) = 1\)).
- If Player 1 succeeds first, they gain 1 unit of utility (e.g., a dollar) from Player 2.
- If Player 2 succeeds first, Player 1 loses 1 unit of utility.
- Both players aim to maximize their expected payoff.

The **optimal strategy** for both players involves determining when to act, balancing the increasing probability of success over time against the risk of being beaten by the other.

---

## A Modern Twist: Racing for Financial Data

Imagine a new scenario:

A government agency releases daily financial data every morning at **6:00 AM**. This data describes, for example, the demand for wheat and sheep. If you can access this information faster than anyone else, even by milliseconds, you gain a market edge:
- Buy up wheat if there’s a shortage.
- Short sheep futures if there’s a surplus.

### Caveats:
1. **Uncertainty of Timing**:  
   The release time isn’t precise due to factors like human delays. If you query the API too early, it responds, "Please try again later." If you query after the release, you get the data immediately.

2. **Rate Limits**:  
   The API only allows **6 requests per minute**. Exceed this limit, and your account is blocked for **12 hours**, leaving you with no access that day.

---

### Mapping to the Silent Duel

- Assume you can estimate a cumulative distribution function \(F(t)\), which gives the probability that the data has been released before time \(t\).  
- Your probability of success when querying at \(t\) is thus \(P(t) = F(t)\).  
- You can make **6 attempts** within the release window, analogous to having multiple "shots" in a duel.

Although the real-world problem may involve many competitors, simplifying it to two players helps clarify the core mechanics:
- **Player 1 (You)**: Limited to 6 attempts.  
- **Player 2 (Competitor)**: Potentially more attempts.  

---

## The Mathematics of the Silent Duel

For a single attempt, the problem boils down to finding the optimal \(t^*\), where:
- The expected payoff for acting at \(t^*\) is maximized.  
- \(t^*\) balances the increasing \(P(t)\) against the probability that the opponent acts first.

With multiple attempts, the optimal strategy becomes more complex:
- You may want to space your attempts strategically, accounting for rate limits and the shape of \(F(t)\).  
- Integrals and discontinuities often arise in determining these strategies.

For the API race, this means:
1. Constructing an accurate \(F(t)\) from prior observations.  
2. Allocating your 6 attempts based on \(F(t)\) to maximize the probability of being first.  

---

## A Nostalgic Connection

I first encountered the Silent Duel problem in a game theory course during undergrad. It fascinated me so much that I wrote out the solution repeatedly until I truly understood it. Years later, a colleague presented a variant involving financial data, sparking my renewed interest.

Finding a natural problem that fits so neatly into an abstract mathematical framework was exhilarating. Though I struggled to find detailed solutions in textbooks, my journey led me to rediscover the original paper that solved the general case.

---

## A Modern Example: The Race for Szechuan Sauce

To make the problem more relatable, imagine this:

Two friends race to McDonald’s to snag the limited-edition Mulan Szechuan Sauce. They can’t risk waiting too long, or the sauce will sell out. But if they arrive too early, they’ll assume the sauce isn’t available yet and leave empty-handed. Their challenge mirrors the duel—minus the fog and pistols.

---

The Silent Duel is a timeless game theory problem, applicable from historical disputes to financial markets to sauce races. Its resolution offers profound insights into strategy and decision-making under uncertainty.


