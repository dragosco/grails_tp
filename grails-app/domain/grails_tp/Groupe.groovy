package grails_tp

class Groupe {

    String      nom
    User        auteur
    List        activites = []
    Photo       photo

    static hasOne = [parent:Groupe]
    static hasMany = [groupes:Groupe, activites:Activite]

    static constraints = {
        nom     nullable: false
        photo   nullable: true
    }

    static mapping = {
        groupes sort: 'id', order: 'asc'
    }
}
