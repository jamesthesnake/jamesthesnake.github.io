Humans are bad at managing spaghetti code. Of course, we should try and avoid writing spaghetti code if we can. But there are problems that are so ill-specified that any serious attempt to solve them results in just that.

Let me make this concrete. In research projects, we often write programs that extract information from raw data. The data may have idiosyncrasies and follow no clear specification. Some examples:

Identify mentions of corporations and their officers in news articles.
Label public procurement contracts by what kind of service the firms supply.
Determine if a message exchanged between engineers contains program code.
If we want the output to be perfect—at least in the limit—then we need to exhaustively examine each observation. We can go one step further to reassure ourselves that the program produces the correct output by picking representative examples and writing unit tests for them. Almost every programming language has libraries for this, including R and Python.

But this approach won’t work well if getting the correct output requires that we specify complicated decision rules. In the examples above,

corporate officers might be mentioned in the news by nickname,
contracts might describe the procured services using synonyms, and
it might not always be trivial to tell apart program code from English.
In such situations, we might be better off training a neural network. Algorithms that train neural networks thrive on spaghetti.

Detecting program code in messages
In this post, the problem that I’ll walk through solving is this: how can we detect if a message sent during code review explicitly refers to program code? Let’s suppose that the code base that we observe is written in C, and that the following examples are representative of the messages that engineers send:

LGTM with render_ipa_alloc().
If the FTPSACK flag is set, then use a prespecified value.
AFAICT there is nothing else to check (unless you can think of something).
Actually, debug_error() doesn’t return NULL, so we should use IS_ERROR() here.
This fails to build on aarch64 even though it works without issue on amd64.
I’ve added if (err) goto cleanup; but the code still leaks.
The highlighted expressions are program-code references that we would like to detect.

Ideas for decision rules
We take a straightforward approach and look for decision rules that can tell apart program code from ordinary English. Here are some simple ideas:

