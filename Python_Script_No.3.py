import requests
import pandas as pd

# Set the API URLs
random_user_url = "https://randomuser.me/api/?results=20"
genderize_url = "https://api.genderize.io/"

# Select 20 users in the system by calling the API and collecting the name, surname and gender
response = requests.get(random_user_url)
data = response.json()
users = data['results']

# Create an empty list to store the user data
user_data = []

# Loop through the users and collect the name, surname and gender
for user in users:
    name = user['name']['first']
    surname = user['name']['last']
    gender = user['gender']
    user_data.append((name, surname, gender))

# Call the API to predict the gender of each user and store the gender and probability data
predictions = []
for name, surname, gender in user_data:
    params = {'name': name}
    response = requests.get(genderize_url, params=params)
    data = response.json()
    predicted_gender = data['gender']
    probability = data['probability']
    predictions.append((predicted_gender, probability))

# Create a DataFrame with the user data and predictions
df = pd.DataFrame(user_data, columns=['first_name', 'last_name', 'gender(actual)'])
df['gender(predict)'] = [x[0] for x in predictions]
df['probability'] = [x[1] for x in predictions]

# Check the correctness of the gender predictions
df['same_gender'] = df['gender(actual)'] == df['gender(predict)']

print(df)