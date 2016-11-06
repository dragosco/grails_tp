package grails_tp


import grails.transaction.Transactional


@Transactional
class UserService {

    def createUser (String username, String password, Role role) {
        def user = new User(username: username, password: password).save(flush: true, failOnError: true)
        UserRole.create(user, role, true)

        return user
    }

    def changeAutority (User user, String oldRoleName, String newRoleName) {
        def oldRole = Role.findByAuthority(oldRoleName)
        def newRole = Role.findByAuthority(newRoleName)
        UserRole.remove(user, oldRole)
        UserRole.create(user, newRole, true)
    }

    def deleteUser(User user) {
        UserRole.removeAll(user, true)

        def activites = Activite.findAllByAuteur(user)
        activites.each { a ->
            a.auteur = null
            a.save(flush: true, failOnError: true)
        }

        def groupes = Groupe.findAllByAuteur(user)
        groupes.each { g ->
            g.auteur = null
            g.save(flush: true, failOnError: true)
        }

        user.delete(flush: true, failOnError: true)
    }

    def grantRole (User user, Role newRole) {
        UserRole.create(user, newRole, true)

        /*def userRole = new UserRole(user, newRole)
        userRole.save(flush: true, failOnError: true)*/
    }
}
