package grails_tp

class Activite {

    String      nom
    String      description
    Double      lat
    Double      lng
    User        auteur

    static hasMany = [photos:Photo, groupes:Groupe]

    static belongsTo = Groupe

    static constraints = {
        nom             nullable: false, blank: false, unique: true
        description     nullable: true
        lat             nullable: false
        lng             nullable: false
    }

    static mapping = {
        description     type: 'text'
    }
}
