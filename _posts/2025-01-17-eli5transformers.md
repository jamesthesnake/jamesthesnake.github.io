We all have seen this image from the Attention is All We Need paper. Looks scary, right? Let’s try to understand how this actually works using one single example and try to make this journey as simple as possible!
## Part 1 (Preprocessing)
This will be our **Dataset (** some lines from my favorite TV Show ~ The Big Bang Theory. Extra points if you guess who told them :D )

```python
dataset = [
    "I'm", "not", "crazy", "My", "mother", "had", "me", "tested",
    "Our", "babies", "will", "be", "smart", "and", "beautiful",
    "I'm", "an", "astronaut", "I", "work", "for", "NASA"
]
```

We must build our vocabulary now! It’s nothing but the set of unique words in the dataset

$$
vocab=set(dataset)
$$

The vocab dataset will look something like

```python
vocab = [
    "I'm", "not", "crazy", "My", "mother", "had", "me", "tested",
    "Our", "babies", "will", "be", "smart", "and", "beautiful",
    "an", "astronaut", "I", "work", "for", "NASA"
]
```

We can easily find the vocab size by :

$$
vocab\space size=count(set(dataset))\\=21
$$

### Encoding

Let’s assign a unique number to each of the word in vocab

This is all the preprocessing of data we will be needing, now we will delve deep into the transformer architecture itself!

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ccbd2656-cd33-458c-9117-ee393441ad76/601de6a7-d76a-4f70-b4cd-45baf8a2efbc/image.png)

## Part 2 (Encoder Embedding)

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/ccbd2656-cd33-458c-9117-ee393441ad76/5e714ad6-fc23-4ed8-8e8a-788bf30f9e53/image.png)

### Embedding

We now need to select a specific part from our dataset. Let’s choose 
**“*Our babies will be smart and”***

We have selected our input, and we need to find an embedding vector for it.

We will be using a 6-dimensional embedding vector. The values of such vectors are always between 0 and 1 and will be defined at random at the beginning of our journey. We will be updating them as we go on### Dataset

First we must have a dataset, with which we will be working throughout our journey. For example, the dataset used in GPT3 is 570GB! We can’t obviously use that here as an example, so let’s make a short dataset with only 3 sentences
## Conclusion

This was a brief and short guide into how transformers work. Hope you guys enjoyed it :)

Sources :

1. Attention is all you need - Paper
2. Umar Jamil - Youtube
3. 3Blue1Brown - Youtube
4. Lots of Blogs from Medium
5. Me, for doing all the calculations by hand :’)
