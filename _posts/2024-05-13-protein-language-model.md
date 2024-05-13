# a review on protein language models
Protein “language” is a lot like human language. Given the similarities, researchers have been building and training language models on protein sequence data, replicating the success seen in other domains, with profound implications. In this post, I will explore how transformer models have been applied to protein data and what we’ve found.

### The language of proteins
Much like words form sentences, protein sequences—strings of the 20 amino acids that make up the protein "vocabulary"—determine the structure and function of proteins in their environment. This ordering of amino acids is crucial, as it influences how proteins fold and interact within biological systems.

Like human languages, which utilize modular elements like words, phrases, and sentences, proteins consist of motifs and domains. These are the fundamental building blocks reused in various combinations to construct complex structures. In this analogy, protein motifs and domains are akin to the 'words' and 'phrases' of the protein world, with their biological functions similar to the 'meaning' conveyed by sentences in human languages.

Another key parallel to human language is the concept of information completeness. Although a protein is much more than its amino acid sequence—it forms structures that carry out specific functions—all these aspects are predetermined by its sequence. Even though the way a protein behaves can vary depending on its environment and interactions with other molecules (e.g. on cellular state, other molecules and post-translational modifications), it is still defined by the underlying sequence. This means that from an information-theory perspective, the protein’s information (e.g. its structure) is contained within its sequence.

[Its important to keep in mind that the analogies between NLP and protein language modeling only go so far. First, we can read and understand natural language, and not so much with proteins. Unlike proteins, most human languages include uniform punctuation and stop words, with clearly separable structures. And while natural languages have a well-defined vocabulary (with ~ million words in English), proteins lack a clear vocabulary. Moreover, with proteins we do not always know whether a sequence of amino acids is part of a functional unit (e.g. a domain). Additionally, proteins also exhibit high variability in length ranging from 20 to a few thousand AA.]

# Protein language model architectures
## Encoder models
A lot of the initial work in pLMs is based on Encoder-only Transformer architecture as their aim is to obtain embedded representations of proteins in a vector space for downstream tasks.

Most of these models use BERT-like architectures and denoising autoencoding training objectives, i.e., they are pre-trained by corrupting input tokens in some way and trying to reconstruct the original sequence. Examples of such models include TCR-BERT, epiBERTope, ESM, ProtTrans or ProteinBERT. After pre-training to generate embeddings, these models are further refined through supervised learning techniques to address various downstream tasks in protein engineering (secondary structure and contact prediction, remote homology detection, post-translation and biophysical properties prediction)

