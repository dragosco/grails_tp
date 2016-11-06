package grails_tp

import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.access.annotation.Secured
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GroupeController {
    def grailsApplication
    def groupeService
    SpringSecurityService springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    @Secured('IS_AUTHENTICATED_FULLY')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Groupe.list(params), model:[groupeInstanceCount: Groupe.count()]
    }

    @Secured('IS_AUTHENTICATED_FULLY')
    def show(Groupe groupeInstance) {
        def listSubGroupes = groupeService.listSubGroupes(groupeInstance, 0)
        render (view: "/groupe/show", model: [listSubGroupes:listSubGroupes, groupeInstance: groupeInstance])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    def create() {

        respond new Groupe(params)
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    @Transactional
    def save(Groupe groupeInstance) {
        groupeInstance.auteur = springSecurityService.getCurrentUser()

        def parent = Groupe.get(params.parent.id)
        if (parent) {
            groupeInstance.parent = parent
        }

        /*def file = request.getFile('image')
        if (!file.empty) {
            File fileDest = new File(grailsApplication.config.images.groupes.path, file.getOriginalFilename())
            file.transferTo(fileDest)
        }
        Photo photo = new Photo(nom:file.getOriginalFilename()).save(flush: true, failOnError: true)

        groupeInstance.photo = photo
        groupeInstance.validate()*/

        if (groupeInstance == null) {
            notFound()
            return
        }

        /*if (groupeInstance.hasErrors()) {
            respond groupeInstance.errors, view:'create'
            return
        }*/

        groupeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect groupeInstance
            }
            '*' { respond groupeInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    def edit(Groupe groupeInstance) {
        def listSubGroupes = groupeService.listSubGroupes(groupeInstance, 0)
        respond groupeInstance, model:[listSubGroupes:listSubGroupes]
        //respond groupeInstance
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    @Transactional
    def update(Groupe groupeInstance) {
        groupeInstance.auteur = springSecurityService.getCurrentUser()

        def parent = Groupe.get(params.parent.id)
        if (parent) {
            groupeInstance.parent = parent
        }

        groupeService.updateActivitiesList(params.listeActivites)

        /*def file = request.getFile('image')
        if (!file.empty) {
            File fileDest = new File(grailsApplication.config.images.groupes.path, file.getOriginalFilename())
            file.transferTo(fileDest)
        }
        Photo photo = new Photo(nom:file.getOriginalFilename()).save(flush: true, failOnError: true)

        groupeInstance.photo = photo
        groupeInstance.validate()*/


        if (groupeInstance == null) {
            notFound()
            return
        }

        if (groupeInstance.hasErrors()) {
            respond groupeInstance.errors, view:'edit'
            return
        }

        groupeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect groupeInstance
            }
            '*'{ respond groupeInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    @Transactional
    def delete(Groupe groupeInstance) {

        if (groupeInstance == null) {
            notFound()
            return
        }

        groupeService.deleteGroupe(groupeInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Groupe.label', default: 'Groupe'), groupeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
