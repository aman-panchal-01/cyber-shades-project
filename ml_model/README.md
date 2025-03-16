# Machine Learning Model: Student Dropout Prediction

This document provides an overview of the **Student Dropout Prediction Model** being developed for the **Parivartan App**. The model aims to predict whether a student is at risk of dropping out based on various parameters. Currently, the model is in its **initial testing phase (v1.0)** and is not highly accurate. However, it will be improved in the future with more advanced techniques and trained on larger, more precise datasets.

---

## Model Overview

### **Objective**
The primary goal of this model is to identify students who are at risk of dropping out of school. By analyzing various academic, behavioral, and socio-economic factors, the model provides early warnings to parents, teachers, and administrators, enabling timely intervention.

### **Current Status**
- **Version**: 1.0 (Testing Phase)
- **Accuracy**: Not highly precise (under development).
- **Purpose**: Proof of concept and initial testing.

---

## Features (Input Parameters)

The model uses the following parameters to predict dropout likelihood:

### 1. **Demographic Information**
   - **Gender**: Male, Female, or Other.
   - **Socio-Economic Status**: Low, Middle, or High.
   - **Parental Education Level**: Highest education level of parents (e.g., Illiterate, Primary, Secondary, Graduate, Postgraduate).
   - **Residential Area**: Urban, Rural, or Semi-Urban.

### 2. **Academic Performance**
   - **Previous Year Grades**: Overall grades from the previous academic year.
   - **Current Year Grades**: Current academic performance.
   - **Course Failures**: Number of subjects failed in the current year.
   - **Subject-Specific Scores**: Scores in key subjects (e.g., Math, Science, English).

### 3. **Attendance and Behavior**
   - **Total Days Absent**: Total number of days absent in the current year.
   - **Unexcused Absences**: Number of unexcused absences.
   - **Tardiness**: Number of times the student was late to school.
   - **Disciplinary Actions**: Number of disciplinary actions taken against the student.
   - **Behavioral Notes**: Qualitative notes on student behavior.

### 4. **Engagement and Support**
   - **Engagement Score**: A score representing the student's engagement in class (e.g., participation, interest).
   - **Parent-Teacher Meetings Attended**: Number of meetings attended by parents.
   - **Parental Support**: Level of support from parents (e.g., Low, Medium, High).
   - **Extracurricular Participation**: Number of extracurricular activities the student is involved in.
   - **Activity Type**: Type of extracurricular activities (e.g., Sports, Arts, Academics).

### 5. **Social and Environmental Factors**
   - **Peer Influence Score**: Influence of peers on the student (e.g., Positive, Negative).
   - **Bullying Incidents**: Number of bullying incidents reported.
   - **Health Issues**: Physical or mental health issues affecting the student.
   - **Mental Health Support**: Whether the student is receiving mental health support.
   - **Sleep Patterns**: Average hours of sleep per night.
   - **Commute Time**: Time taken to commute to school (in minutes).
   - **Mode of Transportation**: Mode of transportation used (e.g., Bus, Walk, Bicycle).

### 6. **Financial and External Factors**
   - **Dropout Status**: Historical data on whether the student has dropped out before.
   - **Scholarship Status**: Whether the student is receiving a scholarship.
   - **Financial Hardships**: Level of financial difficulties faced by the family.

---

## Model Output
- **Prediction**: The model outputs a binary prediction:
  - **0**: Low risk of dropout.
  - **1**: High risk of dropout.
- **Confidence Score**: A probability score indicating the confidence level of the prediction.

---

## Current Limitations
1. **Accuracy**: The model is not highly accurate in its current version and is not suitable for real-world deployment.
2. **Dataset**: The model is trained on a limited dataset, which may not represent the diversity of students in India.
3. **Feature Importance**: Some features may have a stronger influence on the prediction than others, but this is not yet fully optimized.

---

## Future Improvements
1. **Advanced Algorithms**: Implement more advanced machine learning algorithms (e.g., XGBoost, Neural Networks).
2. **Larger Dataset**: Train the model on a larger, more diverse, and precise dataset.
3. **Feature Engineering**: Optimize feature selection and engineering to improve model performance.
4. **Real-Time Data Integration**: Integrate real-time data from schools and students for more accurate predictions.
5. **Explainability**: Add explainability features to help stakeholders understand the model's predictions.

---

## How It Will Be Used in Parivartan App
- The model will provide **early warnings** to parents, teachers, and administrators about students at risk of dropping out.
- It will be integrated with the app's notification system to send alerts and recommendations for intervention.
- Over time, the model will be refined to improve its accuracy and reliability.

---

## Note
This model is currently in the **testing phase** and is not ready for real-world use. It will be improved and refined in future updates to ensure it meets the needs of students, parents, and educators.

---
