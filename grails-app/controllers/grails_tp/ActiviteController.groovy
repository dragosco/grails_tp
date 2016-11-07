package grails_tp

import grails.plugin.springsecurity.SpringSecurityService

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.security.access.annotation.Secured

@Transactional(readOnly = true)
class ActiviteController {
    def grailsApplication
    def groupeService
    def activiteService
    SpringSecurityService springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured('IS_AUTHENTICATED_FULLY')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Activite.list(params), model:[activiteInstanceCount: Activite.count()]
    }

    @Secured('IS_AUTHENTICATED_FULLY')
    def show(Activite activiteInstance) {
        respond activiteInstance
    }

    @Secured('IS_AUTHENTICATED_FULLY')
    def create() {
        def listSuperGroupes = groupeService.listSuperGroupes()
        def listGroupeHierarchy = [:]
        listSuperGroupes.each { superGroupe ->
            listGroupeHierarchy.put(superGroupe, groupeService.listSubGroupsWithLevel(superGroupe, 0))
        }
        respond new Activite(params), model:[listSuperGroupes:listSuperGroupes, listGroupeHierarchy:listGroupeHierarchy]
    }

    @Secured('IS_AUTHENTICATED_FULLY')
    //@Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    @Transactional
    def save(Activite activiteInstance) {
        activiteInstance.auteur = springSecurityService.getCurrentUser()
        activiteInstance.groupes = []
        activiteInstance.lat = Double.parseDouble(params.lat)
        activiteInstance.lng = Double.parseDouble(params.lng)
        def listIds = params.groupList.split(',')
        def idsGroupes = []


        List fileList = request.getFiles('image') // 'files' is the name of the input
        def photoList = [];
        fileList.each { file ->
            if (!file.empty) {
                File fileDest = new File(grailsApplication.config.images.activites.path, file.getOriginalFilename())
                file.transferTo(fileDest)
                Photo photo = new Photo(nom:file.getOriginalFilename().replaceAll("\\s","%20")).save(flush: true, failOnError: true)
                activiteInstance.addToPhotos(photo)
            }
        }


        listIds.each { id ->
            if(id) {
                idsGroupes.add(id.toInteger())
            }
        }

        if (activiteInstance == null) {
            notFound()
            return
        }

        /*if (activiteInstance.hasErrors()) {
            respond activiteInstance.errors, view:'create'
            return
        }*/

        activiteService.createActivite(activiteInstance, idsGroupes)

        //activiteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'activite.label', default: 'Activite'), activiteInstance.id])
                redirect activiteInstance
            }
            '*' { respond activiteInstance, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    def edit(Activite activiteInstance) {
        def listSuperGroupes = groupeService.listSuperGroupes()
        def listGroupeHierarchy = [:]
        listSuperGroupes.each {superGroupe ->
            listGroupeHierarchy.put(superGroupe, groupeService.listSubGroupsWithLevel(superGroupe, 0))
        }
        def listIdGroupes = []
        activiteInstance.groupes.each {g ->
            listIdGroupes.add(g.id)
        }

        if(!listIdGroupes.isEmpty()) {
            def ids = listIdGroupes.toString()
            listIdGroupes = ids.substring(1,ids.length()-1)
        }

        respond activiteInstance, model:[listSuperGroupes:listSuperGroupes, listGroupeHierarchy:listGroupeHierarchy, listIdGroupes: listIdGroupes]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    @Transactional
    def update(Activite activiteInstance) {
        activiteInstance.groupes = []

        log.println(params.lat + "  " + params.lng)
        activiteInstance.lat = Double.parseDouble(params.lat)
        activiteInstance.lng = Double.parseDouble(params.lng)
        def listIds = params.groupList.split(',')
        def idsGroupes = []

        /*List fileList = request.getFiles('image') // 'files' is the name of the input
        def photoList = [];
        fileList.each { file ->
            if (!file.empty) {
                File fileDest = new File(grailsApplication.config.images.activites.path, file.getOriginalFilename())
                file.transferTo(fileDest)
                Photo photo = new Photo(nom:file.getOriginalFilename().replaceAll("\\s","%20")).save(flush: true, failOnError: true)
                activiteInstance.addToPhotos(photo)
            }
        }*/

        listIds.each {id ->
            idsGroupes.add(id.toInteger())
        }

        if (activiteInstance == null) {
            notFound()
            return
        }

        if (activiteInstance.hasErrors()) {
            respond activiteInstance.errors, view:'edit'
            return
        }

        activiteService.updateActivite(activiteInstance, idsGroupes)

        //activiteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Activite.label', default: 'Activite'), activiteInstance.id])
                redirect activiteInstance
            }
            '*'{ respond activiteInstance, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MOD'])
    @Transactional
    def delete(Activite activiteInstance) {

        if (activiteInstance == null) {
            notFound()
            return
        }

        activiteService.deleteActivite(activiteInstance)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Activite.label', default: 'Activite'), activiteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'activite.label', default: 'Activite'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
