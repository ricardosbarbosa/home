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
  end

  role :sindico do
    includes :guest
    includes :condomino
  end
end
