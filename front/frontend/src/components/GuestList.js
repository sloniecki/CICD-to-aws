import React from "react";
import './App.css'
import './APIService'
import APIService from "./APIService";
function GuestList(props) {

  const editGuest = (guest) => {
    props.editGuest(guest)
  }

  const deleteGuest = (guest) => {
    APIService.deleteGuest(guest.id)
    .then(() => props.deleteGuest(guest))
    
  }
    return(
        <div>
            {props.Guests && props.Guests.map(guest =>{
        return (
          <div key = {guest.id}>
            <p>{guest.name}{guest.surname}</p>
            <p>{guest.date}</p>

            <div className="row">
                <div >
                    <button className="button"
                    onClick = {() => editGuest(guest)}
                    >Update</button>
                </div>
               
                <div className="col">
                    <button className="btn btn-danger"
                      onClick={() => deleteGuest(guest)}
                    >Delete</button>
                </div>
            </div>
                
            
          </div> 
        )
      })}
        </div>
        
    )

}
export default GuestList;
