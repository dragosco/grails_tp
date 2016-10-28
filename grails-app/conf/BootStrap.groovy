import grails_tp.ActiviteService
import grails_tp.GroupeService
import grails_tp.Photo
import grails_tp.Role
import grails_tp.User
import grails_tp.UserService

class BootStrap {

    UserService         userService
    GroupeService       groupeService
    ActiviteService     activiteService

    def init = { servletContext ->
        User op, mod, admin, modop
        try {
            def roleAdmin = new Role(authority: 'ROLE_ADMIN' ).save(flush: true, failOnError: true)
            def roleMod = new Role(authority: 'ROLE_MOD' ).save(flush: true, failOnError: true)
            def roleOp = new Role(authority: 'ROLE_OP' ).save(flush: true, failOnError: true)

            op = userService.createUser("thais", "123456", roleOp)
            mod = userService.createUser("dragos", "000000", roleMod)
            admin = userService.createUser("admin", "admin", roleAdmin)
            modop = userService.createUser("modop", "modop", roleOp)

            def photoEnv = new Photo(nom: 'environnement.jpg').save(flush: true, failOnError: true)
            def photoNivDiff = new Photo(nom: 'niveau_difficulté.jpg').save(flush: true, failOnError: true)
            def photoSaisons = new Photo(nom: 'saisons.jpg').save(flush: true, failOnError: true)
            def photoMontagne = new Photo(nom: 'montagne.jpg').save(flush: true, failOnError: true)

            //Création groupe racine
            def grNull      = groupeService.createGroupe("Aucun", admin, 0, 1)

            //Création supergroupes (niveau 1)
            def grEnv       = groupeService.createGroupe("Environnement", admin, 1, 1)
            def grNivDif    = groupeService.createGroupe("Niveau de difficulté", admin, 1, 2)
            def grSaison    = groupeService.createGroupe("Saison", admin, 1, 3)
            def grType      = groupeService.createGroupe("Type d'activité", admin, 1, 4)

            //Création groupes niveau 2
            def aquatique   = groupeService.createGroupe("Aquatique", admin, 2, 1)
            def terrestre   = groupeService.createGroupe("Terrestre", admin, 2, 1)
            def aerien      = groupeService.createGroupe("Aérien", admin, 2, 1)

            def facile      = groupeService.createGroupe("Facile", admin, 3, 1)
            def moyen       = groupeService.createGroupe("Moyen", admin, 3, 1)
            def difficile   = groupeService.createGroupe("Difficile", admin, 3, 1)

            def ete         = groupeService.createGroupe("Eté", admin, 4, 1)
            def automne     = groupeService.createGroupe("Automne", admin, 4, 1)
            def hiver       = groupeService.createGroupe("Hiver", admin, 4, 1)
            def printemps   = groupeService.createGroupe("Printemps", admin, 4, 1)

            def randonnee   = groupeService.createGroupe("Randonnée", admin, 5, 1)
            def accrobra    = groupeService.createGroupe("Accrobranche", admin, 5, 1)
            def parachute   = groupeService.createGroupe("Saut en parachute", admin, 5, 1)
            def bungee      = groupeService.createGroupe("Saut à l'élastique", admin, 5, 1)
            def ferratta    = groupeService.createGroupe("Via ferratta", admin, 5, 1)

            //Création groupes niveau 3
            def riviere     = groupeService.createGroupe("Rivière", admin, 6, 1)
            def lac         = groupeService.createGroupe("Lac", admin, 6, 1)
            def mer         = groupeService.createGroupe("Mer", admin, 6, 1)

            def montagne     = groupeService.createGroupe("Montagne", admin, 7, 1)
            def forêt        = groupeService.createGroupe("Forêt", admin, 7, 1)
            def ville        = groupeService.createGroupe("Ville", admin, 7, 1)

            def list = []
            list.add(Integer.valueOf(1))
            list.add(Integer.valueOf(2))
            list.add(Integer.valueOf(3))
            def activite1 = activiteService.createActivite("activité1", "bla bl bla bla", 45, 52, op, list)

            userService.grantRole(modop.id, roleMod.id)
        } catch(e) {
            println e
        }
    }
    def destroy = {
    }
}
