package grails_tp

import org.springframework.security.access.annotation.Secured

class IndexController {
    def groupeService

    @Secured('IS_AUTHENTICATED_FULLY')
    def index() {
        def listSuperGroupes = groupeService.listSuperGroupes()
        render (view: "/index/index", model: [listSuperGroupes:listSuperGroupes])
    }

}
