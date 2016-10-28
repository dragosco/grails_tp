package grails_tp

import grails.transaction.Transactional

@Transactional
class GroupeService {

    def createGroupe(String nom, User auteur, int idParent, int idPhoto) {
        def groupe = new Groupe(nom: nom, auteur: auteur)

        if ( idParent != 0 ) {
            def groupeParent = Groupe.get(idParent)
            groupe.parent = groupeParent
        }

        groupe.photo = Photo.get(idPhoto)

        groupe.save(flush: true, failOnError: true)
        return groupe
    }

    def listSuperGroupes() {
        def aucunGroupe = Groupe.get(1)
        def listeSuperGroupes = []
        Groupe.list().each {groupe ->
            if(groupe.parent == aucunGroupe) {
                listeSuperGroupes.add(groupe)
            }
        }
        return listeSuperGroupes
    }
}
