import React from "react";
import Users from "./components/Users"; // Adjust the path based on where Users.js is located

function App() {
    return (
        <div className="App">
            <header>
                <h1>Welcome to the User Management App</h1>
            </header>
            <main>
                {/* Render the Users component */}
                <Users />
            </main>
        </div>
    );
}

export default App;
