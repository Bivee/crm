package BackWrite::Authentication;

use BackWrite::Model;

sub load_user {
    my ($class, $app, $uid) = @_;

    my $model = BackWrite::Model->init_db->resultset('User');
    return $model->find($uid);
}

sub validate_user {
    my ($class, $app, $username, $password, $extas) = @_;

    my $model = BackWrite::Model->init_db->resultset('User');
    my $user = $model->find({
        email => $username, password => $password
    });

    # user found
    return $user->id || undef if $user;

    return;
}

1;
