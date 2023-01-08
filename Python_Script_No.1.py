import requests

# Make a request to the API
response = requests.get("https://randomuser.me/api/?results=20")

# Get the data from the response
data = response.json()

# Loop through the list of users
for user in data['results']:
  # Get the name, last name and gender for each user
  name = user['name']['first']
  last_name = user['name']['last']
  gender = user['gender']
  
  # Print the information for each user
  print(f"Name: {name} {last_name}")
  print(f"Gender: {gender}")
  print()
