import nltk
from nltk.stem import PorterStemmer
from nltk.stem import WordNetLemmatizer
from nltk.tokenize.treebank import TreebankWordDetokenizer
from textblob import TextBlob
import string
import numpy as np


nltk.download("punkt", quiet=True)
nltk.download('wordnet')

tokenizer = TreebankWordDetokenizer()
stemmer = PorterStemmer()
lemmatizer = WordNetLemmatizer()


stopwords = nltk.corpus.stopwords.words('english')


def tokenize (sentence: str) -> list:
     """
     split sentence into array of words/token    
     """
     return tokenizer.tokenize(sentence)


def remove_punctuation(tokens):
    """
    remove any punctuations mark
    """
    return[token for token in tokens if token not in string.punctuation]


def remove_stopword(tokens: list) -> list:
    """
    remove any stopword
    """
    return[token for token in tokens if token not in stopwords]


def case_folding(tokens: list) -> list:
    """
    convert all tokens to lower case
    """
    return[token.lower() for token in tokens]


def stemming(tokens: list) -> list:
    """
     remove prefixes and suffix
    """
    return[stemmer.stem(token)for token in tokens]

def lemmatization(tokens: list)-> list:
    """
    perform lemmatization
    """
    return [lemmatizer.lemmatize (token)for token in tokens]

def correct_spelling(tokens: list) -> list:
    """
    correct mispelt words
    """
    return [str(TextBlob(token).correct()) for token in tokens]


def bag_of_words(tokenized_sentence, words):

    sentence_words = [word for word in tokenized_sentence]
    bag = np.zeros(len(words), dtype = np.float32)

    for idx, w in enumerate(words):
        if w in sentence_words:
            bag[idx]=1
    return bag        
