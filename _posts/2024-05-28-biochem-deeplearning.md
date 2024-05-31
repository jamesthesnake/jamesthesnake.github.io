We have forty million compounds and their screenings in Pubmed, zetta-bases of newly sequenced data every year, the full transcriptome of aging mice, and comprehensive maps of the epigenome, yet machine learning and deep learning haven’t generated much radical insight from all of this (quite yet). Computational tools are currently in an assistant role at best and, arguably, there is nothing new here. Computer-aided drug design has been around since the 60s (e.g., Dendral). Structure-activity relationship analysis and chemoinformatics, both computationally heavy, have also been around for a while. Biologists regularly used various machine learning techniques since the 90s (as some say “today’s ML is tomorrow’s statistics”): the first Monte Carlo simulation of protein folding appeared in 1975, the first maximum-likelihood maximization algorithms were used for the construction of evolutionary trees in 1981, the first algorithm for classifying protein structures appeared around 1987. Not to mention all the sequence alignment algorithms that were getting developed in the early 70s. 

Despite this, I have been periodically noticing an impression that for ages biology and chemistry have been done with rocks and sticks in caves until deep learning was brought to wet labs by computer scientists, akin to Prometheus bringing fire to mankind. Here I tried to address that impression and go over all the possible reasons for why biology didn’t become quite easier with advancements in deep learning and novel architectures, which might or might not be instructive for what we should do about it moving forward.

Let's look at the elephant in the room - molecular representations. Molecular representation is how data looks when you input it into your model. It is what you assign your properties to, it is what you are predicting labels for. 

From the prediction of in vivo properties to off-target toxicities to clearance to half-life prediction to organ-specific effects, there has been a lot published in the direction of AI for drug optimization. Such work requires enormous datasets and PubChem / ChEMBL / BindingDB are normally used as primary references for training, as they have been aggregating this information for many years and have by far the largest repository. Some companies do have proprietary datasets but keep in mind that one such dataset can take millions of dollars to generate (especially if you actually want to measure performance in vivo). Representation and stored information differ between databases but more generally molecular structures are represented as one of the following [*] :

Fingerprints - binary encoding for whether a particular substructure is present

String representations - write down the structure as a string of characters (SMILES for molecules / aminoacid letters for proteins / nucleotide letters for RNA and DNA), embed the string

Graphs - treating atoms as nodes and connections as edges, you can construct an adjacency matrix, create embeddings for each node and edge

Coulomb maps - matrix of Coulombic potentials between atoms with the potential energy of the free atom along the diagonal

Atomic distance maps - coordinates of each individual atom  

The problems of these are numerous and neither of these contains enough relevant information to fully specify chemical structure: some often miss molecular similarity (e.g., SMILEs, one of the most commonly used representations - see Figure 1), struggle with isomers, conformations, and representational redundancy.  Graphs, the most suitable of all, do not encode delocalized electrons (e.g., benzene ), electron-deficient bonds, and molecules that are constantly re-arranging (see “Let’s not forget tautomers” because how would you represent viagra?!!) and basically any phenomena that go beyond just the connectivity of atoms.

 Imagine ImageNet that has pictures of cats where half of the cats are defined as dogs, depending on their quantum state. That.

