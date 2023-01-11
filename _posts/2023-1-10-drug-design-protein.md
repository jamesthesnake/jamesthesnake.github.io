2. Deep Learning Methods Provide New Approaches to Protein-Ligand Docking
In 2022 we saw the advent of a new approach to protein-ligand docking.  Until recently, most docking programs used an empirical or physics-based scoring function to search binding poses within a predefined protein region, typically defined by a box around the binding site.  2022 saw the emergence of a new generation of docking programs that use the structures of existing protein-ligand complexes to learn relationships between ligands and protein binding sites and search the entire protein surface.  In essence, these programs are simultaneously solving two problems; identifying a binding site and determining the docked pose of a ligand.  

One of the first examples of this approach was the EquiBind docking program from MIT, which uses deep learning to align sets of points on a protein with corresponding points on a ligand.  

EquiBind: Geometric Deep Learning for Drug Binding Structure Prediction
https://arxiv.org/abs/2202.05146

A group from Galixir Technologies extended this approach with a docking program called TANKBind that evaluates docking poses across multiple sites on the protein and chooses the highest-scoring pose. 

TANKBind: Trigonometry-Aware Neural NetworKs for Drug-Protein Binding Structure Prediction
https://www.biorxiv.org/content/10.1101/2022.06.06.495043v3

Researchers from the Mila - Quebec AI Institute and the University of Montreal published a preprint describing E3Bind, a docking approach inspired by AlphaFold2.  This approach utilizes a combination of three embeddings describing a protein graph, a ligand graph, and a protein-ligand graph which is iteratively refined to generate docking poses. 

E3Bind: An End-to-End Equivariant Network for Protein-Ligand Docking
https://arxiv.org/abs/2210.06069

The team that created Equibind has developed a new generative approach to solve the docking problem. Their method, DiffDock, uses diffusion to iteratively search a space of translations, rotations, and torsional variations. The search process in DiffDock is guided by a novel confidence score that enables a choice between multiple poses. 

DiffDock: Diffusion Steps, Twists, and Turns for Molecular Docking
https://arxiv.org/abs/2210.01776

Graph Neural Networks (GNNs) have gained widespread use in various subfields of drug discovery. One example is the MedusaGraph method, which uses GNNs to predict protein-ligand docking. This method involves two GNNs: the Pose Prediction GNN, which suggests possible binding poses, and the Pose Selection GNN, which performs binary classification to evaluate the quality of a given pose.

Predicting Protein–Ligand Docking Structure with Graph Neural Network
https://pubs.acs.org/doi/10.1021/acs.jcim.2c00127

Perspective - For almost 30 years, docking has been used in structure-based drug design. Until recently, there have been few changes to how docking algorithms work. These algorithms usually generate a set of poses, which are then evaluated using scoring functions that combine physics-based and empirical terms. Recently, advances in deep neural networks (DNNs) have led to the development of new docking programs that use data from the Protein Data Bank (PDB) to train functions that can identify binding sites and propose and evaluate binding poses. While these methods are powerful, they can be difficult to benchmark because it is hard to know if the method is discovering new interactions or simply transferring information from similar binding sites and ligands. It will be interesting to see how these methods perform when faced with novel ligands and binding sites that have not been seen before. There is also the possibility of combining these approaches with existing physics-based and empirical methods.
