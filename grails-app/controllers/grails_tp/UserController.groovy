package grails_tp

import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.access.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    SpringSecurityService springSecurityService
    def userService

    @Secured('IS_AUTHENTICATED_FULLY')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        def currentUser = springSecurityService.getCurrentUser()
        def roles = currentUser.getAuthorities()
        def roleCurrentUser = roles.getAt(0)
        if(roleCurrentUser.authority.equals("ROLE_ADMIN")) {
            respond User.list(params), model:[userInstanceCount: User.count()]
        } else {
            def usersTemp = User.list(params)
            def users = []

            usersTemp.each {u ->
                if(u.isSameAuthority("ROLE_OP") || (u.isSameAuthority("ROLE_MOD") && u.id == currentUser.id))
                {
                    users.push(u)
                }
            }

            respond users, model:[userInstanceCount: users.size()]
        }

    }

    @Secured('IS_AUTHENTICATED_FULLY')
    def show(User userInstance) {
        respond userInstance
    }

    @Secured('permitAll')
    def create() {
        //redirect(controller: "index", action: "list")
        respond new User(params)
    }

    @Secured('permitAll')
    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        def role = Role.get(3)

        if(params.authority && !params.authority.equals("ROLE_OP")) {
            role = Role.findByAuthority(params.authority)
        }

        userInstance = userService.createUser(userInstance.username, userInstance.password, role)

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    @Secured('IS_AUTHENTICATED_FULLY')
    def edit(User userInstance) {
        respond userInstance
    }

    @Secured('IS_AUTHENTICATED_FULLY')
    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }
        userInstance.password = params.newpassword

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        //def currentUser = springSecurityService.getCurrentUser()

        def oldRoleName = userInstance.authorities.getAt(0).authority
        if(params.authority && !userInstance.isSameAuthority(params.authority)) {
            userService.changeAutority(userInstance, oldRoleName, params.authority)
            /*def userRole = userService.grantRole(userInstance, newRole)
            if(userRole)
            {
                println("role criado")
            }*/
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }
    @Secured('ROLE_ADMIN')
    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userService.deleteUser(userInstance)

        //userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
