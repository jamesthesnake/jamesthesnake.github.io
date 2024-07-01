You might be hearing a lot about post-quantum (PQ) cryptography lately, and it’s easy to wonder why it’s such a big deal when nobody has actually seen a quantum computer. But even if a quantum computer is never built, new PQ standards are safer, more resilient, and more flexible than their classical counterparts.

Quantum computers are a big deal; just ask around, and you’ll get plenty of opinions. Maybe quantum computers are on the verge of destroying public-key cryptography as we know it. Or maybe cryptographically significant quantum computers are an impossible pipe dream. Maybe the end of public-key cryptography isn’t now, but it’s only two decades away. Or maybe we have another 50 or 60 years because useful quantum computers have been two decades away for three decades, and we don’t expect that to change soon.

These opinions and predictions on quantum computers lead to many different viewpoints on post-quantum cryptography as well. Maybe we need to transition to post-quantum crypto right now, as quickly as we can. Maybe post-quantum crypto is a pipe dream because somebody will find a way to use quantum computers to break new algorithms, too. Maybe a major world government already has a quantum computer but is keeping it classified.

The fact of the matter is, it’s hard to know when a cryptographically significant quantum computer will exist until we see one. We can guess, we can try to extrapolate based on the limited data we have so far, and we can hope for one outcome or the other. But we can’t know with certainty.

That’s okay, though, because quantum resistance isn’t the main benefit of post-quantum crypto.

Current research and standards work will result in safer, more resilient cryptographic algorithms based on a diverse set of cryptographic problems. These algorithms benefit from the practical lessons of the last 40 years and provide use-case flexibility. Doomsayers and quantum skeptics alike should celebrate.

All in one basket
People who are worried about quantum computers often focus on one point, and they’re absolutely right about it: almost all public-key cryptography in wide use right now could be broken with just a few uncertain-but-possible advances in quantum computing.

Loosely speaking, the most commonly-used public-key algorithms are based on three problems: factoring (RSA), finite field discrete logarithms (Diffie-Hellman), and elliptic curve discrete logarithms (ECDH and ECDSA). These are all special instances of a more general computational problem called the hidden subgroup problem. And quantum computers are good at solving the hidden subgroup problem. They’re really good at it. So good that, if somebody builds a quantum computer of what seems like a reasonable size to many researchers, they can do all manner of nasty things. They can read encrypted messages. They can impersonate trusted organizations online. They can even use it to build tools for breaking some forms of encryption without quantum computers.

But even if quantum computing never becomes powerful enough to break current public keys, the fear of the quantum doomsayers is based on a completely valid observation: the internet has put nearly all of its cryptographic eggs into the single basket of the hidden subgroup problem. If somebody can efficiently solve the hidden subgroup problem, whether it’s with quantum computers or classical computers, they will be able to break the vast majority of public-key cryptography used on the internet.

What often gets overlooked is that, for the last 40 years, the hidden subgroup basket has consistently proven less safe than we expected.

Advances in factoring and discrete logs

In the 1987 talk “From Crossbows to Cryptography: Techno-Thwarting the State,” Chuck Hammill discussed RSA keys with 200 digits, or about 664 bits, saying that the most powerful supercomputers on earth wouldn’t be able to factor such a number in 100 years. The Unix edition of PGP 1.0 supported 992-bit RSA keys as its highest security level, saying the key size was “military grade.”

Nowadays, formulas provided by the National Institute of Standards and Technology (NIST) suggest that a 664-bit key offers only about 65 bits of security and is firmly within the reach of motivated academic researchers. A 992-bit key offers only about 78 bits of security and is speculated to be within reach of intelligence agencies.

(The smallest key size supported in PGP 1.0, 288 bits, can be broken in about 10 minutes on a modern desktop computer using readily available software like msieve. “Commercial grade” keys were 512 bits, which can be factored using AWS in less than a day for under $100.)

