authorization do

  role :admin do
    has_permission_on [:residenciais], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:apartamentos], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:users], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
    has_permission_on [:areas], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  role :guest do

  end

  role :condomino do
    includes :guest
    has_permission_on [:comentarios], :to => [:create]
    has_permission_on :comentarios, :to => [:destroy] do
      if_attribute :user => is { user }
    end

    has_permission_on [:eventos], :to => [:index, :show]  do
        if_attribute :residencial_id => is { user.apartamento.residencial_id }
    end

    has_permission_on [:arquivos], :to => [:index, :show]  do
            if_attribute :residencial_id => is { user.apartamento.residencial_id }
        end

    has_permission_on [:reservas], :to => [:index, :show, :new, :create]
    has_permission_on [:reservas], :to => [ :edit ]  do
        if_attribute :user => is { user }, :status => is { 'Aguardando Aprovação' }
    end
    has_permission_on [:reservas], :to => [ :destroy ]  do
        if_attribute :user => is { user } }
    end

    has_permission_on [:users], :to => [ :edit, :update]   do
       if_attribute :id => is { user.id }
       if_attribute :email => is { user.email }
     end

    has_permission_on [:residenciais], :to => [ :vizinhos]   do
       if_attribute :apartamento => {:users => contains { user}}
     end

  end

  role :sindico do
    includes :guest
    includes :condomino

    has_permission_on [:eventos], :to => [:new, :create, :edit, :update, :destroy]
    has_permission_on [:arquivos], :to => [:new, :create, :destroy]

    has_permission_on [:areas], :to => [:new, :create, :edit, :update, :destroy]

    has_permission_on [:areas], :to => [:index, :show]  do
        if_attribute :residencial_id => is { user.apartamento.residencial_id }
    end

    has_permission_on [:reservas], :to => [:update, :edit ]

  end
end
