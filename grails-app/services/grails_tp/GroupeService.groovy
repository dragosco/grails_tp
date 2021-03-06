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

    def listSubGroupsWithLevel(Groupe groupe, int level) {
        def map = [:]

        groupe.groupes.each {subGroupe ->
            //map.put(subGroupe, new Tuple(subGroupe, level))
            map.put(subGroupe, level)
            if(!subGroupe.groupes.empty) {
                map.putAll(listSubGroupsWithLevel(subGroupe, level + 1))
            }
        }

        return map
    }

    def listSubGroups(Groupe groupe) {
        def list = []

        groupe.groupes.each {subGroupe ->
            list.add(subGroupe)
            if(!subGroupe.groupes.empty) {
                list.addAll(listSubGroups(subGroupe))
            }
        }

        return list
    }

    def findSuperGroupForSubGroup(Groupe groupe) {
        if(groupe.isSuperGroupe()) {
            return groupe
        }
        findSuperGroupForSubGroup(groupe.parent)
    }

    def getNewActivities(Groupe groupe, Map subGroups) {
        def allActivites = Activite.list()

        if(groupe.isSuperGroupe()) {
            // retire toutes les activités déjà presentes dans le groupe
            groupe.activites.each { a ->
                allActivites.remove(a)
            }

            // retire toutes les activités déjà presentes dans un des sous-groupes du groupe
            subGroups.each { g ->
                g.getKey().activites.each { a ->
                    allActivites.remove(a)
                }
            }
        } else {
            def superGroupe = findSuperGroupForSubGroup(groupe)
            def listSubGroups = listSubGroups(superGroupe)

            // retire toutes les activités déjà presentes dans n'importe quel sous-groupe du super groupe auquel le groupe en edition appartient
            listSubGroups.each { g ->
                g.activites.each { a ->
                    allActivites.remove(a)
                }
            }
        }

        return allActivites
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

    def deleteGroupe(Groupe groupe) {
        // supprimer sous-groupes
        def listeChildren = Groupe.findAll("from Groupe as g where g.parent.id = :parentId",
                [parentId: groupe.id])

        listeChildren.each {g ->
            deleteGroupe(g)
            //g.delete(flush: true, failOnError: true)
        }

        groupe.activites.each {a ->
            a.groupes.remove(groupe)
            a.save(flush: true, failOnError: true)
        }

        //deleteGroupe(groupe)

        groupe.delete(flush: true, failOnError: true)
    }

    /*def deleteChildrenGroupes(Groupe groupe) {
        def listeChildren = Groupe.findAll("from Groupe as g where g.parent.id = :parentId",
                [parentId: groupe.id])

        listeChildren.each {g ->
            g.activites.each {a ->
                a.groupes.remove(groupe)
                a.save(flush: true, failOnError: true)
            }

            deleteChildrenGroupes(g)

            groupe.delete(flush: true, failOnError: true)
        }
    }*/

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
