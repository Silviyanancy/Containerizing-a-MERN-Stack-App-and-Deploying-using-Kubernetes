from flask import Flask, jsonify, request
from flask_cors import CORS
from pymongo import MongoClient

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# MongoDB connection
client = MongoClient("mongodb://localhost:27017/")
db = client["personal_details"]
users_collection = db["users"]

# Routes
@app.route('/users', methods=['GET'])
def get_users():
    users = list(users_collection.find({}, {"_id": 0}))
    return jsonify(users), 200

@app.route('/users', methods=['POST'])
def add_user():
    data = request.json
    users_collection.insert_one(data)
    return jsonify({"message": "User added successfully!"}), 201

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0')
