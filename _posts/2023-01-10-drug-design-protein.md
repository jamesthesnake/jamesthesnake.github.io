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

####

4. Model Interpretability
While ML models can efficiently select and prioritize molecules for synthesis or purchase, most models operate as “black boxes” that take chemical structures as input and generate predictions as output.  Ideally, we’d like to have interpretable models that provide insights to motivate the design of subsequent compounds.  Interpretable models could provide several advantages. 
Engender confidence among the team.  Experimentalists will be much more likely to “buy in” if they understand the reasoning behind a prediction.  
Enable the debugging of models.  If we understand the reasoning behind a prediction, we may be able to make adjustments to improve the model. 
Facilitate an understanding of the underlying science.  Ultimately we would like to understand the links between chemical structure and a physical or biological endpoint.  An interpretable model could potentially help to illuminate the underlying physical processes.
A recent paper from Sanofi-Aventis and Matthias Rarey provides an extensive overview of the application of explainable artificial intelligence (XAI) to lead optimization datasets.  Several XAI methods are demonstrated, along with a heatmap visualization highlighting features that are critical for activity. 

Interpretation of Structure−Activity Relationships in Real-World Drug Design Data Sets Using Explainable Artificial Intelligence
https://pubs.acs.org/doi/abs/10.1021/acs.jcim.1c01263

Some of my favorite work this year came from Andrew White’s group at Rochester.  In one paper, they used counterfactuals, a technique that has been used to explain machine learning models in several areas, including credit risk assessment.  

Model agnostic generation of counterfactual explanations for molecules
https://pubs.rsc.org/en/content/articlelanding/2022/sc/d1sc05259d

In a second paper, the White group used a language model to create text-based explanations for machine learning model predictions.  While the approach is interesting, the examples in the paper are not quite at a level that would convince a medicinal chemist. 

Explaining molecular properties with natural language
https://chemrxiv.org/engage/chemrxiv/article-details/633731d1f764e6e535093041

Finally, the White group published a perspective preprint, released at the end of 2022, which provides a comprehensive overview of interpretable models in QSAR and other fields.  

A Perspective On Explanations Of Molecular Prediction Models
https://chemrxiv.org/engage/chemrxiv/article-details/639222a114d92d7cd6a65e90

Shapley values have been used to assess the contributions of features in machine learning models.  Two recent papers from the Bajorath group demonstrate how this technique can be applied to machine learning for molecules. 

EdgeSHAPer: Bond-centric Shapley value-based explanation method for graph neural networks
https://www.sciencedirect.com/science/article/pii/S2589004222013153

Calculation of exact Shapley values for support vector machines with Tanimoto kernel enables model interpretation
https://www.sciencedirect.com/science/article/pii/S2589004222012950

To effectively associate chemical structure with ML model predictions, we need software tools that will enable us to visualize the mapping of model predictions onto chemical structures.  A paper from Bayer describes an open-source tool for interpreting ML models and visualizing atomic contributions. 

ChemInformatics Model Explorer (CIME): exploratory analysis of chemical model explanations
https://jcheminf.biomedcentral.com/articles/10.1186/s13321-022-00600-z

Perspective - While model interpretability has become a component of several research efforts, we have yet to arrive at readily actionable models.  Hopefully, as the field progresses, we’ll reach a point where insights from interpretable models will provide clear directions for optimization. 

