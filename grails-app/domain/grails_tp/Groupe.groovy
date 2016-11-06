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
        auteur  nullable: true
    }

    static mapping = {
        groupes sort: 'id', order: 'asc'
    }

    def isSuperGroupe() {
        // parentId == 1 signifie que le parent est le groupe Aucun
        return parentId == 1
    }
}
