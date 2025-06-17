import React, { useEffect, useState } from 'react';
import './App.css';
import Navbar from './components/Navbar';
import TextForm from './components/TextForm';

function App() {
  const [data, setData] = useState([]);
  
  useEffect(() => {
    // Connect to backend API
    fetch('/api/data')
      .then(res => res.json())
      .then(data => {
        if (data.items) {
          setData(data.items);
        }
      })
      .catch(err => console.error('Error fetching data:', err));
  }, []);

  return (
    <>
      <Navbar title="TextUtils" />
      <div className="container my-3">
        <TextForm heading="Enter the Text to Analyze Below"/>
        
        {/* MongoDB Data Display Section */}
        <div className="mt-5">
          <h2>Data from MongoDB</h2>
          {data.length > 0 ? (
            <ul className="list-group">
              {data.map((item, index) => (
                <li key={index} className="list-group-item">
                  <strong>{item.name || 'Untitled'}</strong>
                  {item.value && ` - Value: ${item.value}`}
                  {item.content && <p>{item.content}</p>}
                </li>
              ))}
            </ul>
          ) : (
            <div className="alert alert-info">
              No data found in the database
            </div>
          )}
        </div>
      </div>
    </>
  );
}

export default App;
