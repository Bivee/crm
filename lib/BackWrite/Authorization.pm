package BackWrite::Authorization;

# methods
sub allow_to {
    my ($class, $roles, $c, $redirect_to) = @_;

    # signedin user
    my $user = $c->current_user;

    # access allowed
    return 1 
        if $user && $user->column('role') ~~ @$roles;

    # access denied
    return $c->redirect_to($redirect_to) if $redirect_to;

    return 0;
}


1;
