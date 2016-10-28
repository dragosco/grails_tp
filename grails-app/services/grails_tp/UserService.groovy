package grails_tp


import grails.transaction.Transactional


@Transactional
class UserService {

    def createUser (String username, String password, Role role) {
        def user = new User(username: username, password: password).save(flush: true, failOnError: true)
        UserRole.create(user, role)

        return user
    }

    def grantRole (long userId, long newRoleId) {
        def user = User.get(userId)
        def newRole = Role.get(newRoleId)

        def userRole = new UserRole(user, newRole)
        userRole.save(flush: true, failOnError: true)
    }
}
