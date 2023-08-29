import './components/App.css';
import { useState, useEffect } from 'react';
import GuestList from './components/GuestList';


function App() {
  
  const [Guests, setGuests] = useState([])

  useEffect(() => {
    fetch('http://localhost:5000/get',{
      'method':'GET',
      headers: {
        'Content-Type':'application/json'
      }
    })
    .then(resp => resp.json())
    .then(resp => setGuests(resp))
    .catch(error => console.log(error))
  
  },[])



  return (
    <div className="App">
      <h1>Simple fullstack app</h1>
    <GuestList Guests = {Guests}/>
    </div>  
  );
}

export default App;
