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
            list.add(Integer.valueOf(8))
            list.add(Integer.valueOf(10))
            list.add(Integer.valueOf(15))
            def activite1 = activiteService.createActivite("activité1", "bla bl bla bla", 43.725211668016534, 7.306079864501953, op, list)
            println(activite1);
            list = []
            list.add(Integer.valueOf(7))
            list.add(Integer.valueOf(10))
            list.add(Integer.valueOf(15))
            def activite2 = activiteService.createActivite("activité2", "bla bl bla bla", 43.72024932899604, 7.328739166259766, op, list)
            println(activite2);
            list = []
            list.add(Integer.valueOf(21))
            list.add(Integer.valueOf(10))
            list.add(Integer.valueOf(15))
            def activite3 = activiteService.createActivite("activité3", "bla bl bla bla", 43.74431283565998, 7.211666107177734, op, list)
            println(activite3);
            list = []
            list.add(Integer.valueOf(21))
            list.add(Integer.valueOf(10))
            list.add(Integer.valueOf(15))
            def activite4 = activiteService.createActivite("activité4", "bla bl bla bla", 43.676811329698296, 7.176990509033203, op, list)
            println(activite4);
            list = []
            list.add(Integer.valueOf(21))
            list.add(Integer.valueOf(10))
            list.add(Integer.valueOf(15))
            def activite5 = activiteService.createActivite("activité5", "bla bl bla bla", 43.67879775320724, 7.335605621337891, op, list)
            println(activite5);
            list = []
            list.add(Integer.valueOf(21))
            list.add(Integer.valueOf(10))
            list.add(Integer.valueOf(15))
            def activite6 = activiteService.createActivite("activité6", "bla bl bla bla", 43.76117633310127, 7.406330108642578, op, list)
            println(activite6);
            list = []
            list.add(Integer.valueOf(21))
            list.add(Integer.valueOf(10))
            list.add(Integer.valueOf(15))
            def activite7 = activiteService.createActivite("activité7", "bla bl bla bla", 43.76117633310127, 7.406330108642578, op, list)
            println(activite7);
            list = []
            list.add(Integer.valueOf(21))
            list.add(Integer.valueOf(9))
            list.add(Integer.valueOf(15))
            def activite8 = activiteService.createActivite("activité8", "bla bl bla bla", 43.76117633310127, 7.406330108642578, op, list)
            println(activite8);
            list = []
            list.add(Integer.valueOf(21))
            list.add(Integer.valueOf(9))
            list.add(Integer.valueOf(15))
            def activite9 = activiteService.createActivite("activité9", "bla bl bla bla", 43.76117633310127, 7.406330108642578, op, list)
            println(activite9);
            list = []
            list.add(Integer.valueOf(21))
            list.add(Integer.valueOf(9))
            list.add(Integer.valueOf(15))
            def activite10 = activiteService.createActivite("activité10", "bla bl bla bla", 43.76117633310127, 7.406330108642578, op, list)
            println(activite10);
            list = []
            list.add(Integer.valueOf(21))
            list.add(Integer.valueOf(9))
            list.add(Integer.valueOf(15))
            def activite11 = activiteService.createActivite("activité11", "bla bl bla bla", 43.76117633310127, 7.406330108642578, op, list)
            println(activite11);
            list = []
            list.add(Integer.valueOf(21))
            list.add(Integer.valueOf(9))
            list.add(Integer.valueOf(15))
            def activite12 = activiteService.createActivite("activité12", "bla bl bla bla", 43.76117633310127, 7.406330108642578, op, list)
            println(activite12);

            userService.grantRole(modop.id, roleMod.id)
        } catch(e) {
            println e
        }
    }
    def destroy = {
    }
}
