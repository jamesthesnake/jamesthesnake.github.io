Find the best software written in your programming language of choice. Usually, the language’s standard library is a good place to start. Look for patterns. Try to consider how you would implement things.

Small children learn by copying others. Why shouldn’t adults?

Being a computer scientist is less useful than you might think

​​Synthesis is essence of software engineering, whereas abstraction is the essence of computer science. Your job as a software developer will be to synthesise something new from composable pieces. What you create should be simple to understand and extend.

You are unlikely to implement sophisticated data structures and algorithms.

I don’t agree with everything that pg writes, but this struck out.

99.5% of programming consists of gluing together calls to library functions.

The time to fix things is now

Your team isn’t going to have fewer priorities next week or next month. There will not be an opportunity to the wholesale rewrite that the code base deserves. The only way to improve a code base is incrementally.

I learned this through John Ousterhout’s book, A Philosophy of Software Design. The overall suggestion that I took away from the book is that if your team is struggling with a spaghetti code base, its members should be investing about 10-20% of their total development time cleaning it up.

You’re paid to build

If you think that you’re employed to write software, then you’ve not thought hard enough.

You’re employed to make money – or save money – for someone. And the way to do that is probably through programming.

The phrase is terrible, but it’s worth repeating anyway. Make sure that you “add value”.

This matters because sometimes – perhaps often – working on the boring thing that no one wants to work on is really the thing that you should be doing.

Simplicity really helps

We all want to write simple software, as hard as that is. Ideally, your code should be simple enough so that a junior programmer who doesn’t like you can understand it.

Ironically, simple code probably has a shorter lifespan than complex code. Complex and difficult code remains fixed because people are afraid to change it. Complex code is very hard to test. And without regression tests, we don’t know if we’ve broken behaviour. So it becomes brittle.

API beats algorithm

Syntax matters. One of the lessons from the success of Kenneth Reith’s requests package — which completely took over from the standard library’s own implementation of making web requests — is that the (public) API is more important than every millisecond that you save from implementing the perfect algorithm. Users care about convenience. Convenient code is easy to write, easy to read and easy to maintain.However, it’s also understand what comprises your “Porcelain API” and your “Plumbing API”.

Other people make mistakes

The majority of us are better drivers than average. I’m sure the same is true for programming.Brains are imperfect.

It’s impossible for you to assess your own skill level.

If you want adoption, software is just the start

If you care about adoption, there’s lots of work to do once the code has been written. That is, unless you’re Fabrice Bellard, I guess.

This, to me, is the ultimate reason why being a 1x programmer (even in a professional setting) can be sufficient. You might be able to contribute to other areas that someone who is focused purely on the code is not able (or, more commonly, unwilling) to do. 10x programmers care about the code. Everything else is secondary.

Users care about themselves. To them, they need to be the primary priority. This rift causes a problem when open source maintainers decide that their users are indeed secondary. But that might be the theme of a future post.

