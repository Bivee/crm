package BackWrite::I18N::en;
use Mojo::Base 'BackWrite::I18N::Base';

has 'Lexicon' => sub{
    {
        'lbl_messages'     => 'Messages',
        'lbl_contacts'     => 'Contacts',
        'lbl_champaigns'   => 'Champaigns',
        'lbl_notes'        => 'Notes',
        'lbl_projects'     => 'Projects',
        'lbl_tasks'        => 'Tasks',
        'lbl_users'        => 'Users',
        'lbl_activities'   => 'Activities',
        'lbl_user_profile' => 'User Profile',
        'lbl_sign_out'     => 'Sign Out',
        'lbl_sign_as'      => 'Signed In as ',

        'lbl_name'           => 'Name',
        'lbl_action'         => 'Action',
        'lbl_type'           => 'Type',
        'lbl_created'        => 'Created',
        'lbl_description'    => 'Description',
        'lbl_job'            => 'Job',
        'lbl_company'        => 'Company',
        'lbl_street'         => 'Address',
        'lbl_city'           => 'City',
        'lbl_state'          => 'State',
        'lbl_zip'            => 'CEP',
        'lbl_contact_type'   => 'Contact Type',
        'lbl_none'           => 'None',
        'lbl_email'          => 'E-mail',
        'lbl_website'        => 'Website',
        'lbl_phone'          => 'Phone',
        'lbl_mobile'         => 'Mobile Phone',
        'lbl_contact_active' => 'Contact is active?',
        'lbl_default'        => 'Default',
        'lbl_password'       => 'Password',
        'lbl_about'          => 'About',
        'lbl_language'       => 'Language',
        'lbl_role'           => 'Role',
        'lbl_admin'          => 'Administrator',

        # title and subtitle
        'lbl_dashboard'             => 'Dashboard',
        'lbl_dashboard_subtitle'    => 'Bivee CRM Dashboard',
        'lbl_contact_list'          => 'Contact List',
        'lbl_contact_list_subtitle' => 'list of all contacts',
        'lbl_contact_form'          => 'Contact Form',
        'lbl_contact_form_subtitle' => 'create or edit a contact',
        'lbl_user_list'             => 'User List',
        'lbl_user_list_subtitle'    => 'list of all users',
        'lbl_user_form'             => 'User Form',
        'lbl_user_form_subtitle'    => 'create or edit an user',


        # tooltip
        'ttp_edit_contact'   => 'Edit Contact',
        'ttp_remove_contact' => 'Remove Contact',

        # buttons
        'btn_back'            => 'Back',
        'btn_import_contacts' => 'Import Contacts',
        'btn_create_new'      => 'Create New',
        'btn_back_list'       => 'Back to List',
        'btn_help'            => 'Help',
        'btn_save'            => 'Save',
        'btn_cancel'          => 'Cancel',

        # dashboard page
        'lbl_last_acts'     => 'Last Activities',
        'lbl_last_contacts' => 'Last Contacts',
        'lbl_last_projects' => 'Last Projects',
        'lbl_last_tasks'    => 'Last Tasks',
        'lbl_show_all'      => 'see more',

        # values and lists
        'lst_user_language' => {
            'en' => 'English (en-US)',
            'pt' => 'Portuguese (pt-BR)',
        },
        'lst_contact_type' => {
            1 => 'Account',
            2 => 'Company',
            3 => 'Client',
        }
    }
};

1;
