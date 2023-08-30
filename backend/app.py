from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import datetime
from flask_cors import CORS


app = Flask(__name__)
CORS(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:milosz@localhost:3306/flask'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.app_context().push()


db = SQLAlchemy(app)
mar = Marshmallow(app)


class Guests(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    surname = db.Column(db.String(100))
    date = db.Column(db.DateTime, default = datetime.datetime.now)

    def __init__(self, name, surname):
        self.name = name
        self.surname = surname

class Schema(mar.Schema):
    class Meta:
        fields = ('id', 'name', 'surname', 'date')

guest_schema = Schema()
guests_schema = Schema(many=True)
 
   
@app.route('/get')
def get(): 
    guests = Guests.query.all()
    reasults = guests_schema.dump(guests)
    return jsonify(reasults)

@app.route('/get/<id>/',methods = ['GET'])
def getone(id):   
    guest = Guests.query.get(id)
    reasults = guest_schema(guest)
    return jsonify(reasults)

@app.route('/add',methods = ['POST'])
def add_guest():
    name = request.json['name']
    surname = request.json['surname']

    guests = Guests(name, surname)
    db.session.add(guests)
    db.session.commit()
    return guest_schema.jsonify(guests)

@app.route('/delete/<id>/',methods = ['DELETE'])
def delete_guest(id):
    guest = Guests.query.get(id)
    db.session.delete(guest)
    db.session.commit()
    return guest_schema.jsonify(guest)

@app.route('/update/<id>/', methods = ['PUT'])
def update_guest(id):
    guest = Guests.query.get(id)
    
    name = request.json['name']
    surname = request.json['surname']
    
    guest.name = name
    guest.surname = surname

    db.session.commit()
    
    return guest_schema.jsonify(guest)

if __name__ == '__main__':
    app.run(debug=True)


