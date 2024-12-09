import React, { useState, useEffect } from "react";
import axios from "axios";

const Users = () => {
    const [users, setUsers] = useState([]);
    const [newUser, setNewUser] = useState({
        name: "", email: "", phone: "", address: ""
    });

    useEffect(() => {
        axios.get("http://localhost:5000/users")
            .then(response => setUsers(response.data))
            .catch(error => console.error("Error:", error));
    }, []);

    const handleSubmit = (e) => {
        e.preventDefault();
        axios.post("http://localhost:5000/users", newUser)
            .then(() => {
                setUsers([...users, newUser]);
                setNewUser({ name: "", email: "", phone: "", address: "" });
            })
            .catch(error => console.error("Error:", error));
    };

    return (
        <div>
            <h1>Users</h1>
            <ul>{users.map((user, index) => (
                <li key={index}>{user.name} - {user.email}</li>
            ))}</ul>
            <form onSubmit={handleSubmit}>
                <input type="text" placeholder="Name" value={newUser.name}
                       onChange={e => setNewUser({ ...newUser, name: e.target.value })} />
                <input type="email" placeholder="Email" value={newUser.email}
                       onChange={e => setNewUser({ ...newUser, email: e.target.value })} />
                <button type="submit">Add User</button>
            </form>
        </div>
    );
};

export default Users;
