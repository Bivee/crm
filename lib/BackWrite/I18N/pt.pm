package BackWrite::I18N::pt;
use Mojo::Base 'BackWrite::I18N::Base';

has 'Lexicon' => sub {
    {
        # Default
        'website_title' => 'Bivee CRM',
        'website_footer_company' => 'Desenvolvido pela empresa',
        'website_footer_license' => qq{This program is free software; you can redistribute it and/or modify it under
     the terms of the Perl 5 programing language system license itself.},

        # Top Menu
        'topmenu_user_profile' => 'Perfil de Usuario',
        'topmenu_messages'     => 'Mensagens',
        'topmenu_activities'   => 'Atividades',
        'topmenu_sign_out'     => 'Sair',

        # Left Side Main Menu
        'menu_messages'     => 'Mensagens',
        'menu_contacts'     => 'Contatos',
        'menu_champaigns'   => 'Campanhas',
        'menu_notes'        => 'Notas',
        'menu_projects'     => 'Projetos',
        'menu_tasks'        => 'Tarefas',
        'menu_users'        => 'Usuarios',
        'menu_activities'   => 'Atividades',
        'menu_helps'        => 'T&oacute;picos de Ajuda',

        # Dashboard
        'dashboard_title' => 'Dashboard',
        'dashboard_subtitle' => 'Bivee CRM Dashboard',
        'dashboard_welcome' => 'Bem vindo ao Bivee CRM',
        'dashboard_last_contacts' => 'Ultimos Contatos',
        'dashboard_no_contacts_found' => 'Nenhuma atividade sobre contatos!',
        'dashboard_last_tasks' => 'Ultimas Tarefas',
        'dashboard_no_tasks_found' => 'Nenhuma atividade sobre tarefas!',

        # Contacts
        'contact_list_title'      => 'Lista de Contatos',
        'contact_list_subtitle'   => 'lista de todos os contatos',
        'contact_form_title'      => 'Manter Contato',
        'contact_form_subtitle'   => 'criar ou editar um contato',

        'contact_ttp_edit'   => 'Editar Contato',
        'contact_ttp_remove' => 'Remover Contato',


        # User
        'user_list_title'         => 'Lista de Usu&aacute;rio',
        'user_list_subtitle'      => 'lista de todos os usu&aacute;rios',
        'user_form_title'         => 'Manter Usu&aacute;rio',
        'user_form_subtitle'      => 'criar ou editar um usu&aacute;rio',

        'user_ttp_edit'   => 'Editar Usuario',
        'user_ttp_remove' => 'Remover Usuario',



        # labels
        'lbl_show_all' => 'ver mais',


        # title and subtitle
        'project_list'            => 'Lista de Projetos',
        'project_list_subtitle'   => 'lista de todos os projetos',
        'project_form'            => 'Manter Projetos',
        'project_form_subtitle'   => 'criar ou editar um projetos',
        'champaign_list'          => 'Lista de Campanhas',
        'champaign_list_subtitle' => 'lista de todas as campanhas',
        'champaign_form'          => 'Manter Campanhas',
        'champaign_form_subtitle' => 'criar ou editar uma campanha',

        # fields and others
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
        'lbl_close'          => 'Fechar',


        # messages
        'lbl_no_tasks_found' => 'Nenhuma tarefa encontrada',
        'lbl_no_contacts_found' => 'Nenhum contato encontrado',
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


        'at_hour' => '&agrave;s',

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

        # replacement container
        'replace_for' => {
            'at_hour' => '&agrave;s',
            'creates' => 'criou',
            'edits' => 'editou',
            'removes' => 'removeu',
            'Contact' => 'Contato',
        },

    };
};

1;
