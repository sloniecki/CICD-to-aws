import React, { useState, useEffect} from "react";
import APIService from "./APIService";

function Form(props) {
    const[name, setName] = useState('')
    const[surname, setSurame] = useState('')

    useEffect(() => {
        setName(props.guest.name)
        setSurame(props.guest.surname)
    },[props.guest])

    const updateGuest = () => {
        APIService.UpdateGuest(props.guest.id, {name, surname})
        .then(resp => props.updatedData(resp))
        .catch(error => console.log(error))
    }

    const insertGuest = () => {
        APIService.InsertGuest({name, surname})
        .then(resp => props.insertedGuest(resp))
        .catch(error => console.log(error))

    }
    
    
    return (
        <div>
            {props.guest ? (
                <div className = "mb-3">
                <label htmlFor="name" className="form-label">name</label>
                <input type="text" className="form-control"
                value={name}
                placeholder="Pleast type your name"
                onChange={(e) => setName(e.target.value)}
                />
                <label htmlFor="surname" className="form-label">surname</label>
                <textarea 
                row = "5"
                value={surname}
                onChange={(e) => setSurame(e.target.value)}
                className="form-control"
                placeholder="Pleast type your surname"
                />

                {
                    props.guest.id ? <button
                    onClick={updateGuest}
                    className = "btn btn-success mt-3"
                    >Update</button>
                    :
                    <button
                    onClick={insertGuest}
                    className = "btn btn-success mt-3"
                    >Update</button>
                    
                }
                </div>
            
            ):null}
        </div>
    )  
}
export default Form