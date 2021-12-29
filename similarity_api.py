import warnings
warnings.filterwarnings("ignore")

from gensim.models import Word2Vec
import numpy as np
import nltk
from nltk.corpus import stopwords
import re
from scipy import spatial
import pandas as pd

from flask import Flask,request,jsonify
from flask import app

from db import DB

# # Downloading the stop words list
nltk.download('stopwords')
# # Loading the stop words in english
stop_words = list(stopwords.words('english'))


# replace this function by database function
def question_data():
    '''
    Fetch questions data from the database
    '''
    '''
    q_li = DB().fetch_Q()
    questions_list=[]

    for i in q_li:
        q = i[0]
        questions_list.append(q)
    '''
    df = pd.read_csv('related_q.csv')
    questions_list = list(df['Questions'])
    
    return questions_list

def job_cleaner(text):
    """
        text: a string
        return: cleaned initial string
    """
    text = text.replace("\n", " ")
    replace_by_re = re.compile('[/(){}\[\]\|@,;]')
    bad_symbols = re.compile('[^0-9a-z #+_]')
    stop_words = set(stopwords.words('english'))
    text = str(text)
    text = text.lower()
    text = replace_by_re.sub(' ', text)
    text = bad_symbols.sub('', text)
    text = ' '.join(word for word in text.split()
                    if word not in stop_words)

    return text

def make_vector(text):
    vector = []
    vector.append(text.split(" "))
    
    model = Word2Vec(vector, min_count=1, size =300)
    # list of words
    total_words = list(model.wv.vocab)
    # adding
    one_vector = []
    for i in range(len(total_words)):
        one_vector.append(model[total_words[i]])

    sum_vector = sum(np.asarray(one_vector))
    if (len(total_words) > 0):
        feature_vec = np.divide(sum_vector, len(total_words))

    return feature_vec

def find_similarity_score(question_list, question):

    similar_question = []

    for ques in question_list:
        clean_text = job_cleaner(ques)
        q_vector = make_vector(clean_text)
        
        clean_question = job_cleaner(question)
        question_vector = make_vector(clean_question)

        sim = 1 - spatial.distance.cosine(q_vector, question_vector)
        if 0.60 <= sim < 1 :
            similar_question.append(ques)

    return similar_question

def main(question):
    questions = question_data()
    similar_questions = find_similarity_score(questions, question)
    return similar_questions

app=Flask(__name__)
@app.route('/similar_question',methods= ["POST", "GET"] )

def sim_question():
    
    question = request.form.get('question')
    result = main(question)
    
    return jsonify(result)
    
if __name__=="__main__":
    app.run()