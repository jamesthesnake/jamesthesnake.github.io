---
layout:     post
title:      vector embedding
date:       2021-05-04
summary:    nlp embedded
categories: nlp embedded
---
Vector embeddings are one of the most fascinating and useful concepts in machine learning. They are central to many NLP, recommendation, and search algorithms. If you’ve ever used things like recommendation engines, voice assistants, language translators, you’ve come across systems that rely on embeddings.

ML algorithms, like most software algorithms, need numbers to work with. Sometimes we have a dataset with columns of numeric values or values that can be translated into them (ordinal, categorical, etc). Other times we come across something more abstract like an entire document of text. We create vector embeddings, which are just lists of numbers, for data like this to perform various operations with them. A whole paragraph of text or any other object can be reduced to a vector. Even numerical data can be turned into vectors for easier operations.

# Vector Embeddings are a list of numbers

But there is something special about vectors that makes them so useful. This representation makes it possible to translate semantic similarity as perceived by humans to proximity in a vector space.

In other words, when we represent real-world objects and concepts such as images, audio recordings, news articles, user profiles, weather patterns, and political views as vector embeddings, the semantic similarity of these objects and concepts can be quantified by how close they are to each other as points in vector spaces. Vector embedding representations are thus suitable for common machine learning tasks such as clustering, recommendation, and classification.

# Semantic similarity in sentence embeddings. Source: DeepAI

For example, in a clustering task, clustering algorithms assign similar points to the same cluster while keeping points from different clusters as dissimilar as possible. In a recommendation task, when making recommendations for an unseen object, the recommender system would look for objects that are most similar to the object in question, as measured by their similarity as vector embeddings. In a classification task, we classify the label of an unseen object by the major vote over labels of the most similar objects.

The fact that embeddings can represent an object as a dense vector that contains its semantic information makes them very useful for a wide range of ML applications.

Similarity search is one of the most popular uses of vector embeddings. Search algorithms like KNN and ANN require us to calculate distance between objects to determine similarity. Vector embeddings can be used to calculate these distances. Nearest neighbor search in turn can be used for tasks like de-duplication, recommendations, anomaly detection, reverse image search, etc.

Even if we don’t use embeddings directly for an application, many popular ML models and methods internally rely on them. For example in encoder-decoder architectures, embeddings produced by encoder contain the necessary information for the decoder to produce a result. This architecture is widely used in applications, such as machine translation and caption generation.

Check out some applications you can build with vector embeddings and Pinecone.





