import React from "react";
import './App.css'
function GuestList(props) {
    return(
        <div>
            {props.Guests && props.Guests.map(guest =>{
        return (
          <div key = {guest.id}>
            <p>{guest.name}{guest.surname}</p>
            <p>{guest.date}</p>

            <div className="row">
                <div >
                    <button className="button">Update</button>
                </div>
               
                <div className="col">
                    <button className="btn btn-danger">Delete</button>
                </div>
            </div>
                
            
          </div> 
        )
      })}
        </div>
        
    )

}
export default GuestList;
