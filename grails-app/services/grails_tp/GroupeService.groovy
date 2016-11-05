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

    def listSubGroupes(Groupe groupe, int level) {
        def map = [:]

        groupe.groupes.each {subGroupe ->
            //map.put(subGroupe, new Tuple(subGroupe, level))
            map.put(subGroupe, level)
            if(!subGroupe.groupes.empty) {
                map.putAll(listSubGroupes(subGroupe, level + 1))
            }
        }

        return map
    }

    def updateActivitiesList(String listeActivites) {
        // format : id_groupe1:id_act1,id_act2;id_groupe2:id_act1,id_act2,id_act3

        println(listeActivites)
        def listeActivitesParGroupe = listeActivites.split(';')
        listeActivitesParGroupe.each {liste ->
            def tuple = liste.split(':')
            def idGroupe = tuple[0]
            def groupe = Groupe.get(idGroupe)
            def activites = ""

            if(tuple.length > 1) {
                activites = tuple[1]
            }

            updateActiviteIndicesParGroupe(groupe, activites)
        }
    }

    def updateActiviteIndicesParGroupe(Groupe groupe, String idsActivites) {
        def listeFinale = []
        def listeIds = []
        if(!idsActivites.isEmpty()) {
            listeIds = idsActivites.split(',')
        }

        def toutesActivitesDuGroupe = groupe.activites;
        groupe.activites.removeAll(toutesActivitesDuGroupe);

        /*groupe.activites.each {a ->
            groupe.activites.remove(a)
        }*/

        def activitesDuGroupe = []
        listeIds.each {act ->
            Activite a = Activite.get(act)
            activitesDuGroupe.push(a)

            //groupe.activites.remove(a)
            //groupe.save(flush: true, failOnError: true)

            //def activite = groupe.activites.find { a -> a.id == Long.parseLong(act)  }
            //listeFinale.push(activite)
        }
        //groupe.activites = listeFinale

        activitesDuGroupe.each { activite ->
            groupe.activites.add(activite)
            //groupe.save(flush: true, failOnError: true)
        }

        groupe.save(flush:true, failOnError:true)
    }

    /*def buildListSubGroupes(Groupe groupe) {
        def liste = []

        groupe.groupes.each {subGroupe ->
            liste.add(subGroupe)
            if(!subGroupe.groupes.empty) {
                liste.addAll(buildListSubGroupes(subGroupe))
            }
        }

        return liste
    }*/
}
