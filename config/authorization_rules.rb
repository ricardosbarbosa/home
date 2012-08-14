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

  end

  role :sindico do
    includes :guest
    includes :condomino
  end
end
