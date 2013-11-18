package BackWrite::I18N::pt;
use Mojo::Base 'BackWrite::I18N::Base';

has 'Lexicon' => sub {
    {
        'lbl_messages'     => 'Mensagens',
        'lbl_contacts'     => 'Contatos',
        'lbl_champaigns'   => 'Campanhas',
        'lbl_notes'        => 'Notas',
        'lbl_projects'     => 'Projetos',
        'lbl_tasks'        => 'Tarefas',
        'lbl_users'        => 'Usuarios',
        'lbl_activities'   => 'Atividades',
        'lbl_user_profile' => 'Perfil de Usuario',
        'lbl_sign_out'     => 'Sair',
        'lbl_sign_as'      => 'Logado como ',

        'lbl_name'           => 'Nome',
        'lbl_action'         => 'A&ccedil;&atilde;o',
        'lbl_type'           => 'Tipo',
        'lbl_created'        => 'Criado',
        'lbl_description'    => 'Descri&ccedil;&atilde;o',
        'lbl_job'            => 'Profiss&atilde;o',
        'lbl_company'        => 'Empresa',
        'lbl_street'         => 'Endere&ccedil;o',
        'lbl_city'           => 'Cidade',
        'lbl_state'          => 'Estado',
        'lbl_zip'            => 'CEP',
        'lbl_contact_type'   => 'Tipo de Contato',
        'lbl_none'           => 'Nenhum',
        'lbl_email'          => 'E-mail',
        'lbl_website'        => 'Website',
        'lbl_phone'          => 'Telefone',
        'lbl_mobile'         => 'Celular',
        'lbl_contact_active' => 'O contato esta ativo?',
        'lbl_default'        => 'Padr&atilde;o',
        'lbl_password'       => 'Senha',
        'lbl_about'          => 'Sobre',
        'lbl_language'       => 'Idioma',
        'lbl_role'           => 'Papel',
        'lbl_admin'          => 'Administrador',
        'lbl_yes'            => 'Sim',
        'lbl_no'             => 'N&atilde;o',
        'lbl_status'         => 'Status',
        'lbl_start_date'     => 'Data de Inicio',
        'lbl_end_date'       => 'Data de T&eacute;rmino',
        'lbl_cost'           => 'Custo',
        'lbl_finished'       => 'Concluido',
        'lbl_champaign_active' => 'A campanha esta ativa?',
        'lbl_previous'       => 'Anterior',
        'lbl_next'           => 'Proximo',

        # title and subtitle
        'lbl_dashboard'               => 'Dashboard',
        'lbl_dashboard_subtitle'      => 'Bivee CRM Dashboard',
        'lbl_contact_list'            => 'Lista de Contatos',
        'lbl_contact_list_subtitle'   => 'lista de todos os contatos',
        'lbl_contact_form'            => 'Manter Contato',
        'lbl_contact_form_subtitle'   => 'criar ou editar um contato',
        'lbl_user_list'               => 'Lista de Usu&aacute;rio',
        'lbl_user_list_subtitle'      => 'lista de todos os usu&aacute;rios',
        'lbl_user_form'               => 'Manter Usu&aacute;rio',
        'lbl_user_form_subtitle'      => 'criar ou editar um usu&aacute;rio',
        'lbl_project_list'            => 'Lista de Projetos',
        'lbl_project_list_subtitle'   => 'lista de todos os projetos',
        'lbl_project_form'            => 'Manter Projetos',
        'lbl_project_form_subtitle'   => 'criar ou editar um projetos',
        'lbl_champaign_list'          => 'Lista de Campanhas',
        'lbl_champaign_list_subtitle' => 'lista de todas as campanhas',
        'lbl_champaign_form'          => 'Manter Campanhas',
        'lbl_champaign_form_subtitle' => 'criar ou editar uma campanha',

        # messages
        #'lbl_ask_remove_project' => 'Are you sure that you want to remove project?',
        'lbl_ask_remove_project' => 'Tem certeza que quer remover o projeto?',


        # tooltip
        'ttp_edit_contact'   => 'Editar Contato',
        'ttp_remove_contact' => 'Remover Contato',

        # buttons
        'btn_back'            => 'Voltar',
        'btn_import_contacts' => 'Importar Contatos',
        'btn_create_new'      => 'Criar Novo',
        'btn_back_list'       => 'Ir para Listagem',
        'btn_help'            => 'Ajuda',
        'btn_save'            => 'Salvar',
        'btn_cancel'          => 'Cancelar',

        # dashboard page
        'lbl_last_acts'     => 'Ultimas Atividades',
        'lbl_last_contacts' => 'Ultimos Contatos',
        'lbl_last_projects' => 'Ultimos Projetos',
        'lbl_last_tasks'    => 'Ultimas Tarefas',
        'lbl_show_all'      => 'ver mais',

        # values and lists
        'lst_user_language' => {
            'en' => 'Ingl&ecirc;s (en-US)',
            'pt' => 'Portugu&ecirc;s (pt-BR)',
        },
        'lst_contact_type' => {
            1 => 'Conta',
            2 => 'Empresa',
            3 => 'Cliente',
        },

    };
};

1;
