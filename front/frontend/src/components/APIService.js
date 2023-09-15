export default class APIService {
    static UpdateGuest(id, body) {
        return fetch(`http://ilb.local.com:5000/update/${id}/` , {
            'method':'PUT',
            headers: {
              'Content-Type':'application/json'
            },
            body: JSON.stringify(body)
          })
          .then(resp => resp.json())

    }

    static InsertGuest(body) {
        return fetch(`http://ilb.local.com:5000/add` , {
            'method':'POST',
            headers: {
              'Content-Type':'application/json'
            },
            body: JSON.stringify(body)
          })
          .then(resp => resp.json())

    }
    static deleteGuest(id) {
        return fetch(`http://ilb.local.com:5000/delete/${id}/` , {
            'method':'DELETE',
            headers: {
              'Content-Type':'application/json'
            },
          })
          
          

    }
}