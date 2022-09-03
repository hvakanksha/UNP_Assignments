#!/usr/bin/env python
# coding: utf-8

# **Model 1**

# In[21]:


import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.metrics import mean_squared_error
from sklearn.metrics import r2_score
from sklearn.metrics import classification_report
from sklearn import metrics
from sklearn.metrics import classification_report
from sklearn.preprocessing import OneHotEncoder
from sklearn.feature_selection import RFE
import statsmodels.api as sm
from sklearn.metrics import accuracy_score


# In[22]:


df = pd.read_excel("C:/Users/akank/OneDrive/Desktop/BankingDataset.xlsx")
df


# In[23]:


ND = pd.get_dummies(df[['job', 'marital','education','default','housing','loan','contact','month','day_of_week','poutcome']], drop_first=True)
ND


# In[24]:


a1 = df['y']
a2 = df['age']
a3 = df['duration']
a4 = df['campaign']
CD = pd.concat([a1,a2,a3,a4, ND], axis=1)


# In[25]:


CD['y']  = CD['y'].replace('yes',1)
CD['y']  = CD['y'].replace('no',0)


# In[26]:


y = CD['y']


# In[27]:


CD.columns


# In[28]:


x=CD.drop(['y','marital_married', 'marital_single',
       'marital_unknown','loan_unknown', 'loan_yes','campaign'], axis='columns')


# In[29]:


x_train, x_test, y_train, y_test = train_test_split(x, y, random_state=0, train_size = .80)


# In[30]:


l_reg = LogisticRegression()


# In[31]:


l_reg.fit(x_train,y_train)


# In[32]:


prediction = l_reg.predict(x_test)
prediction


# In[33]:


accuracy_score(y_test,prediction)*100


# **Model 2**

# In[34]:


x=CD.drop(['y','marital_married', 'marital_single',
       'marital_unknown','loan_unknown', 'loan_yes','campaign','housing_unknown', 'housing_yes','day_of_week_mon', 'day_of_week_thu', 'day_of_week_tue',
       'day_of_week_wed','age'], axis='columns')


# In[35]:


x_train, x_test, y_train, y_test = train_test_split(x, y, random_state=0, train_size = .80)


# In[36]:


l_reg.fit(x_train,y_train)


# In[37]:


prediction = l_reg.predict(x_test)
prediction


# In[38]:


accuracy_score(y_test,prediction)*100


# In[ ]:




