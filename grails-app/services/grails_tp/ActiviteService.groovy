package grails_tp

import grails.transaction.Transactional

@Transactional
class ActiviteService {

    def createActivite(String nom, String description, Double lat, Double lng, User auteur, List<Integer> idsGroupes) {
        def activite = new Activite(nom: nom, description: description, lat: lat, lng: lng, auteur: auteur)
        activite.save(flush: true, failOnError: true)

        idsGroupes.each { idGroupe ->
            def groupe = Groupe.get(idGroupe)
            groupe.activites.add(activite)
            groupe.save(flush: true, failOnError: true)
        }
    }
}
