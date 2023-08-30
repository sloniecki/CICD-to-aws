import './components/App.css';
import { useState, useEffect } from 'react';
import GuestList from './components/GuestList';
import Form from './components/Form';


function App() {
  
  const [Guests, setGuests] = useState([])
  const [editedGuest, setEditedGuest] = useState(null)

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

  const editGuest = (guest) => {
    setEditedGuest(guest)
  }

  const updatedData = (guest) => {
    const new_guest = Guests.map(my_guest => {
      if(my_guest.id == guest.id) {
        return guest
      }else{
        return my_guest
      }
    })
    setGuests(new_guest)
  }

  const openForm = () => {
    setEditedGuest({name:'', body:''})
  }

  const insertedGuest = (guest) => {
    const new_guests = [...Guests, guest]
    setGuests(new_guests)
  }
  const deleteGuest = (guest) => {
    const new_guests = Guests.filter(myguest => {
    if(myguest.id === guest.id) {
      return false;
    }
    return true
    })
    setGuests(new_guests)
  }

  return (
    <div className="App">
      
      <div className="row">
        <div className="col">
        <h1>Simple fullstack app</h1>    
        </div>
      </div>
      <div className="col">
      <button
      className="btn btn-warning"
      onClick={openForm}
      >InsertGuest</button>
      </div>
    
    <GuestList Guests = {Guests} editGuest = {editGuest} deleteGuest={deleteGuest} />
    {editedGuest ? <Form guest = {editedGuest} updatedData={updatedData} insertedGuest={insertedGuest} /> :null}
    
    </div>  
  );
}

export default App;
