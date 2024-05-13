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

Unlike encoder models, decoder models adopt autoregressive training, a method where models are trained to predict subsequent words based on a given context. The most well-known of these types of models are, you guessed it, the GPT-x models.

An early example of the GPT style decoder models in the protein world is ProtGPT2, trained on 50M sequences with 738 parameters.

Did it work?

Kind of. ProtGPT2 managed to generate sequences with characteristics similar to those of natural proteins. The amino acid types and frequencies closely matched those in nature, and the sequences exhibited a comparable balance between ordered (stable) and disordered (flexible) regions. And visual inspection of the structural superimposition showed that generated proteins preserved some of the binding sites, which is essential for functionality. So, although the generated sequences looked a lot of natural proteins, it's hard to say if they really functioned like one. It was quickly outpaced by bigger and better models.

Conditional transformers
While ProGPT2 leverages a GPT2-like architecture for general protein sequence generation, newer approaches have been developed that integrate deeper biological contexts during the training phase. These methods ensure the patterns learned are not only statistically correct but also biologically meaningful. Protein models can be conditioned in two main ways: i) by conditioning on sequences, or ii) by conditioning on the structure of the proteins.

Conditioning on sequence:
The development of Conditional TRansformer Language (CTRL), an autoregressive model that includes conditional tags, marked a significant advance in NLP. These tags allow for targeted text generation without requiring input sequences. Known as control codes, these tags significantly refine the influence over genre, topic, or style, marking a major advance toward targeted text generation.

So naturally, CTRL was soon adapted to a dataset of 281 million protein sequences. The resulting model, named ProGen, employs UniProtKB Keywords as conditional tags. These tags span ten categories such as ‘biological process’, ‘cellular component’, and ‘molecular function’, encompassing over 1,100 terms. ProGen achieved perplexities on par with high-quality English language models, even when generating sequences for protein families not included in its training set.

ProGen's performance shows significant advances in our ability to design proteins that behave like natural ones. This model has successfully created protein sequences that function effectively, as proven by rigorous tests where they performed as well or better than naturally occurring proteins. Specifically, ProGen was able to:

Create proteins that match the energy efficiency and structural accuracy of naturally occurring proteins.
Generate variations of a specific protein domain that proved to be more effective than random variations, suggesting a high degree of predictive accuracy and utility in practical applications.


