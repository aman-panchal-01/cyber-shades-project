import pandas as pd
import numpy as np
from matplotlib import pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.ensemble import RandomForestClassifier  # Example model
from sklearn.metrics import accuracy_score, classification_report
import joblib

# Load the dataset
df = pd.read_csv('data.csv')

# Cleaning column names
df.columns = df.columns.str.replace(' ', '_').str.replace('(', '').str.replace(')', '')

# Handling missing values if any (assuming there might be some)
df.fillna(method='ffill', inplace=True)

# Encoding categorical features
label_encoders = {}
categorical_columns = ['Gender', 'Socio-Economic_Status', 'Parental_Education_Level', 
                       'Residential_Area', 'Mode_of_Transportation', 'Activity_Type', 
                       'Scholarship_Status', 'Financial_Hardships']

for column in categorical_columns:
    le = LabelEncoder()
    df[column] = le.fit_transform(df[column])
    label_encoders[column] = le

# Check data types to ensure everything is numeric
print(df.dtypes)

# Ensure there are no unexpected nulls or NaNs
print(df.isnull().sum())

# Defining the feature columns and target column
feature_columns = ['Age', 'Gender', 'Socio-Economic_Status', 'Parental_Education_Level', 
                   'Previous_Year_Grades', 'Current_Year_Grades', 'Course_Failures',
                   'Total_Days_Absent', 'Unexcused_Absences', 'Tardiness', 
                   'Disciplinary_Actions', 'Behavioral_Notes', 'Engagement_Score', 
                   'Parental_Support', 'Extracurricular_Participation', 'Number_of_Activities',
                   'Peer_Influence_Score', 'Bullying_Incidents', 'Health_Issues', 
                   'Mental_Health_Support', 'Sleep_Patterns_hours', 'Commute_Time_minutes', 
                   'Mode_of_Transportation', 'Scholarship_Status', 'Financial_Hardships']

target_column = 'Dropout_Status'

# Encoding the target column
df[target_column] = LabelEncoder().fit_transform(df[target_column])

# Splitting the data into training and testing sets
X = df[feature_columns]
y = df[target_column]

# Verify the data shape before splitting
print("Feature matrix shape:", X.shape)
print("Target vector shape:", y.shape)

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Check the shapes of the train/test splits
print("X_train shape:", X_train.shape)
print("X_test shape:", X_test.shape)
print("y_train shape:", y_train.shape)
print("y_test shape:", y_test.shape)

# Training a RandomForestClassifier
model = RandomForestClassifier(random_state=42)
model.fit(X_train, y_train)

# Making predictions
y_pred = model.predict(X_test)

# Evaluating the accuracy
accuracy = accuracy_score(y_test, y_pred)
print(f"Model Accuracy: {accuracy * 100:.2f}%")

# Detailed classification report
print(classification_report(y_test, y_pred))

# Saving the model
joblib.dump(model, 'dropout_prediction_model.pkl')

# Loading the model and making a new prediction
loaded_model = joblib.load('dropout_prediction_model.pkl')
new_student = [[16, 1, 1, 2, 85, 80, 0, 5, 2, 1, 0, 2, 70, 1, 1, 2, 75, 0, 0, 1, 7, 30, 1, 0, 0]]  # Example new data
prediction = loaded_model.predict(new_student)
print("Predicted Dropout Status:", "Dropout" if prediction[0] == 1 else "No Dropout")
