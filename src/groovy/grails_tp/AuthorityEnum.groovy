package grails_tp


enum AuthorityEnum {
    OP( 'ROLE_OP' ),
    MOD( 'ROLE_MOD' ),
    ADMIN( 'ROLE_ADMIN' )

    private final String authority;

    AuthorityEnum( String authority ) {
        this.authority = authority;
    }
}