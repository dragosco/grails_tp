package grails_tp


enum AuthorityEnum {
    OP( 'op' ),
    MOD( 'mod' ),
    ADMIN( 'admin' )

    private final String authority;

    AuthorityEnum( String authority ) {
        this.authority = authority;
    }
}